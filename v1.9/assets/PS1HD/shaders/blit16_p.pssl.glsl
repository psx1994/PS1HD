#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _70;
    do
    {
        bool _43;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _43 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _43 = true;
        }
        bool _48;
        if (!_43)
        {
            _48 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _48 = true;
        }
        bool _54;
        if (!_48)
        {
            _54 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _54 = true;
        }
        if (_54)
        {
            _70 = vec4(1.0);
            break;
        }
        else
        {
            vec4 _61 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
            vec4 _65 = trunc((_61 * 255.0) * vec4(0.125)) * vec4(0.0322580635547637939453125);
            _65.w = trunc(_61.w * 1.9921875);
            _70 = _65;
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _70;
}

