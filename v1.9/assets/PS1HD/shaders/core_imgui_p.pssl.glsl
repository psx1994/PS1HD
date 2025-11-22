#version 450

layout(binding = 1) uniform sampler2DArray SPIRV_Cross_Combinedtex_msdfsampler_msdf;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler_tex;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 1) in vec4 in_var_COLOR0;
layout(location = 2) in float in_var_TEXCOORD1;
layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    vec4 _37 = in_var_COLOR0;
    vec4 _68;
    if (in_var_TEXCOORD1 >= 0.0)
    {
        vec4 _49 = texture(SPIRV_Cross_Combinedtex_msdfsampler_msdf, vec3(in_var_TEXCOORD0, in_var_TEXCOORD1));
        float _50 = _49.x;
        float _51 = _49.y;
        float _52 = _49.z;
        float _53 = isnan(_51) ? _50 : (isnan(_50) ? _51 : min(_50, _51));
        float _54 = isnan(_51) ? _50 : (isnan(_50) ? _51 : max(_50, _51));
        float _55 = isnan(_52) ? _54 : (isnan(_54) ? _52 : min(_54, _52));
        vec4 _62 = _37;
        _62.w = _37.w * clamp(fma((isnan(_55) ? _53 : (isnan(_53) ? _55 : max(_53, _55))) - 0.60000002384185791015625, 4.0, 0.5), 0.0, 1.0);
        _68 = _62;
    }
    else
    {
        _68 = _37 * texture(SPIRV_Cross_Combinedtexsampler_tex, in_var_TEXCOORD0);
    }
    out_var_SV_Target0 = _68;
}

