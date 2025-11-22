#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _24 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
    _24.w = 1.0;
    out_var_SV_Target = _24;
}

