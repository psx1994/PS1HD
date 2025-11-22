#version 450
layout(local_size_x = 16, local_size_y = 16, local_size_z = 1) in;

layout(binding = 0, rgba8) uniform writeonly image2D g_inoutColorWriteonly;
layout(binding = 1, r32ui) uniform readonly uimage2D g_workingEdges;

void main()
{
    ivec2 _38 = ivec2(gl_GlobalInvocationID.xy);
    uint _40 = uint(_38.x);
    uint _53 = (imageLoad(g_workingEdges, ivec2(uvec2(_40 / 2u, uint(_38.y)))).x >> (((_40 % 2u) * 4u) & 31u)) & 15u;
    float _65 = float((_53 & 8u) != 0u);
    imageStore(g_inoutColorWriteonly, ivec2(gl_GlobalInvocationID.xy), vec4(mix(vec4(float((_53 & 1u) != 0u), float((_53 & 2u) != 0u), float((_53 & 4u) != 0u), _65).xyz, vec3(0.5), vec3(_65 * 0.20000000298023223876953125)), 0.0));
}

