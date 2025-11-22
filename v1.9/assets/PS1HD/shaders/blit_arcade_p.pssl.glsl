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
layout(binding = 0) uniform sampler2D SPIRV_Cross_CombinedtexsamplerSrc;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _310;
    do
    {
        bool _96;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _96 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _96 = true;
        }
        bool _101;
        if (!_96)
        {
            _101 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _101 = true;
        }
        bool _107;
        if (!_101)
        {
            _107 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _107 = true;
        }
        if (_107)
        {
            _310 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            uvec2 _112 = uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0));
            vec2 _117 = vec2(float(_112.x), float(_112.y));
            ivec2 _122 = mix(ivec2(4), ivec2(8), bvec2(BlitUniforms.fparam7 > 4.0));
            vec2 _124 = vec2(_122) * vec2(0.125);
            float _127 = float(_122.x);
            int _131 = int((gl_FragCoord.x - _127 * trunc(gl_FragCoord.x / _127)) / _124.x);
            float _134 = float(_122.y);
            int _138 = int((gl_FragCoord.y - _134 * trunc(gl_FragCoord.y / _134)) / _124.y);
            float _139 = gl_FragCoord.x / _127;
            bool _152 = int(_139 - 2.0 * trunc(_139 / 2.0)) != 0;
            vec4 _162;
            if (_131 < 3)
            {
                _162 = vec4(1.0, 0.0, 0.0, 1.0);
            }
            else
            {
                _162 = mix(vec4(0.0, 0.0, 1.0, 1.0), vec4(0.0, 1.0, 0.0, 1.0), bvec4(_131 < 5));
            }
            bool _168;
            if (!(_131 == 0))
            {
                _168 = _131 == 7;
            }
            else
            {
                _168 = true;
            }
            bool _173;
            if (!_168)
            {
                _173 = _138 == (_152 ? 3 : 0);
            }
            else
            {
                _173 = true;
            }
            bool _178;
            if (!_173)
            {
                _178 = _138 == (_152 ? 4 : 7);
            }
            else
            {
                _178 = true;
            }
            vec4 _182;
            if (_178)
            {
                vec4 _181 = _162;
                _181.w = BlitUniforms.fparam1;
                _182 = _181;
            }
            else
            {
                _182 = _162;
            }
            bool _188;
            if (!(_138 == 6))
            {
                _188 = _138 == 1;
            }
            else
            {
                _188 = true;
            }
            vec4 _203;
            if (_188)
            {
                vec4 _202 = vec4(0.0);
                _202.w = BlitUniforms.fparam4;
                _203 = _202;
            }
            else
            {
                bool _197;
                if (!(_138 == 7))
                {
                    _197 = _138 == 0;
                }
                else
                {
                    _197 = true;
                }
                vec4 _201;
                if (_197)
                {
                    vec4 _200 = vec4(0.0);
                    _200.w = BlitUniforms.fparam3;
                    _201 = _200;
                }
                else
                {
                    _201 = vec4(0.0);
                }
                _203 = _201;
            }
            vec4 _206 = texture(SPIRV_Cross_CombinedtexsamplerSrc, in_var_TEXCOORD0);
            vec2 _208 = vec2(1.384615421295166015625, 0.0) / _117;
            vec4 _211 = texture(SPIRV_Cross_CombinedtexsamplerSrc, in_var_TEXCOORD0 + _208);
            vec4 _216 = texture(SPIRV_Cross_CombinedtexsamplerSrc, in_var_TEXCOORD0 - _208);
            vec2 _219 = vec2(3.23076915740966796875, 0.0) / _117;
            vec4 _222 = texture(SPIRV_Cross_CombinedtexsamplerSrc, in_var_TEXCOORD0 + _219);
            vec4 _227 = texture(SPIRV_Cross_CombinedtexsamplerSrc, in_var_TEXCOORD0 - _219);
            float _247 = float((BlitUniforms.iHSBC >> 24) & 255) * 11.25;
            float _250 = clamp(float((BlitUniforms.iHSBC >> 8) & 255) * 0.03125, 0.0, 2.0) - 1.0;
            float _251 = clamp(float(BlitUniforms.iHSBC & 255) * 0.03125, 0.0, 2.0);
            vec3 _252 = clamp((((((_206 * 0.2270270287990570068359375) + (_211 * 0.3162162303924560546875)) + (_216 * 0.3162162303924560546875)) + (_222 * 0.0702702701091766357421875)) + (_227 * 0.0702702701091766357421875)).xyz, vec3(0.0), vec3(1.0));
            vec3 _269;
            if ((_247 - 360.0 * trunc(_247 / 360.0)) != 0.0)
            {
                float _257 = radians(_247);
                float _258 = cos(_257);
                _269 = ((_252 * _258) + (cross(vec3(0.57735002040863037109375), _252) * sin(_257))) + ((vec3(0.57735002040863037109375) * dot(vec3(0.57735002040863037109375), _252)) * (1.0 - _258));
            }
            else
            {
                _269 = _252;
            }
            float _275 = (1.0 - _251) * 0.5;
            vec3 _286 = (vec4(_269, 1.0) * (mat4(vec4(_251, 0.0, 0.0, _275), vec4(0.0, _251, 0.0, _275), vec4(0.0, 0.0, _251, _275), vec4(0.0, 0.0, 0.0, 1.0)) * mat4(vec4(1.0, 0.0, 0.0, _250), vec4(0.0, 1.0, 0.0, _250), vec4(0.0, 0.0, 1.0, _250), vec4(0.0, 0.0, 0.0, 1.0)))).xyz;
            _310 = vec4(mix(mix(pow(clamp(mix(vec3(dot(_286, vec3(0.308600008487701416015625, 0.609399974346160888671875, 0.08200000226497650146484375))), _286, vec3(clamp(float((BlitUniforms.iHSBC >> 16) & 255) * 0.03125, 0.0, 2.0))), vec3(0.0), vec3(1.0)), vec3(BlitUniforms.fGamma)), _182.xyz, vec3(_182.w * BlitUniforms.fparam2)), _203.xyz, vec3(_203.w * BlitUniforms.fparam5)), 1.0);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _310;
}

