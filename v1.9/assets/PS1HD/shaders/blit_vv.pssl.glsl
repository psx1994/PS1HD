#version 450

layout(binding = 0, std140) uniform type_Params
{
    vec2 ratio;
    vec2 texelSize;
    vec2 uvOffset;
    vec2 uvScale;
} Params;

layout(location = 0) out vec2 out_var_TEXCOORD0;
layout(location = 1) out vec4 out_var_TEXCOORD1;
layout(location = 2) out vec4 out_var_TEXCOORD2;

void main()
{
    uint _37 = uint(gl_VertexID) & 3u;
    float _40 = float((_37 >> 0u) & 1u);
    float _44 = float((_37 >> 1u) & 1u);
    float _64 = 1.0 - (1.0 / Params.ratio.x);
    vec2 _68 = vec2(fma(_64, 0.5, fma(_40, Params.uvScale.x, Params.uvOffset.x) / Params.ratio.x), fma(_64, 0.5, fma(_44, Params.uvScale.y, Params.uvOffset.y) / Params.ratio.x));
    vec4 _69 = _68.xyxy;
    gl_Position = vec4(fma(2.0, _40, -1.0), fma(2.0, _44, -1.0) * Params.ratio.y, 0.0, 1.0);
    out_var_TEXCOORD0 = _68;
    out_var_TEXCOORD1 = _69 - Params.texelSize.xyxy;
    out_var_TEXCOORD2 = _69 + Params.texelSize.xyxy;
}

