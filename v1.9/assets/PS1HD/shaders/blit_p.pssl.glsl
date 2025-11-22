#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _55;
    do
    {
        bool _36;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _36 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _36 = true;
        }
        bool _41;
        if (!_36)
        {
            _41 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _41 = true;
        }
        bool _47;
        if (!_41)
        {
            _47 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _47 = true;
        }
        if (_47)
        {
            _55 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            _55 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _55;
}

