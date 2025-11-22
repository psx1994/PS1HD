#version 450

layout(binding = 2, std140) uniform type_Params2
{
    mat4 projection;
    mat4 transform;
    vec4 brightness;
    uint use_texture_array;
    uint pad0;
    uint pad1;
    uint pad2;
} Params2;

layout(location = 0) in vec2 in_var_POSITION0;
layout(location = 1) in vec2 in_var_TEXCOORD0;
layout(location = 2) in vec4 in_var_COLOR0;
layout(location = 3) in float in_var_TEXCOORD1;
layout(location = 0) out vec2 out_var_TEXCOORD0;
layout(location = 1) out vec4 out_var_COLOR0;
layout(location = 2) out float out_var_TEXCOORD1;

void main()
{
    gl_Position = Params2.projection * (vec4(in_var_POSITION0, 0.0, 1.0) * Params2.transform);
    out_var_TEXCOORD0 = in_var_TEXCOORD0;
    out_var_COLOR0 = in_var_COLOR0 * vec4(Params2.brightness.xyz, 1.0);
    out_var_TEXCOORD1 = (Params2.use_texture_array != 0u) ? in_var_TEXCOORD1 : (-1.0);
}

