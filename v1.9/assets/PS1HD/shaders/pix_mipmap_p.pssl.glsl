#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedg_textureSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedg_textureg_sampler;

layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    uvec2 _26 = uvec2(textureSize(SPIRV_Cross_Combinedg_textureSPIRV_Cross_DummySampler, int(0u)));
    out_var_SV_Target = texture(SPIRV_Cross_Combinedg_textureg_sampler, gl_FragCoord.xy * (vec2(1.0 / float(_26.x), 1.0 / float(_26.y)) * 2.0));
}

