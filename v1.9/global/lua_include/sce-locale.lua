print ("Loading sce-locale.lua from global scripts")

-- returns locale (en-US) and language only (us), useful for lookups with fallback.
GetLocaleLangPair = function()
	local locale, lang
	if AppHost_GetLocaleTag ~= nul then
		locale = AppHost_GetLocaleTag()
		lang = locale:sub(1,2)     -- grab first two digits, eg. en-US -> en 
	else
		-- a fallback is provided for regression testing purposes.
		-- this fallback can be removed by 10/01/2022
		lang = EM_GetNativeLanguage()
	end

	if locale ~= nil then
		print ("[BOOT] App Host Locale = ", locale)
	else
		print ("[BOOT] Deprecated Native Language = ", lang)
	end

	return locale, lang
end

FindLocaleTableKey = function(table, primary, fallback, default)
	-- try for a specific Locale, and if that fails fallback on just a language (without region),
	-- and if that fails fallback on default.

	local keyres = primary
	if keyres == nil or table[keyres] == nil then
		keyres = fallback
	end

	if keyres == nil or table[keyres] == nil then
		printf("WARNING: No table entry for locale '%s', using default '%s'\n", primary, default);
		keyres = default
	end

	return keyres
end
