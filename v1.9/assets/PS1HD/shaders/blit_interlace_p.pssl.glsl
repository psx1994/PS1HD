#version 450

float _46;

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
    vec2 _50 = in_var_TEXCOORD0;
    vec4 _110;
    do
    {
        bool _60;
        if (!(_50.x < 0.0))
        {
            _60 = _50.y < 0.0;
        }
        else
        {
            _60 = true;
        }
        bool _65;
        if (!_60)
        {
            _65 = _50.x > 1.0;
        }
        else
        {
            _65 = true;
        }
        bool _71;
        if (!_65)
        {
            _71 = _50.y > 1.0;
        }
        else
        {
            _71 = true;
        }
        if (_71)
        {
            _110 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            float _87 = (BlitUniforms.fparam7 > 4.0) ? 2.0 : 1.0;
            bool _92 = (int(gl_FragCoord.y / _87) & 1) == ((int(gl_FragCoord.y) >> 0) & 1);
            vec2 _99;
            if (_92)
            {
                vec2 _98 = _50;
                _98.y = fma((vec2(1.0) / vec2(_46, float(uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0)).y))).y, _87, _50.y);
                _99 = _98;
            }
            else
            {
                _99 = _50;
            }
            _110 = texture(SPIRV_Cross_Combinedtexsampler0, _99) * vec4(mix(vec3(1.0), vec3(0.5), bvec3(_92)), 1.0);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _110;
}

