#version 450

layout(binding = 1, std140) uniform type_BlitUniforms
{
    int iparam1;
    int iparam2;
    int iparam3;
    int iHSBC;
    float fparam1;
    float fparam2;
    float fparam3;
    float fparam4;
    float fparam5;
    float fparam6;
    float fparam7;
    float fGamma;
    int pad[4];
} BlitUniforms;

layout(binding = 0) uniform sampler2D SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _221;
    do
    {
        bool _86;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _86 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _86 = true;
        }
        bool _91;
        if (!_86)
        {
            _91 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _91 = true;
        }
        bool _97;
        if (!_91)
        {
            _97 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _97 = true;
        }
        if (_97)
        {
            _221 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            uvec2 _104 = uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0));
            float _108 = float(_104.y);
            vec2 _109 = vec2(float(_104.x), _108);
            vec4 _119 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
            vec2 _121 = vec2(1.384615421295166015625, 0.0) / _109;
            vec4 _124 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0 + _121);
            vec4 _129 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0 - _121);
            vec2 _132 = vec2(3.23076915740966796875, 0.0) / _109;
            vec4 _135 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0 + _132);
            vec4 _140 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0 - _132);
            vec4 _145 = pow(pow(((((_119 * 0.2270270287990570068359375) + (_124 * 0.3162162303924560546875)) + (_129 * 0.3162162303924560546875)) + (_135 * 0.0702702701091766357421875)) + (_140 * 0.0702702701091766357421875), vec4(0.449999988079071044921875)) * fma(0.4000000059604644775390625, sin((6.283185482025146484375 * (_108 / BlitUniforms.fparam1)) * (gl_FragCoord.y / _108)), 0.699999988079071044921875), vec4(2.2000000476837158203125));
            float _163 = float((BlitUniforms.iHSBC >> 24) & 255) * 11.25;
            float _166 = clamp(float((BlitUniforms.iHSBC >> 8) & 255) * 0.03125, 0.0, 2.0) - 1.0;
            float _167 = clamp(float(BlitUniforms.iHSBC & 255) * 0.03125, 0.0, 2.0);
            vec3 _168 = clamp(_145.xyz, vec3(0.0), vec3(1.0));
            vec3 _185;
            if ((_163 - 360.0 * trunc(_163 / 360.0)) != 0.0)
            {
                float _173 = radians(_163);
                float _174 = cos(_173);
                _185 = ((_168 * _174) + (cross(vec3(0.57735002040863037109375), _168) * sin(_173))) + ((vec3(0.57735002040863037109375) * dot(vec3(0.57735002040863037109375), _168)) * (1.0 - _174));
            }
            else
            {
                _185 = _168;
            }
            float _191 = (1.0 - _167) * 0.5;
            vec3 _202 = (vec4(_185, 1.0) * (mat4(vec4(_167, 0.0, 0.0, _191), vec4(0.0, _167, 0.0, _191), vec4(0.0, 0.0, _167, _191), vec4(0.0, 0.0, 0.0, 1.0)) * mat4(vec4(1.0, 0.0, 0.0, _166), vec4(0.0, 1.0, 0.0, _166), vec4(0.0, 0.0, 1.0, _166), vec4(0.0, 0.0, 0.0, 1.0)))).xyz;
            float _208 = _145.w;
            _221 = vec4(pow(vec4(clamp(mix(vec3(dot(_202, vec3(0.308600008487701416015625, 0.609399974346160888671875, 0.08200000226497650146484375))), _202, vec3(clamp(float((BlitUniforms.iHSBC >> 16) & 255) * 0.03125, 0.0, 2.0))), vec3(0.0), vec3(1.0)), _208), vec4(BlitUniforms.fGamma)).xyz, _208);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _221;
}

