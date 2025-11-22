#version 450

layout(binding = 0, std140) uniform type_Params
{
    vec4 ratio;
    vec2 uvOffset;
    vec2 uvScale;
} Params;

layout(location = 0) out vec2 out_var_TEXCOORD0;

void main()
{
    uint _32 = uint(gl_VertexID) & 3u;
    float _35 = float((_32 >> 0u) & 1u);
    float _39 = float((_32 >> 1u) & 1u);
    gl_Position = vec4(fma(2.0, _35, -1.0), -fma(2.0, _39, -1.0), 0.0, 1.0);
    out_var_TEXCOORD0 = vec2(fma(_35, Params.uvScale.x, Params.uvOffset.x), fma(_39, Params.uvScale.y, Params.uvOffset.y));
}

