#version 450

vec4 _56;

layout(binding = 1, std140) uniform type_BlitUniforms
{
    int iparam1;
    int iparam2;
    int iparam3;
    int iHSBC;
    float fparam1;
    float fparam2;
    float fparam3;
    float fparam4;
    float fparam5;
    float fparam6;
    float fparam7;
    float fGamma;
    int pad[4];
} BlitUniforms;

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedmy_texSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedmy_texmy_sampler;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec2 _58 = in_var_TEXCOORD0;
    vec4 _934;
    do
    {
        uvec2 _62 = uvec2(textureSize(SPIRV_Cross_Combinedmy_texSPIRV_Cross_DummySampler, 0));
        vec2 _68 = vec2(1.0) / vec2(float(_62.x), float(_62.y));
        bool _82;
        if (!(_58.x < 0.0))
        {
            _82 = _58.y < 0.0;
        }
        else
        {
            _82 = true;
        }
        bool _87;
        if (!_82)
        {
            _87 = _58.x > 1.0;
        }
        else
        {
            _87 = true;
        }
        bool _93;
        if (!_87)
        {
            _93 = _58.y > 1.0;
        }
        else
        {
            _93 = true;
        }
        if (_93)
        {
            _934 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            vec4 _933;
            do
            {
                vec4 _102 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _58, 0.0);
                vec4 _104 = textureGather(SPIRV_Cross_Combinedmy_texmy_sampler, _58, 3);
                vec4 _106 = textureGatherOffset(SPIRV_Cross_Combinedmy_texmy_sampler, _58, ivec2(-1), 3);
                float _107 = _104.x;
                float _108 = _102.w;
                float _109 = isnan(_108) ? _107 : (isnan(_107) ? _108 : max(_107, _108));
                float _110 = isnan(_108) ? _107 : (isnan(_107) ? _108 : min(_107, _108));
                float _111 = _104.z;
                float _112 = isnan(_109) ? _111 : (isnan(_111) ? _109 : max(_111, _109));
                float _113 = isnan(_110) ? _111 : (isnan(_111) ? _110 : min(_111, _110));
                float _114 = _106.z;
                float _115 = _106.x;
                float _116 = isnan(_115) ? _114 : (isnan(_114) ? _115 : max(_114, _115));
                float _117 = isnan(_115) ? _114 : (isnan(_114) ? _115 : min(_114, _115));
                float _118 = isnan(_112) ? _116 : (isnan(_116) ? _112 : max(_116, _112));
                float _120 = _118 * BlitUniforms.fparam2;
                float _121 = _118 - (isnan(_113) ? _117 : (isnan(_117) ? _113 : min(_117, _113)));
                if (_121 < (isnan(_120) ? BlitUniforms.fparam3 : (isnan(BlitUniforms.fparam3) ? _120 : max(BlitUniforms.fparam3, _120))))
                {
                    _933 = _102;
                    break;
                }
                vec4 _127 = textureLodOffset(SPIRV_Cross_Combinedmy_texmy_sampler, _58, 0.0, ivec2(1, -1));
                float _128 = _127.w;
                vec4 _130 = textureLodOffset(SPIRV_Cross_Combinedmy_texmy_sampler, _58, 0.0, ivec2(-1, 1));
                float _131 = _130.w;
                float _132 = _114 + _107;
                float _133 = _115 + _111;
                float _138 = _104.y;
                float _139 = _128 + _138;
                float _140 = _106.w;
                float _144 = _140 + _131;
                float _159 = _68.x;
                bool _160 = (abs(fma(-2.0, _115, _144)) + fma(abs(fma(-2.0, _108, _132)), 2.0, abs(fma(-2.0, _111, _139)))) >= (abs(fma(-2.0, _107, _131 + _138)) + fma(abs(fma(-2.0, _108, _133)), 2.0, abs(fma(-2.0, _114, _140 + _128))));
                bool _162 = !_160;
                vec4 _166;
                if (_162)
                {
                    vec4 _165;
                    _165.z = _115;
                    _166 = _165;
                }
                else
                {
                    _166 = _106;
                }
                vec4 _170;
                if (_162)
                {
                    vec4 _169;
                    _169.x = _111;
                    _170 = _169;
                }
                else
                {
                    _170 = _104;
                }
                float _174;
                if (_160)
                {
                    _174 = _68.y;
                }
                else
                {
                    _174 = _159;
                }
                float _183 = abs(_166.z - _108);
                float _184 = abs(_170.x - _108);
                bool _185 = _183 >= _184;
                float _190;
                if (_185)
                {
                    _190 = -_174;
                }
                else
                {
                    _190 = _174;
                }
                float _193 = clamp(abs(fma(fma(_132 + _133, 2.0, _144 + _139), 0.083333335816860198974609375, -_108)) * (1.0 / _121), 0.0, 1.0);
                float _194 = _162 ? 0.0 : _159;
                float _199;
                if (_160)
                {
                    _199 = 0.0;
                }
                else
                {
                    _199 = _68.y;
                }
                vec2 _204;
                if (_162)
                {
                    vec2 _203 = _58;
                    _203.x = fma(_190, 0.5, _58.x);
                    _204 = _203;
                }
                else
                {
                    _204 = _58;
                }
                vec2 _210;
                if (_160)
                {
                    vec2 _209 = _204;
                    _209.y = fma(_190, 0.5, _204.y);
                    _210 = _209;
                }
                else
                {
                    _210 = _204;
                }
                float _212 = _210.x - _194;
                vec2 _215 = vec2(_212, _210.y - _199);
                float _216 = _210.x + _194;
                vec2 _218 = vec2(_216, _210.y + _199);
                float _229 = (isnan(_184) ? _183 : (isnan(_183) ? _184 : max(_183, _184))) * 0.25;
                float _230 = -((!_185) ? (_170.x + _108) : (_166.z + _108));
                float _232 = fma(-2.0, _193, 3.0) * (_193 * _193);
                bool _233 = fma(_230, 0.5, _108) < 0.0;
                float _234 = fma(_230, 0.5, textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _215, 0.0).w);
                float _235 = fma(_230, 0.5, textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _218, 0.0).w);
                bool _239 = abs(_235) >= _229;
                bool _240 = !(abs(_234) >= _229);
                vec2 _245;
                if (_240)
                {
                    vec2 _244 = _215;
                    _244.x = _212 - _194;
                    _245 = _244;
                }
                else
                {
                    _245 = _215;
                }
                vec2 _251;
                if (_240)
                {
                    vec2 _250 = _245;
                    _250.y = _245.y - _199;
                    _251 = _250;
                }
                else
                {
                    _251 = _245;
                }
                bool _256;
                if (!_240)
                {
                    _256 = !_239;
                }
                else
                {
                    _256 = true;
                }
                bool _257 = !_239;
                vec2 _262;
                if (_257)
                {
                    vec2 _261 = _218;
                    _261.x = _216 + _194;
                    _262 = _261;
                }
                else
                {
                    _262 = _218;
                }
                vec2 _268;
                if (_257)
                {
                    vec2 _267 = _262;
                    _267.y = _262.y + _199;
                    _268 = _267;
                }
                else
                {
                    _268 = _262;
                }
                vec2 _884;
                vec2 _885;
                float _886;
                float _887;
                if (_256)
                {
                    float _276;
                    if (_240)
                    {
                        _276 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _251, 0.0).w;
                    }
                    else
                    {
                        _276 = _234;
                    }
                    float _282;
                    if (_257)
                    {
                        _282 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _268, 0.0).w;
                    }
                    else
                    {
                        _282 = _235;
                    }
                    float _286;
                    if (_240)
                    {
                        _286 = fma(_230, 0.5, _276);
                    }
                    else
                    {
                        _286 = _276;
                    }
                    float _290;
                    if (_257)
                    {
                        _290 = fma(_230, 0.5, _282);
                    }
                    else
                    {
                        _290 = _282;
                    }
                    bool _294 = abs(_290) >= _229;
                    bool _295 = !(abs(_286) >= _229);
                    vec2 _301;
                    if (_295)
                    {
                        vec2 _300 = _251;
                        _300.x = _251.x - _194;
                        _301 = _300;
                    }
                    else
                    {
                        _301 = _251;
                    }
                    vec2 _307;
                    if (_295)
                    {
                        vec2 _306 = _301;
                        _306.y = _301.y - _199;
                        _307 = _306;
                    }
                    else
                    {
                        _307 = _301;
                    }
                    bool _312;
                    if (!_295)
                    {
                        _312 = !_294;
                    }
                    else
                    {
                        _312 = true;
                    }
                    bool _313 = !_294;
                    vec2 _319;
                    if (_313)
                    {
                        vec2 _318 = _268;
                        _318.x = _268.x + _194;
                        _319 = _318;
                    }
                    else
                    {
                        _319 = _268;
                    }
                    vec2 _325;
                    if (_313)
                    {
                        vec2 _324 = _319;
                        _324.y = _319.y + _199;
                        _325 = _324;
                    }
                    else
                    {
                        _325 = _319;
                    }
                    vec2 _880;
                    vec2 _881;
                    float _882;
                    float _883;
                    if (_312)
                    {
                        float _333;
                        if (_295)
                        {
                            _333 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _307, 0.0).w;
                        }
                        else
                        {
                            _333 = _286;
                        }
                        float _339;
                        if (_313)
                        {
                            _339 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _325, 0.0).w;
                        }
                        else
                        {
                            _339 = _290;
                        }
                        float _343;
                        if (_295)
                        {
                            _343 = fma(_230, 0.5, _333);
                        }
                        else
                        {
                            _343 = _333;
                        }
                        float _347;
                        if (_313)
                        {
                            _347 = fma(_230, 0.5, _339);
                        }
                        else
                        {
                            _347 = _339;
                        }
                        bool _351 = abs(_347) >= _229;
                        bool _352 = !(abs(_343) >= _229);
                        vec2 _358;
                        if (_352)
                        {
                            vec2 _357 = _307;
                            _357.x = _307.x - _194;
                            _358 = _357;
                        }
                        else
                        {
                            _358 = _307;
                        }
                        vec2 _364;
                        if (_352)
                        {
                            vec2 _363 = _358;
                            _363.y = _358.y - _199;
                            _364 = _363;
                        }
                        else
                        {
                            _364 = _358;
                        }
                        bool _369;
                        if (!_352)
                        {
                            _369 = !_351;
                        }
                        else
                        {
                            _369 = true;
                        }
                        bool _370 = !_351;
                        vec2 _376;
                        if (_370)
                        {
                            vec2 _375 = _325;
                            _375.x = _325.x + _194;
                            _376 = _375;
                        }
                        else
                        {
                            _376 = _325;
                        }
                        vec2 _382;
                        if (_370)
                        {
                            vec2 _381 = _376;
                            _381.y = _376.y + _199;
                            _382 = _381;
                        }
                        else
                        {
                            _382 = _376;
                        }
                        vec2 _876;
                        vec2 _877;
                        float _878;
                        float _879;
                        if (_369)
                        {
                            float _390;
                            if (_352)
                            {
                                _390 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _364, 0.0).w;
                            }
                            else
                            {
                                _390 = _343;
                            }
                            float _396;
                            if (_370)
                            {
                                _396 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _382, 0.0).w;
                            }
                            else
                            {
                                _396 = _347;
                            }
                            float _400;
                            if (_352)
                            {
                                _400 = fma(_230, 0.5, _390);
                            }
                            else
                            {
                                _400 = _390;
                            }
                            float _404;
                            if (_370)
                            {
                                _404 = fma(_230, 0.5, _396);
                            }
                            else
                            {
                                _404 = _396;
                            }
                            bool _408 = abs(_404) >= _229;
                            bool _409 = !(abs(_400) >= _229);
                            vec2 _415;
                            if (_409)
                            {
                                vec2 _414 = _364;
                                _414.x = _364.x - _194;
                                _415 = _414;
                            }
                            else
                            {
                                _415 = _364;
                            }
                            vec2 _421;
                            if (_409)
                            {
                                vec2 _420 = _415;
                                _420.y = _415.y - _199;
                                _421 = _420;
                            }
                            else
                            {
                                _421 = _415;
                            }
                            bool _426;
                            if (!_409)
                            {
                                _426 = !_408;
                            }
                            else
                            {
                                _426 = true;
                            }
                            bool _427 = !_408;
                            vec2 _433;
                            if (_427)
                            {
                                vec2 _432 = _382;
                                _432.x = _382.x + _194;
                                _433 = _432;
                            }
                            else
                            {
                                _433 = _382;
                            }
                            vec2 _439;
                            if (_427)
                            {
                                vec2 _438 = _433;
                                _438.y = _433.y + _199;
                                _439 = _438;
                            }
                            else
                            {
                                _439 = _433;
                            }
                            vec2 _872;
                            vec2 _873;
                            float _874;
                            float _875;
                            if (_426)
                            {
                                float _447;
                                if (_409)
                                {
                                    _447 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _421, 0.0).w;
                                }
                                else
                                {
                                    _447 = _400;
                                }
                                float _453;
                                if (_427)
                                {
                                    _453 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _439, 0.0).w;
                                }
                                else
                                {
                                    _453 = _404;
                                }
                                float _457;
                                if (_409)
                                {
                                    _457 = fma(_230, 0.5, _447);
                                }
                                else
                                {
                                    _457 = _447;
                                }
                                float _461;
                                if (_427)
                                {
                                    _461 = fma(_230, 0.5, _453);
                                }
                                else
                                {
                                    _461 = _453;
                                }
                                bool _465 = abs(_461) >= _229;
                                bool _466 = !(abs(_457) >= _229);
                                vec2 _473;
                                if (_466)
                                {
                                    vec2 _472 = _421;
                                    _472.x = fma(-_194, 1.5, _421.x);
                                    _473 = _472;
                                }
                                else
                                {
                                    _473 = _421;
                                }
                                vec2 _480;
                                if (_466)
                                {
                                    vec2 _479 = _473;
                                    _479.y = fma(-_199, 1.5, _473.y);
                                    _480 = _479;
                                }
                                else
                                {
                                    _480 = _473;
                                }
                                bool _485;
                                if (!_466)
                                {
                                    _485 = !_465;
                                }
                                else
                                {
                                    _485 = true;
                                }
                                bool _486 = !_465;
                                vec2 _492;
                                if (_486)
                                {
                                    vec2 _491 = _439;
                                    _491.x = fma(_194, 1.5, _439.x);
                                    _492 = _491;
                                }
                                else
                                {
                                    _492 = _439;
                                }
                                vec2 _498;
                                if (_486)
                                {
                                    vec2 _497 = _492;
                                    _497.y = fma(_199, 1.5, _492.y);
                                    _498 = _497;
                                }
                                else
                                {
                                    _498 = _492;
                                }
                                vec2 _868;
                                vec2 _869;
                                float _870;
                                float _871;
                                if (_485)
                                {
                                    float _506;
                                    if (_466)
                                    {
                                        _506 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _480, 0.0).w;
                                    }
                                    else
                                    {
                                        _506 = _457;
                                    }
                                    float _512;
                                    if (_486)
                                    {
                                        _512 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _498, 0.0).w;
                                    }
                                    else
                                    {
                                        _512 = _461;
                                    }
                                    float _516;
                                    if (_466)
                                    {
                                        _516 = fma(_230, 0.5, _506);
                                    }
                                    else
                                    {
                                        _516 = _506;
                                    }
                                    float _520;
                                    if (_486)
                                    {
                                        _520 = fma(_230, 0.5, _512);
                                    }
                                    else
                                    {
                                        _520 = _512;
                                    }
                                    bool _524 = abs(_520) >= _229;
                                    bool _525 = !(abs(_516) >= _229);
                                    vec2 _532;
                                    if (_525)
                                    {
                                        vec2 _531 = _480;
                                        _531.x = fma(-_194, 2.0, _480.x);
                                        _532 = _531;
                                    }
                                    else
                                    {
                                        _532 = _480;
                                    }
                                    vec2 _539;
                                    if (_525)
                                    {
                                        vec2 _538 = _532;
                                        _538.y = fma(-_199, 2.0, _532.y);
                                        _539 = _538;
                                    }
                                    else
                                    {
                                        _539 = _532;
                                    }
                                    bool _544;
                                    if (!_525)
                                    {
                                        _544 = !_524;
                                    }
                                    else
                                    {
                                        _544 = true;
                                    }
                                    bool _545 = !_524;
                                    vec2 _551;
                                    if (_545)
                                    {
                                        vec2 _550 = _498;
                                        _550.x = fma(_194, 2.0, _498.x);
                                        _551 = _550;
                                    }
                                    else
                                    {
                                        _551 = _498;
                                    }
                                    vec2 _557;
                                    if (_545)
                                    {
                                        vec2 _556 = _551;
                                        _556.y = fma(_199, 2.0, _551.y);
                                        _557 = _556;
                                    }
                                    else
                                    {
                                        _557 = _551;
                                    }
                                    vec2 _864;
                                    vec2 _865;
                                    float _866;
                                    float _867;
                                    if (_544)
                                    {
                                        float _565;
                                        if (_525)
                                        {
                                            _565 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _539, 0.0).w;
                                        }
                                        else
                                        {
                                            _565 = _516;
                                        }
                                        float _571;
                                        if (_545)
                                        {
                                            _571 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _557, 0.0).w;
                                        }
                                        else
                                        {
                                            _571 = _520;
                                        }
                                        float _575;
                                        if (_525)
                                        {
                                            _575 = fma(_230, 0.5, _565);
                                        }
                                        else
                                        {
                                            _575 = _565;
                                        }
                                        float _579;
                                        if (_545)
                                        {
                                            _579 = fma(_230, 0.5, _571);
                                        }
                                        else
                                        {
                                            _579 = _571;
                                        }
                                        bool _583 = abs(_579) >= _229;
                                        bool _584 = !(abs(_575) >= _229);
                                        vec2 _591;
                                        if (_584)
                                        {
                                            vec2 _590 = _539;
                                            _590.x = fma(-_194, 2.0, _539.x);
                                            _591 = _590;
                                        }
                                        else
                                        {
                                            _591 = _539;
                                        }
                                        vec2 _598;
                                        if (_584)
                                        {
                                            vec2 _597 = _591;
                                            _597.y = fma(-_199, 2.0, _591.y);
                                            _598 = _597;
                                        }
                                        else
                                        {
                                            _598 = _591;
                                        }
                                        bool _603;
                                        if (!_584)
                                        {
                                            _603 = !_583;
                                        }
                                        else
                                        {
                                            _603 = true;
                                        }
                                        bool _604 = !_583;
                                        vec2 _610;
                                        if (_604)
                                        {
                                            vec2 _609 = _557;
                                            _609.x = fma(_194, 2.0, _557.x);
                                            _610 = _609;
                                        }
                                        else
                                        {
                                            _610 = _557;
                                        }
                                        vec2 _616;
                                        if (_604)
                                        {
                                            vec2 _615 = _610;
                                            _615.y = fma(_199, 2.0, _610.y);
                                            _616 = _615;
                                        }
                                        else
                                        {
                                            _616 = _610;
                                        }
                                        vec2 _860;
                                        vec2 _861;
                                        float _862;
                                        float _863;
                                        if (_603)
                                        {
                                            float _624;
                                            if (_584)
                                            {
                                                _624 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _598, 0.0).w;
                                            }
                                            else
                                            {
                                                _624 = _575;
                                            }
                                            float _630;
                                            if (_604)
                                            {
                                                _630 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _616, 0.0).w;
                                            }
                                            else
                                            {
                                                _630 = _579;
                                            }
                                            float _634;
                                            if (_584)
                                            {
                                                _634 = fma(_230, 0.5, _624);
                                            }
                                            else
                                            {
                                                _634 = _624;
                                            }
                                            float _638;
                                            if (_604)
                                            {
                                                _638 = fma(_230, 0.5, _630);
                                            }
                                            else
                                            {
                                                _638 = _630;
                                            }
                                            bool _642 = abs(_638) >= _229;
                                            bool _643 = !(abs(_634) >= _229);
                                            vec2 _650;
                                            if (_643)
                                            {
                                                vec2 _649 = _598;
                                                _649.x = fma(-_194, 2.0, _598.x);
                                                _650 = _649;
                                            }
                                            else
                                            {
                                                _650 = _598;
                                            }
                                            vec2 _657;
                                            if (_643)
                                            {
                                                vec2 _656 = _650;
                                                _656.y = fma(-_199, 2.0, _650.y);
                                                _657 = _656;
                                            }
                                            else
                                            {
                                                _657 = _650;
                                            }
                                            bool _662;
                                            if (!_643)
                                            {
                                                _662 = !_642;
                                            }
                                            else
                                            {
                                                _662 = true;
                                            }
                                            bool _663 = !_642;
                                            vec2 _669;
                                            if (_663)
                                            {
                                                vec2 _668 = _616;
                                                _668.x = fma(_194, 2.0, _616.x);
                                                _669 = _668;
                                            }
                                            else
                                            {
                                                _669 = _616;
                                            }
                                            vec2 _675;
                                            if (_663)
                                            {
                                                vec2 _674 = _669;
                                                _674.y = fma(_199, 2.0, _669.y);
                                                _675 = _674;
                                            }
                                            else
                                            {
                                                _675 = _669;
                                            }
                                            vec2 _856;
                                            vec2 _857;
                                            float _858;
                                            float _859;
                                            if (_662)
                                            {
                                                float _683;
                                                if (_643)
                                                {
                                                    _683 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _657, 0.0).w;
                                                }
                                                else
                                                {
                                                    _683 = _634;
                                                }
                                                float _689;
                                                if (_663)
                                                {
                                                    _689 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _675, 0.0).w;
                                                }
                                                else
                                                {
                                                    _689 = _638;
                                                }
                                                float _693;
                                                if (_643)
                                                {
                                                    _693 = fma(_230, 0.5, _683);
                                                }
                                                else
                                                {
                                                    _693 = _683;
                                                }
                                                float _697;
                                                if (_663)
                                                {
                                                    _697 = fma(_230, 0.5, _689);
                                                }
                                                else
                                                {
                                                    _697 = _689;
                                                }
                                                bool _701 = abs(_697) >= _229;
                                                bool _702 = !(abs(_693) >= _229);
                                                vec2 _709;
                                                if (_702)
                                                {
                                                    vec2 _708 = _657;
                                                    _708.x = fma(-_194, 2.0, _657.x);
                                                    _709 = _708;
                                                }
                                                else
                                                {
                                                    _709 = _657;
                                                }
                                                vec2 _716;
                                                if (_702)
                                                {
                                                    vec2 _715 = _709;
                                                    _715.y = fma(-_199, 2.0, _709.y);
                                                    _716 = _715;
                                                }
                                                else
                                                {
                                                    _716 = _709;
                                                }
                                                bool _721;
                                                if (!_702)
                                                {
                                                    _721 = !_701;
                                                }
                                                else
                                                {
                                                    _721 = true;
                                                }
                                                bool _722 = !_701;
                                                vec2 _728;
                                                if (_722)
                                                {
                                                    vec2 _727 = _675;
                                                    _727.x = fma(_194, 2.0, _675.x);
                                                    _728 = _727;
                                                }
                                                else
                                                {
                                                    _728 = _675;
                                                }
                                                vec2 _734;
                                                if (_722)
                                                {
                                                    vec2 _733 = _728;
                                                    _733.y = fma(_199, 2.0, _728.y);
                                                    _734 = _733;
                                                }
                                                else
                                                {
                                                    _734 = _728;
                                                }
                                                vec2 _852;
                                                vec2 _853;
                                                float _854;
                                                float _855;
                                                if (_721)
                                                {
                                                    float _742;
                                                    if (_702)
                                                    {
                                                        _742 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _716, 0.0).w;
                                                    }
                                                    else
                                                    {
                                                        _742 = _693;
                                                    }
                                                    float _748;
                                                    if (_722)
                                                    {
                                                        _748 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _734, 0.0).w;
                                                    }
                                                    else
                                                    {
                                                        _748 = _697;
                                                    }
                                                    float _752;
                                                    if (_702)
                                                    {
                                                        _752 = fma(_230, 0.5, _742);
                                                    }
                                                    else
                                                    {
                                                        _752 = _742;
                                                    }
                                                    float _756;
                                                    if (_722)
                                                    {
                                                        _756 = fma(_230, 0.5, _748);
                                                    }
                                                    else
                                                    {
                                                        _756 = _748;
                                                    }
                                                    bool _760 = abs(_756) >= _229;
                                                    bool _761 = !(abs(_752) >= _229);
                                                    vec2 _768;
                                                    if (_761)
                                                    {
                                                        vec2 _767 = _716;
                                                        _767.x = fma(-_194, 4.0, _716.x);
                                                        _768 = _767;
                                                    }
                                                    else
                                                    {
                                                        _768 = _716;
                                                    }
                                                    vec2 _775;
                                                    if (_761)
                                                    {
                                                        vec2 _774 = _768;
                                                        _774.y = fma(-_199, 4.0, _768.y);
                                                        _775 = _774;
                                                    }
                                                    else
                                                    {
                                                        _775 = _768;
                                                    }
                                                    bool _780;
                                                    if (!_761)
                                                    {
                                                        _780 = !_760;
                                                    }
                                                    else
                                                    {
                                                        _780 = true;
                                                    }
                                                    bool _781 = !_760;
                                                    vec2 _787;
                                                    if (_781)
                                                    {
                                                        vec2 _786 = _734;
                                                        _786.x = fma(_194, 4.0, _734.x);
                                                        _787 = _786;
                                                    }
                                                    else
                                                    {
                                                        _787 = _734;
                                                    }
                                                    vec2 _793;
                                                    if (_781)
                                                    {
                                                        vec2 _792 = _787;
                                                        _792.y = fma(_199, 4.0, _787.y);
                                                        _793 = _792;
                                                    }
                                                    else
                                                    {
                                                        _793 = _787;
                                                    }
                                                    vec2 _848;
                                                    vec2 _849;
                                                    float _850;
                                                    float _851;
                                                    if (_780)
                                                    {
                                                        float _801;
                                                        if (_761)
                                                        {
                                                            _801 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _775, 0.0).w;
                                                        }
                                                        else
                                                        {
                                                            _801 = _752;
                                                        }
                                                        float _807;
                                                        if (_781)
                                                        {
                                                            _807 = textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _793, 0.0).w;
                                                        }
                                                        else
                                                        {
                                                            _807 = _756;
                                                        }
                                                        float _811;
                                                        if (_761)
                                                        {
                                                            _811 = fma(_230, 0.5, _801);
                                                        }
                                                        else
                                                        {
                                                            _811 = _801;
                                                        }
                                                        float _815;
                                                        if (_781)
                                                        {
                                                            _815 = fma(_230, 0.5, _807);
                                                        }
                                                        else
                                                        {
                                                            _815 = _807;
                                                        }
                                                        bool _820 = !(abs(_811) >= _229);
                                                        vec2 _827;
                                                        if (_820)
                                                        {
                                                            vec2 _826 = _775;
                                                            _826.x = fma(-_194, 8.0, _775.x);
                                                            _827 = _826;
                                                        }
                                                        else
                                                        {
                                                            _827 = _775;
                                                        }
                                                        vec2 _834;
                                                        if (_820)
                                                        {
                                                            vec2 _833 = _827;
                                                            _833.y = fma(-_199, 8.0, _827.y);
                                                            _834 = _833;
                                                        }
                                                        else
                                                        {
                                                            _834 = _827;
                                                        }
                                                        bool _835 = !(abs(_815) >= _229);
                                                        vec2 _841;
                                                        if (_835)
                                                        {
                                                            vec2 _840 = _793;
                                                            _840.x = fma(_194, 8.0, _793.x);
                                                            _841 = _840;
                                                        }
                                                        else
                                                        {
                                                            _841 = _793;
                                                        }
                                                        vec2 _847;
                                                        if (_835)
                                                        {
                                                            vec2 _846 = _841;
                                                            _846.y = fma(_199, 8.0, _841.y);
                                                            _847 = _846;
                                                        }
                                                        else
                                                        {
                                                            _847 = _841;
                                                        }
                                                        _848 = _847;
                                                        _849 = _834;
                                                        _850 = _815;
                                                        _851 = _811;
                                                    }
                                                    else
                                                    {
                                                        _848 = _793;
                                                        _849 = _775;
                                                        _850 = _756;
                                                        _851 = _752;
                                                    }
                                                    _852 = _848;
                                                    _853 = _849;
                                                    _854 = _850;
                                                    _855 = _851;
                                                }
                                                else
                                                {
                                                    _852 = _734;
                                                    _853 = _716;
                                                    _854 = _697;
                                                    _855 = _693;
                                                }
                                                _856 = _852;
                                                _857 = _853;
                                                _858 = _854;
                                                _859 = _855;
                                            }
                                            else
                                            {
                                                _856 = _675;
                                                _857 = _657;
                                                _858 = _638;
                                                _859 = _634;
                                            }
                                            _860 = _856;
                                            _861 = _857;
                                            _862 = _858;
                                            _863 = _859;
                                        }
                                        else
                                        {
                                            _860 = _616;
                                            _861 = _598;
                                            _862 = _579;
                                            _863 = _575;
                                        }
                                        _864 = _860;
                                        _865 = _861;
                                        _866 = _862;
                                        _867 = _863;
                                    }
                                    else
                                    {
                                        _864 = _557;
                                        _865 = _539;
                                        _866 = _520;
                                        _867 = _516;
                                    }
                                    _868 = _864;
                                    _869 = _865;
                                    _870 = _866;
                                    _871 = _867;
                                }
                                else
                                {
                                    _868 = _498;
                                    _869 = _480;
                                    _870 = _461;
                                    _871 = _457;
                                }
                                _872 = _868;
                                _873 = _869;
                                _874 = _870;
                                _875 = _871;
                            }
                            else
                            {
                                _872 = _439;
                                _873 = _421;
                                _874 = _404;
                                _875 = _400;
                            }
                            _876 = _872;
                            _877 = _873;
                            _878 = _874;
                            _879 = _875;
                        }
                        else
                        {
                            _876 = _382;
                            _877 = _364;
                            _878 = _347;
                            _879 = _343;
                        }
                        _880 = _876;
                        _881 = _877;
                        _882 = _878;
                        _883 = _879;
                    }
                    else
                    {
                        _880 = _325;
                        _881 = _307;
                        _882 = _290;
                        _883 = _286;
                    }
                    _884 = _880;
                    _885 = _881;
                    _886 = _882;
                    _887 = _883;
                }
                else
                {
                    _884 = _268;
                    _885 = _251;
                    _886 = _235;
                    _887 = _234;
                }
                float _896;
                if (_162)
                {
                    _896 = _58.y - _885.y;
                }
                else
                {
                    _896 = _58.x - _885.x;
                }
                float _901;
                if (_162)
                {
                    _901 = _884.y - _58.y;
                }
                else
                {
                    _901 = _884.x - _58.x;
                }
                float _913 = (_232 * _232) * BlitUniforms.fparam1;
                float _914 = ((_896 < _901) ? ((_887 < 0.0) != _233) : ((_886 < 0.0) != _233)) ? fma(isnan(_901) ? _896 : (isnan(_896) ? _901 : min(_896, _901)), (-1.0) / (_901 + _896), 0.5) : 0.0;
                float _915 = isnan(_913) ? _914 : (isnan(_914) ? _913 : max(_914, _913));
                vec2 _920;
                if (_162)
                {
                    vec2 _919 = _58;
                    _919.x = fma(_915, _190, _58.x);
                    _920 = _919;
                }
                else
                {
                    _920 = _58;
                }
                vec2 _926;
                if (_160)
                {
                    vec2 _925 = _920;
                    _925.y = fma(_915, _190, _920.y);
                    _926 = _925;
                }
                else
                {
                    _926 = _920;
                }
                _933 = vec4(textureLod(SPIRV_Cross_Combinedmy_texmy_sampler, _926, 0.0).xyz, _108);
                break;
            } while(false);
            _934 = _933;
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _934;
}

