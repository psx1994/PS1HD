#version 450

layout(binding = 0) uniform sampler2D SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _241;
    do
    {
        bool _75;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _75 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _75 = true;
        }
        bool _80;
        if (!_75)
        {
            _80 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _80 = true;
        }
        bool _86;
        if (!_80)
        {
            _86 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _86 = true;
        }
        if (_86)
        {
            _241 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        else
        {
            uvec2 _91 = uvec2(textureSize(SPIRV_Cross_CombinedtexSPIRV_Cross_DummySampler, 0));
            float _93 = float(_91.x);
            float _95 = float(_91.y);
            vec2 _96 = vec2(_93, _95);
            vec2 _98 = vec2(1.0 / _93, 0.0);
            vec2 _102 = fma(in_var_TEXCOORD0, _96, vec2(-0.5));
            vec2 _105 = (floor(_102) + vec2(0.5)) / _96;
            vec2 _106 = fract(_102);
            float _107 = _106.x;
            float _109 = _107 - step(0.5, _107);
            float _119 = mix(_107, fma(-sqrt(fma(-_109, _109, 0.25)), float(int(sign(0.5 - _107))), 0.5), 0.25);
            vec4 _125 = abs(vec4(1.0 + _119, _119, 1.0 - _119, 2.0 - _119) * 3.1415927410125732421875);
            vec4 _126 = mix(mix(max(_125, vec4(9.9999997473787516355514526367188e-06)), vec4(9.9999997473787516355514526367188e-06), isnan(_125)), _125, isnan(vec4(9.9999997473787516355514526367188e-06)));
            vec4 _133 = ((sin(_126) * 2.0) * sin(_126 * vec4(0.5))) / (_126 * _126);
            vec4 _136 = _133 / vec4(dot(_133, vec4(1.0)));
            vec4 _140 = texture(SPIRV_Cross_Combinedtexsampler0, _105 - _98);
            vec4 _143 = texture(SPIRV_Cross_Combinedtexsampler0, _105);
            vec4 _144 = _143 * _143;
            vec4 _147 = texture(SPIRV_Cross_Combinedtexsampler0, _105 + _98);
            vec4 _148 = _147 * _147;
            vec2 _149 = _98 * 2.0;
            vec4 _152 = texture(SPIRV_Cross_Combinedtexsampler0, _105 + _149);
            vec2 _160 = _105 + vec2(0.0, 1.0 / _95);
            vec4 _163 = texture(SPIRV_Cross_Combinedtexsampler0, _160 - _98);
            vec4 _166 = texture(SPIRV_Cross_Combinedtexsampler0, _160);
            vec4 _167 = _166 * _166;
            vec4 _170 = texture(SPIRV_Cross_Combinedtexsampler0, _160 + _98);
            vec4 _171 = _170 * _170;
            vec4 _174 = texture(SPIRV_Cross_Combinedtexsampler0, _160 + _149);
            float _182 = _106.y;
            float _184 = _182 - step(0.5, _182);
            vec3 _196 = pow(mix(clamp(mat4(_140 * _140, _144, _148, _152 * _152) * _136, mix(mix(min(_144, _148), _148, isnan(_144)), _144, isnan(_148)), mix(mix(max(_144, _148), _148, isnan(_144)), _144, isnan(_148))).xyz, clamp(mat4(_163 * _163, _167, _171, _174 * _174) * _136, mix(mix(min(_167, _171), _171, isnan(_167)), _167, isnan(_171)), mix(mix(max(_167, _171), _171, isnan(_167)), _167, isnan(_171))).xyz, vec3(fma(-sqrt(fma(-_184, _184, 0.25)), float(int(sign(0.5 - _182))), 0.5))), vec3(1.0));
            float _198 = _196.x;
            float _199 = _196.y;
            float _200 = _196.z;
            float _201 = isnan(_200) ? _199 : (isnan(_199) ? _200 : max(_199, _200));
            float _203 = (isnan(_201) ? _198 : (isnan(_198) ? _201 : max(_198, _201))) + dot(vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875), _196);
            vec2 _215 = floor(in_var_TEXCOORD0 * _96);
            float _216 = _215.x;
            int _220 = int(fma(-3.0, trunc(_216 * 0.3333333432674407958984375), _216));
            vec3 _228;
            if (_220 == 0)
            {
                _228 = vec3(1.0, 0.699999988079071044921875, 0.699999988079071044921875);
            }
            else
            {
                _228 = mix(vec3(0.699999988079071044921875, 0.699999988079071044921875, 1.0), vec3(0.699999988079071044921875, 1.0, 0.699999988079071044921875), bvec3(_220 == 1));
            }
            _241 = vec4(pow(mix(_196 * ((_95 >= 400.0) ? 1.0 : (1.0 - pow(fma(cos((in_var_TEXCOORD0.y * 6.283185482025146484375) * _95), 0.5, 0.5), clamp(_203 * 0.75, 1.5, 1.5)))), _196, vec3(clamp(_203 * 0.5, 0.3499999940395355224609375, 0.64999997615814208984375))) * _228, vec3(0.5555555820465087890625)) * 1.2000000476837158203125, 1.0);
            break;
        }
        break; // unreachable workaround
    } while(false);
    out_var_SV_Target = _241;
}

