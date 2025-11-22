#version 450

float _66;

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
    vec2 _69 = in_var_TEXCOORD0;
    vec4 _215;
    do
    {
        bool _79;
        if (!(_69.x < 0.0))
        {
            _79 = _69.y < 0.0;
        }
        else
        {
            _79 = true;
        }
        bool _84;
        if (!_79)
        {
            _84 = _69.x > 1.0;
        }
        else
        {
            _84 = true;
        }
        bool _90;
        if (!_84)
        {
            _90 = _69.y > 1.0;
        }
        else
        {
            _90 = true;
        }
        if (_90)
        {
            _215 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            float _114;
            if (BlitUniforms.fparam7 > 4.0)
            {
                _114 = BlitUniforms.fparam1 * 2.0;
            }
            else
            {
                _114 = BlitUniforms.fparam1;
            }
            vec3 _130;
            vec2 _131;
            if ((int(gl_FragCoord.y / _114) & 1) == ((BlitUniforms.iparam1 >> (BlitUniforms.iparam2 & 31)) & 1))
            {
                vec2 _128 = _69;
                _128.y = fma((vec2(1.0) / vec2(_66, float(uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0)).y))).y, _114, _69.y);
                _130 = vec3(BlitUniforms.fparam2);
                _131 = _128;
            }
            else
            {
                _130 = vec3(1.0);
                _131 = _69;
            }
            vec4 _134 = texture(SPIRV_Cross_Combinedtexsampler0, _131);
            vec4 _139 = _134 * vec4(_130, 1.0);
            float _157 = float((BlitUniforms.iHSBC >> 24) & 255) * 11.25;
            float _160 = clamp(float((BlitUniforms.iHSBC >> 8) & 255) * 0.03125, 0.0, 2.0) - 1.0;
            float _161 = clamp(float(BlitUniforms.iHSBC & 255) * 0.03125, 0.0, 2.0);
            vec3 _162 = clamp(_139.xyz, vec3(0.0), vec3(1.0));
            vec3 _179;
            if ((_157 - 360.0 * trunc(_157 / 360.0)) != 0.0)
            {
                float _167 = radians(_157);
                float _168 = cos(_167);
                _179 = ((_162 * _168) + (cross(vec3(0.57735002040863037109375), _162) * sin(_167))) + ((vec3(0.57735002040863037109375) * dot(vec3(0.57735002040863037109375), _162)) * (1.0 - _168));
            }
            else
            {
                _179 = _162;
            }
            float _185 = (1.0 - _161) * 0.5;
            vec3 _196 = (vec4(_179, 1.0) * (mat4(vec4(_161, 0.0, 0.0, _185), vec4(0.0, _161, 0.0, _185), vec4(0.0, 0.0, _161, _185), vec4(0.0, 0.0, 0.0, 1.0)) * mat4(vec4(1.0, 0.0, 0.0, _160), vec4(0.0, 1.0, 0.0, _160), vec4(0.0, 0.0, 1.0, _160), vec4(0.0, 0.0, 0.0, 1.0)))).xyz;
            float _202 = _139.w;
            _215 = vec4(pow(vec4(clamp(mix(vec3(dot(_196, vec3(0.308600008487701416015625, 0.609399974346160888671875, 0.08200000226497650146484375))), _196, vec3(clamp(float((BlitUniforms.iHSBC >> 16) & 255) * 0.03125, 0.0, 2.0))), vec3(0.0), vec3(1.0)), _202), vec4(BlitUniforms.fGamma)).xyz, _202);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _215;
}

