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

layout(binding = 0) uniform sampler2D SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _281;
    do
    {
        bool _58;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _58 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _58 = true;
        }
        bool _63;
        if (!_58)
        {
            _63 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _63 = true;
        }
        bool _69;
        if (!_63)
        {
            _69 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _69 = true;
        }
        if (_69)
        {
            _281 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            uvec2 _74 = uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0));
            float _87;
            if (BlitUniforms.fparam7 > 4.0)
            {
                _87 = BlitUniforms.fparam1 * 1.5;
            }
            else
            {
                _87 = BlitUniforms.fparam1;
            }
            vec2 _88 = in_var_TEXCOORD0 + vec2(9.9999997473787516355514526367188e-06);
            float _89 = _87 / float(_74.x);
            float _90 = _87 / float(_74.y);
            vec4 _93 = vec4(_89, _90, -_89, -_90);
            vec4 _94 = _93 * vec4(3.0, 1.0, 3.0, 1.0);
            vec4 _95 = _93 * vec4(1.0, 3.0, 1.0, 3.0);
            vec3 _99 = texture(SPIRV_Cross_Combinedtexsampler0, _88).xyz;
            vec3 _104 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _93.zw).xyz;
            vec3 _109 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _93.xw).xyz;
            vec3 _114 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _93.xy).xyz;
            vec3 _119 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _93.zy).xyz;
            vec3 _124 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _94.zw).xyz;
            vec3 _129 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _94.xw).xyz;
            vec3 _134 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _94.xy).xyz;
            vec3 _139 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _94.zy).xyz;
            vec3 _144 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _95.zw).xyz;
            vec3 _149 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _95.xw).xyz;
            vec3 _154 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _95.xy).xyz;
            vec3 _159 = texture(SPIRV_Cross_Combinedtexsampler0, _88 + _95.zy).xyz;
            float _164 = 1.0 / (dot(abs(_104 - _114), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _169 = 1.0 / (dot(abs(_119 - _109), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _174 = 1.0 / (dot(abs(_104 - _134), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _179 = 1.0 / (dot(abs(_119 - _129), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _184 = 1.0 / (dot(abs(_124 - _114), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _189 = 1.0 / (dot(abs(_139 - _109), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _194 = 1.0 / (dot(abs(_104 - _154), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _199 = 1.0 / (dot(abs(_119 - _149), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _204 = 1.0 / (dot(abs(_144 - _114), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _209 = 1.0 / (dot(abs(_159 - _109), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            vec3 _218 = ((((_104 + _114) * _164) + ((_119 + _109) * _169)) * 0.5) / vec3(_164 + _169);
            vec3 _235 = ((((((_104 + _134) * _174) + ((_119 + _129) * _179)) + ((_124 + _114) * _184)) + ((_139 + _109) * _189)) * 0.5) / vec3(((_174 + _179) + _184) + _189);
            vec3 _252 = ((((((_104 + _154) * _194) + ((_119 + _149) * _199)) + ((_144 + _114) * _204)) + ((_159 + _109) * _209)) * 0.5) / vec3(((_194 + _199) + _204) + _209);
            float _257 = 1.0 / (dot(abs(_218 - _99), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _262 = 1.0 / (dot(abs(_235 - _99), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            float _267 = 1.0 / (dot(abs(_252 - _99), vec3(1.0)) + 9.9999997473787516355514526367188e-06);
            _281 = vec4((((_218 * _257) + (_235 * _262)) + (_252 * _267)) / vec3((_257 + _262) + _267), 1.0);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _281;
}

