#version 450

layout(binding = 0, std140) uniform type_Base
{
    mat4 projection;
    uint semimode;
    uint texFlipX;
    uint texFlipY;
    uint tex_is_fb;
    uint texWindowMaskX;
    uint texWindowMaskY;
    uint texWindowOffsX;
    uint texWindowOffsY;
    vec2 InvTexSize;
    vec2 UVOffset;
    float invScale;
    float dither;
    uint textured;
    uint hasCLUT;
    uint semitrans;
    uint blending;
    uint copyback;
    uint opaqueBlack;
    uint replacement;
    uint evenodd;
    uint interlace;
    uint setMask;
    uint drawMask;
    uint use24bitColor;
} Base;

layout(location = 0) in vec3 in_var_POSITION0;
layout(location = 1) in vec4 in_var_COLOR0;
layout(location = 2) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_COLOR;
layout(location = 1) out vec2 out_var_TEXCOORD1;

void main()
{
    vec4 _39 = Base.projection * vec4(in_var_POSITION0, 1.0);
    _39.z = 0.0;
    _39.w = 1.0;
    gl_Position = _39;
    out_var_COLOR = in_var_COLOR0;
    out_var_TEXCOORD1 = in_var_TEXCOORD0;
}

