print ("Loading disc-selection.lua from global scripts")
require "sce-locale"

-- Registers the discs for the active language using EM_SetCDRom().
-- This takes into account region switching if given 2 disc maps to use.
-- 
-- default_disc_map: Cannot be nil.  A table of the form 
-- {
-- 	en  = { <list of image paths> },
-- 	fr  = { <list of image paths> }, 
-- 	de  = { <list of image paths> }, 
-- 	it  = { <list of image paths> }, 
-- 	es  = { <list of image paths> }
-- }
--
-- ntsc_disc_map: Similar format to default_disc_map if region switching is supported.  Can be nil which
-- will use default_disc_map in its place.
--
-- default_crypts: Can be nil which indicated no crypt will be used.  A table of the form 
-- {
-- 	en = "0xad70",
-- 	fr = "0x7c23",
-- 	de = "0xacb8",
-- 	it = "0xea8a",
-- 	es = "0x1c3d",
-- }
--
-- ntsc_crypts: Similar format to pal_crypts.  If this is nil then the table from pal_crypts will be used.
-- If no crypt should be used then specify an empty table.
--

local ntsc_map
local pal_map

RegisterDiscs = function(default_disc_map, ntsc_disc_map, default_crypts, ntsc_crypts)

	ntsc_map = ntsc_disc_map
	pal_map = default_disc_map

	local region = EM_GetStoreRegion()
	print ("[BOOT] Region = ", region)
	
	local request_ntsc = EM_GetRequestNtscRegion()
	print ("[BOOT] Request NTSC region = ", request_ntsc)
	
	local reboot_id = EM_GetSettingCli("--reboot-title-id")
	print ("[BOOT] Reboot title id = ", reboot_id)

	if ntsc_disc_map == nil then
		ntsc_disc_map = default_disc_map
	end

	if default_crypts == nil then
		default_crypts = {}
	end

	if ntsc_crypts == nil then
		ntsc_crypts = default_crypts
	end

	local key = nil
	local discs = nil
	local crypt = nil
	local locale, lang = GetLocaleLangPair()
	local discs_map = nil
	local crypts = nil

	if request_ntsc then
		printf("[BOOT] NTSC preferred, using that image.")
		discs_map = ntsc_disc_map
		crypts = ntsc_crypts
	
	else
		printf("[BOOT] Registering default images for the region.")
		discs_map = default_disc_map
		crypts = default_crypts
	
	end

	key = FindLocaleTableKey(discs_map, locale, lang, "en")
	discs = discs_map[key]
	crypt = crypts[key]
	
	if reboot_id ~= "" and reboot_id ~= nil then
		maps = {}
		cmaps = {}
		-- Search current region first, in case of identical discs in both regions.
		if request_ntsc then
			maps[0] = ntsc_disc_map
			maps[1] = default_disc_map
			cmaps[0] = ntsc_crypts
			cmaps[1] = default_crypts
		else
			maps[0] = default_disc_map
			maps[1] = ntsc_disc_map
			cmaps[0] = default_crypts
			cmaps[1] = ntsc_crypts
		end
		local rebootsub = { string.sub(reboot_id, 1, 4), string.sub(reboot_id, 5) }
		print("Reboot subs: ", rebootsub[1], rebootsub[2])
		for i = 0,1 do
			for j in pairs(maps[i]) do
				for k in ipairs(maps[i][j]) do
					if string.match(maps[i][j][k], reboot_id) ~= nil or 
					  (string.match(maps[i][j][k], rebootsub[1]) ~= nil and string.match(maps[i][j][k], rebootsub[2]) ~= nil) then
					-- If discs_map ~= maps[i] then we've switched NTSC to PAL or vice versa.
						if discs_map ~= maps[i] then
							if discs_map[j] ~= nil then
								discs = discs_map[j]
								crypt = crypts[j]
							end
							goto done
						end
						discs = maps[i][j]
						crypt = cmaps[i][j]
						goto done
					end
				end
			end
		end
		
		-- Handle SIEJ titles that lack title id.
		if reboot_id == "SLPM00000" then
			if maps[0] ~= nil and maps[0]["ja"] ~= nil then
				discs = maps[0]["ja"]
				crypt = cmaps[0]["ja"]
			elseif maps[1] ~= nil and maps[1]["ja"] ~= nil then
				discs = maps[1]["ja"]
				crypt = cmaps[1]["ja"]
			end
		end
		
	end
	::done::

	local i
	for i, disc in ipairs(discs) do
		-- patch up for older versions of the emulator that didn't understand /imagedata/ prefix.
		-- [jstine] added 2023-02-01
		if EM_GetTitleVaultPath == nil then
			if string.match(disc, "^/xem_titlevault/data/") then
				disc = string.gsub(disc, "^/xem_titlevault/data/", "")
			elseif string.match(disc, "^/xem_imagedata/") then
				disc = string.gsub(disc, "^/xem_imagedata/", "")
			end
		end
		EM_SetCDRom(disc, i)
	end

	if crypt then
		EM_SetSettingCli("--libcrypt=" .. crypt)
	end

end

-- Called when loading a snapshot.
function LoadSnapshot(dest)
	-- Used to tell the emulator whether it can load the snapshot,
	-- what command line arguments to use, whether it needs to reboot,
	-- and what region we need to be in, etc.
	
	-- To start, we know the SKU Title ID number we're switching to, held in dest.
	-- Our goal here is to find out what we have to do to load that SKU from the
	-- current SKU (eg: do we need to reboot? What arguments do we need? etc.)
	
	print("====")
	print("LoadSnapshot")
	
	print("Dest: ", dest)
	
	-- Initialize return value to defaults.
	local rvalue = {}
	rvalue.valid = true
	rvalue.reboot = false
	rvalue.ntsc = true
	rvalue.cli = {}
	
	-- First, get info about the source, where we're coming from right now, like
	-- the language, locale and so on.
	local current = EM_GetDiscImageName()
	local current_discs = nil
	local current_key = nil
	local dest_discs = nil
	local dest_key = nil
	local dest_disc_num = 0
	
	print("Current: ", current)
	
	local destsub = { string.sub(dest, 1, 4), string.sub(dest, 5) }
	print("Dest subs: ", destsub[1], destsub[2])
	
	local request_ntsc = EM_GetRequestNtscRegion()
	print ("Request NTSC region = ", request_ntsc)
	
	maps = {}
	-- Search current region first, in case of identical discs in both regions.
	if request_ntsc then
		maps[0] = ntsc_map
		maps[1] = pal_map
	else
		maps[0] = pal_map
		maps[1] = ntsc_map
	end
	for i = 0,1 do
		print("i: ", i)
		for j in pairs(maps[i]) do
			for k in ipairs(maps[i][j]) do
				if (string.match(maps[i][j][k], current) ~= nil or current == maps[i][j][k]) and current_discs == nil then
					current_discs = maps[i]
					current_key = j
				end
				if (string.match(maps[i][j][k], dest) ~= nil or 
				(string.match(maps[i][j][k], destsub[1]) ~= nil and string.match(maps[i][j][k], destsub[2]) ~= nil)) and dest_discs == nil then
					dest_discs = maps[i]
					dest_key = j
					dest_disc_num = k - 1
				end
			end
		end
	end
	
	-- Handle SIEJ titles that lack title id.
	if dest == "SLPM00000" then
		if maps[0] ~= nil and maps[0]["ja"] ~= nil then
			dest_discs = maps[0]
			dest_key = "ja"
		elseif maps[1] ~= nil and maps[1]["ja"] ~= nil then
			dest_discs = maps[1]
			dest_key = "ja"
		end
	end
	if current == "SLPM00000" then
		if maps[0] ~= nil and maps[0]["ja"] ~= nil then
			current_discs = maps[0]
			current_key = "ja"
		elseif maps[1] ~= nil and maps[1]["ja"] ~= nil then
			current_discs = maps[1]
			current_key = "ja"
		end
	end
	
	print("current_key: ", current_key)
	print("dest_key: ", dest_key)
	print("dest_disc_num: ", dest_disc_num)
	
	-- Reboot is set any time the destination is not found in the current ntsc and locale/lang pair.
	
	-- Initially, set reboot to true, then if we find we don't need to, we'll set it to false.
	rvalue.reboot = true
	if current_discs == dest_discs and current_key == dest_key then
		rvalue.reboot = false
	end
	
	if dest_discs == ntsc_map then
		rvalue.ntsc = true
	else
		rvalue.ntsc = false
	end
	
	if dest_discs == nil or dest_key == nil then
		rvalue.valid = false
	end
	
	rvalue.disc = dest_disc_num
	
	print("====")
	
	return rvalue
	
end

if EM_AddSnapshotPreLoadedHook ~= nil then
	EM_AddSnapshotPreLoadedHook(LoadSnapshot)
end