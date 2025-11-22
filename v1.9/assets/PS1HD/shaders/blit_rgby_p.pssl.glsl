#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _29 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
    _29.w = dot(sqrt(_29.xyz), vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625));
    out_var_SV_Target = _29;
}

