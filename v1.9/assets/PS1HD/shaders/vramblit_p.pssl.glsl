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

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 1) in vec2 in_var_TEXCOORD1;
layout(location = 0) out vec4 out_var_SV_Target0;
layout(location = 1) out vec4 out_var_SV_Target1;

void main()
{
    out_var_SV_Target0 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD1 * Base.InvTexSize);
    out_var_SV_Target1 = vec4(float(Base.copyback != 0u));
}

