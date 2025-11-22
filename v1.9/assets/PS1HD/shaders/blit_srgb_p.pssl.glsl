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
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _74;
    do
    {
        bool _46;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _46 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _46 = true;
        }
        bool _51;
        if (!_46)
        {
            _51 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _51 = true;
        }
        bool _57;
        if (!_51)
        {
            _57 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _57 = true;
        }
        if (_57)
        {
            _74 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            _74 = vec4(pow(texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0).xyz, vec3(BlitUniforms.fparam1)), 1.0);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _74;
}

