#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsamp;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    uvec2 _38 = uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0));
    vec2 _44 = vec2(32.0) / vec2(float(_38.x), float(_38.y));
    vec4 _49;
    float _52;
    _49 = texture(SPIRV_Cross_Combinedtexsamp, in_var_TEXCOORD0);
    _52 = 0.0;
    vec4 _50;
    for (; _52 < 6.283185482025146484375; _49 = _50, _52 += 0.3926990926265716552734375)
    {
        _50 = _49;
        for (float _60 = 0.3333333432674407958984375; _60 <= 1.0; )
        {
            _50 += texture(SPIRV_Cross_Combinedtexsamp, in_var_TEXCOORD0 + ((vec2(cos(_52), sin(_52)) * _44) * _60));
            _60 += 0.3333333432674407958984375;
            continue;
        }
    }
    vec4 _72 = _49 * vec4(0.0303030312061309814453125);
    out_var_SV_Target0 = vec4(_72.x * 0.300000011920928955078125, _72.y * 0.300000011920928955078125, _72.z * 0.300000011920928955078125, _72.w * 0.699999988079071044921875);
}

