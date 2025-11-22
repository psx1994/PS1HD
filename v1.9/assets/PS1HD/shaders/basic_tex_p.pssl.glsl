#version 450

const int _104[16] = int[](-4, 0, -3, 1, 2, -2, 3, -1, -3, 1, -4, 0, 3, -1, 2, -2);

layout(binding = 0, std140) uniform type_Base
{
    mat4 projection;
    uint semimode;
    uint texFlipX;
    uint texFlipY;
    uint tex_is_fb;
    uint texWindowMaskX;
    uint texWindowMaskY;
    uint texWindowOffsX;
    uint texWindowOffsY;
    vec2 InvTexSize;
    vec2 UVOffset;
    float invScale;
    float dither;
    uint textured;
    uint hasCLUT;
    uint semitrans;
    uint blending;
    uint copyback;
    uint opaqueBlack;
    uint replacement;
    uint evenodd;
    uint interlace;
    uint setMask;
    uint drawMask;
    uint use24bitColor;
} Base;

layout(binding = 2) uniform usampler2D SPIRV_Cross_CombinedindexedTexSPIRV_Cross_DummySampler;
layout(binding = 3) uniform usampler2D SPIRV_Cross_CombinedclutTexSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;
layout(binding = 1) uniform sampler2D SPIRV_Cross_CombinedfbSPIRV_Cross_DummySampler;

layout(location = 0) in vec4 in_var_COLOR;
layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 0) out vec4 out_var_SV_Target0;
layout(location = 1) out vec4 out_var_SV_Target1;

void main()
{
    ivec4 _114 = ivec4(in_var_COLOR * 255.0);
    if (Base.interlace != 0u)
    {
        uint _125 = uint(gl_FragCoord.y * Base.invScale) & 1u;
        bool _128 = Base.evenodd != 0u;
        bool _132;
        if (_128)
        {
            _132 = _125 != 1u;
        }
        else
        {
            _132 = false;
        }
        bool _141;
        if (!_132)
        {
            bool _140;
            if (!_128)
            {
                _140 = _125 != 0u;
            }
            else
            {
                _140 = false;
            }
            _141 = _140;
        }
        else
        {
            _141 = true;
        }
        if (_141)
        {
            discard;
        }
    }
    int _161 = _104[((uint(gl_FragCoord.y * Base.invScale) & 3u) * 4u) + (uint(gl_FragCoord.x * Base.invScale) & 3u)] * int(Base.dither);
    bool _164 = Base.textured != 0u;
    ivec4 _349;
    if (_164)
    {
        uvec2 _169 = uvec2(in_var_TEXCOORD1 + vec2(9.9999997473787516355514526367188e-05));
        vec2 _192 = ((vec2(uvec2((_169.x & Base.texWindowMaskX) | Base.texWindowOffsX, (_169.y & Base.texWindowMaskY) | Base.texWindowOffsY)) + vec2(0.5)) + Base.UVOffset) * Base.InvTexSize;
        vec2 _201;
        if (Base.texFlipX != 0u)
        {
            vec2 _200 = _192;
            _200.x = 1.0 - _192.x;
            _201 = _200;
        }
        else
        {
            _201 = _192;
        }
        vec2 _210;
        if (Base.texFlipY != 0u)
        {
            vec2 _209 = _201;
            _209.y = 1.0 - _201.y;
            _210 = _209;
        }
        else
        {
            _210 = _201;
        }
        ivec4 _275;
        if (Base.hasCLUT != 0u)
        {
            vec2 _219 = (fract(_210) * 1.0) / Base.InvTexSize;
            ivec3 _225 = ivec3(uvec3(uint(_219.x), uint(_219.y), 0u));
            ivec3 _232 = ivec3(uvec3(texelFetch(SPIRV_Cross_CombinedindexedTexSPIRV_Cross_DummySampler, _225.xy, _225.z).x, 0u, 0u));
            int _238 = int(texelFetch(SPIRV_Cross_CombinedclutTexSPIRV_Cross_DummySampler, _232.xy, _232.z).x);
            ivec4 _246 = ivec4(_238 & 31, (_238 >> 5) & 31, (_238 >> 10) & 31, (_238 >> 15) & 1);
            ivec4 _258;
            if (Base.use24bitColor != 0u)
            {
                ivec3 _256 = ivec3((vec3(_246.xyz) * 255.0) * vec3(0.0322580635547637939453125));
                _258 = ivec4(_256.x, _256.y, _256.z, _246.w);
            }
            else
            {
                _258 = _246;
            }
            _275 = _258;
        }
        else
        {
            vec4 _262 = texture(SPIRV_Cross_Combinedtexsampler0, _210);
            ivec4 _264 = ivec4(_262 * vec4(255.0, 255.0, 255.0, 1.0));
            ivec4 _274;
            if (!(Base.use24bitColor != 0u))
            {
                ivec3 _272 = _264.xyz >> ivec3(3);
                _274 = ivec4(_272.x, _272.y, _272.z, _264.w);
            }
            else
            {
                _274 = _264;
            }
            _275 = _274;
        }
        if (!(Base.replacement != 0u))
        {
            bool _291;
            if (!any(notEqual(_275, ivec4(0))))
            {
                _291 = !(Base.opaqueBlack != 0u);
            }
            else
            {
                _291 = false;
            }
            if (_291)
            {
                discard;
            }
        }
        ivec4 _323;
        if (Base.blending != 0u)
        {
            bool _304 = Base.use24bitColor != 0u;
            ivec3 _314 = clamp((((_275.xyz * _114.xyz) >> (ivec3((_304 ? 7 : 4)) & ivec3(31))).xyz + ivec3(_161)).xyz, ivec3(0), ivec3(511));
            ivec4 _322;
            if (!_304)
            {
                ivec3 _320 = _314.xyz >> ivec3(3);
                _322 = ivec4(_320.x, _320.y, _320.z, _275.w);
            }
            else
            {
                _322 = ivec4(_314.x, _314.y, _314.z, _275.w);
            }
            _323 = _322;
        }
        else
        {
            _323 = _275;
        }
        _349 = _323;
    }
    else
    {
        ivec4 _332 = ivec4(_114.xyz, (int(Base.semitrans != 0u)));
        ivec3 _337 = clamp((_332.xyz + ivec3(_161)).xyz, ivec3(0), ivec3(255));
        ivec4 _348;
        if (!(Base.use24bitColor != 0u))
        {
            ivec3 _346 = _337.xyz >> ivec3(3);
            _348 = ivec4(_346.x, _346.y, _346.z, _332.w);
        }
        else
        {
            _348 = ivec4(_337.x, _337.y, _337.z, _332.w);
        }
        _349 = _348;
    }
    bool _357 = Base.semitrans != 0u;
    bool _364;
    if (!_357)
    {
        _364 = Base.drawMask != 0u;
    }
    else
    {
        _364 = true;
    }
    ivec4 _432;
    if (_364)
    {
        ivec4 _374 = ivec4(texelFetch(SPIRV_Cross_CombinedfbSPIRV_Cross_DummySampler, ivec3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy, 0) * vec4(255.0, 255.0, 255.0, 1.0));
        ivec4 _384;
        if (!(Base.use24bitColor != 0u))
        {
            ivec3 _382 = _374.xyz >> ivec3(3);
            _384 = ivec4(_382.x, _382.y, _382.z, _374.w);
        }
        else
        {
            _384 = _374;
        }
        if (Base.drawMask != 0u)
        {
            if (float(_384.w) > 0.0)
            {
                discard;
            }
        }
        bool _400;
        if (_357)
        {
            _400 = float(_349.w) > 0.0;
        }
        else
        {
            _400 = false;
        }
        ivec4 _431;
        if (_400)
        {
            ivec4 _430;
            switch (Base.semimode)
            {
                case 0u:
                {
                    ivec3 _415 = (_384.xyz >> ivec3(1)) + (_349.xyz >> ivec3(1));
                    _430 = ivec4(_415.x, _415.y, _415.z, _349.w);
                    break;
                }
                case 1u:
                {
                    ivec3 _419 = _384.xyz + _349.xyz;
                    _430 = ivec4(_419.x, _419.y, _419.z, _349.w);
                    break;
                }
                case 2u:
                {
                    ivec3 _423 = _384.xyz - _349.xyz;
                    _430 = ivec4(_423.x, _423.y, _423.z, _349.w);
                    break;
                }
                case 3u:
                {
                    ivec3 _428 = _384.xyz + (_349.xyz >> ivec3(2));
                    _430 = ivec4(_428.x, _428.y, _428.z, _349.w);
                    break;
                }
                default:
                {
                    _430 = _349;
                    break;
                }
            }
            _431 = _430;
        }
        else
        {
            _431 = _349;
        }
        _432 = _431;
    }
    else
    {
        _432 = _349;
    }
    int _437 = (Base.use24bitColor != 0u) ? 255 : 31;
    ivec3 _440 = clamp(_432.xyz, ivec3(0), ivec3((_437)));
    ivec4 _441 = ivec4(_440.x, _440.y, _440.z, _432.w);
    ivec4 _454;
    if (Base.setMask != 0u)
    {
        ivec4 _448 = _441;
        _448.w = 1;
        _454 = _448;
    }
    else
    {
        ivec4 _453;
        if (!_164)
        {
            ivec4 _452 = _441;
            _452.w = 0;
            _453 = _452;
        }
        else
        {
            _453 = _441;
        }
        _454 = _453;
    }
    out_var_SV_Target0 = vec4(vec3(_454.xyz) / vec3(float(_437)), float(_454.w));
    out_var_SV_Target1 = vec4(float(Base.copyback != 0u));
}

