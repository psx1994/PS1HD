#version 450

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

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 1) in vec4 in_var_TEXCOORD1;
layout(location = 2) in vec4 in_var_TEXCOORD2;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _418;
    do
    {
        bool _100;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _100 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _100 = true;
        }
        bool _105;
        if (!_100)
        {
            _105 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _105 = true;
        }
        bool _111;
        if (!_105)
        {
            _111 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _111 = true;
        }
        if (_111)
        {
            _418 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            vec4 _135 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
            vec4 _137 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD1.xy));
            vec3 _138 = _137.xyz;
            vec4 _140 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD0.x, in_var_TEXCOORD1.y));
            vec3 _141 = _140.xyz;
            vec4 _143 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD2.x, in_var_TEXCOORD1.y));
            vec3 _144 = _143.xyz;
            vec4 _146 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD1.x, in_var_TEXCOORD0.y));
            vec3 _147 = _146.xyz;
            vec3 _148 = _135.xyz;
            vec4 _150 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD2.x, in_var_TEXCOORD0.y));
            vec3 _151 = _150.xyz;
            vec4 _153 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD1.x, in_var_TEXCOORD2.y));
            vec3 _154 = _153.xyz;
            vec4 _156 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD0.x, in_var_TEXCOORD2.y));
            vec3 _157 = _156.xyz;
            vec4 _159 = texture(SPIRV_Cross_Combinedtexsampler0, vec2(in_var_TEXCOORD2.xy));
            vec3 _160 = _159.xyz;
            vec3 _170 = (((((_138 + _144) + _154) + _160) * 0.1500000059604644775390625) + ((((_141 + _147) + _151) + _157) * 0.25)) + _148;
            vec3 _171 = _170 * vec3(0.3846153914928436279296875);
            vec3 _176 = fma(_170, vec3(0.3846153914928436279296875), vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _171) + 0.004999999888241291046142578125);
            vec3 _182 = _176 - ((_138 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _138) + 0.004999999888241291046142578125));
            vec3 _191 = _176 - ((_141 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _141) + 0.004999999888241291046142578125));
            vec3 _201 = _176 - ((_144 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _144) + 0.004999999888241291046142578125));
            vec3 _211 = _176 - ((_147 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _147) + 0.004999999888241291046142578125));
            vec3 _221 = _176 - ((_151 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _151) + 0.004999999888241291046142578125));
            vec3 _231 = _176 - ((_154 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _154) + 0.004999999888241291046142578125));
            vec3 _241 = _176 - ((_157 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _157) + 0.004999999888241291046142578125));
            vec3 _251 = _176 - ((_160 + vec3(0.0500000007450580596923828125)) / vec3(dot(vec3(1.0), _160) + 0.004999999888241291046142578125));
            float _257 = pow(((((((((0.007000000216066837310791015625 / (dot(_182, _182) + 0.007000000216066837310791015625)) + (0.007000000216066837310791015625 / (dot(_191, _191) + 0.007000000216066837310791015625))) + (0.007000000216066837310791015625 / (dot(_201, _201) + 0.007000000216066837310791015625))) + (0.007000000216066837310791015625 / (dot(_211, _211) + 0.007000000216066837310791015625))) + (0.007000000216066837310791015625 / (dot(_221, _221) + 0.007000000216066837310791015625))) + (0.007000000216066837310791015625 / (dot(_231, _231) + 0.007000000216066837310791015625))) + (0.007000000216066837310791015625 / (dot(_241, _241) + 0.007000000216066837310791015625))) + (0.007000000216066837310791015625 / (dot(_251, _251) + 0.007000000216066837310791015625))) * 0.125, 0.75);
            float _258 = isnan(BlitUniforms.fparam5) ? _257 : (isnan(_257) ? BlitUniforms.fparam5 : max(_257, BlitUniforms.fparam5));
            vec3 _260 = _171 * _258;
            float _267 = _260.x;
            float _268 = _260.y;
            float _269 = _260.z;
            float _270 = isnan(_268) ? _267 : (isnan(_267) ? _268 : max(_267, _268));
            float _271 = isnan(_269) ? _270 : (isnan(_270) ? _269 : max(_270, _269));
            float _272 = isnan(_268) ? _267 : (isnan(_267) ? _268 : min(_267, _268));
            float _273 = isnan(_269) ? _272 : (isnan(_272) ? _269 : min(_272, _269));
            float _274 = _271 - _273;
            float _275 = _271 + _273;
            float _276 = 0.5 * _275;
            float _312;
            float _313;
            if (_274 != 0.0)
            {
                float _301;
                if (_271 == _267)
                {
                    _301 = (_268 - _269) / _274;
                }
                else
                {
                    float _298;
                    if (_271 == _268)
                    {
                        _298 = 2.0 + ((_269 - _267) / _274);
                    }
                    else
                    {
                        float _294;
                        if (_271 == _269)
                        {
                            _294 = 4.0 + ((_267 - _268) / _274);
                        }
                        else
                        {
                            _294 = 0.0;
                        }
                        _298 = _294;
                    }
                    _301 = _298;
                }
                float _306;
                if (_301 < 0.0)
                {
                    _306 = _301 + 6.0;
                }
                else
                {
                    _306 = _301;
                }
                _312 = _274 / (1.0 - abs(_275 - 1.0));
                _313 = _306 * 0.16666667163372039794921875;
            }
            else
            {
                _312 = 0.0;
                _313 = 0.0;
            }
            vec3 _314 = vec3(_313, _312, _276);
            _314.y = _312 * BlitUniforms.fparam2;
            float _317 = 1.0 / BlitUniforms.fparam1;
            _314.z = fma(0.5, _275, -(_276 - _317 * trunc(_276 / _317))) * BlitUniforms.fparam3;
            vec3 _323 = clamp(_314, vec3(0.0), vec3(1.0));
            float _326 = _323.z;
            float _327 = 1.0 - _326;
            vec3 _332 = vec3(0.0, 8.0, 4.0) + vec3(_323.x * 12.00000095367431640625);
            vec3 _333 = _332 - vec3(12.0) * trunc(_332 / vec3(12.0));
            vec3 _335 = _333 - vec3(3.0);
            vec3 _336 = vec3(9.0) - _333;
            float _360 = float((BlitUniforms.iHSBC >> 24) & 255) * 11.25;
            float _363 = clamp(float((BlitUniforms.iHSBC >> 8) & 255) * 0.03125, 0.0, 2.0) - 1.0;
            float _364 = clamp(float(BlitUniforms.iHSBC & 255) * 0.03125, 0.0, 2.0);
            vec3 _365 = clamp(mix(_148 * _258, vec3(_326) - (clamp(mix(mix(min(_335, _336), _336, isnan(_335)), _335, isnan(_336)), vec3(-1.0), vec3(1.0)) * (_323.y * (isnan(_327) ? _326 : (isnan(_326) ? _327 : min(_326, _327))))), vec3(BlitUniforms.fparam6)).xyz, vec3(0.0), vec3(1.0));
            vec3 _382;
            if ((_360 - 360.0 * trunc(_360 / 360.0)) != 0.0)
            {
                float _370 = radians(_360);
                float _371 = cos(_370);
                _382 = ((_365 * _371) + (cross(vec3(0.57735002040863037109375), _365) * sin(_370))) + ((vec3(0.57735002040863037109375) * dot(vec3(0.57735002040863037109375), _365)) * (1.0 - _371));
            }
            else
            {
                _382 = _365;
            }
            float _388 = (1.0 - _364) * 0.5;
            vec3 _399 = (vec4(_382, 1.0) * (mat4(vec4(_364, 0.0, 0.0, _388), vec4(0.0, _364, 0.0, _388), vec4(0.0, 0.0, _364, _388), vec4(0.0, 0.0, 0.0, 1.0)) * mat4(vec4(1.0, 0.0, 0.0, _363), vec4(0.0, 1.0, 0.0, _363), vec4(0.0, 0.0, 1.0, _363), vec4(0.0, 0.0, 0.0, 1.0)))).xyz;
            float _405 = _135.w;
            _418 = vec4(pow(vec4(clamp(mix(vec3(dot(_399, vec3(0.308600008487701416015625, 0.609399974346160888671875, 0.08200000226497650146484375))), _399, vec3(clamp(float((BlitUniforms.iHSBC >> 16) & 255) * 0.03125, 0.0, 2.0))), vec3(0.0), vec3(1.0)), _405), vec4(BlitUniforms.fGamma)).xyz, _405);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _418;
}

