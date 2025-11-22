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

layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedtexsampler0;

layout(location = 0) in vec2 in_var_TEXCOORD0;
layout(location = 0) out vec4 out_var_SV_Target;

void main()
{
    vec4 _159;
    do
    {
        bool _66;
        if (!(in_var_TEXCOORD0.x < 0.0))
        {
            _66 = in_var_TEXCOORD0.y < 0.0;
        }
        else
        {
            _66 = true;
        }
        bool _71;
        if (!_66)
        {
            _71 = in_var_TEXCOORD0.x > 1.0;
        }
        else
        {
            _71 = true;
        }
        bool _77;
        if (!_71)
        {
            _77 = in_var_TEXCOORD0.y > 1.0;
        }
        else
        {
            _77 = true;
        }
        if (_77)
        {
            _159 = vec4(0.0, 0.0, 0.0, 1.0);
            break;
        }
        vec4 _83 = texture(SPIRV_Cross_Combinedtexsampler0, in_var_TEXCOORD0);
        float _101 = float((BlitUniforms.iHSBC >> 24) & 255) * 11.25;
        float _104 = clamp(float((BlitUniforms.iHSBC >> 8) & 255) * 0.03125, 0.0, 2.0) - 1.0;
        float _105 = clamp(float(BlitUniforms.iHSBC & 255) * 0.03125, 0.0, 2.0);
        vec3 _106 = clamp(_83.xyz, vec3(0.0), vec3(1.0));
        vec3 _123;
        if ((_101 - 360.0 * trunc(_101 / 360.0)) != 0.0)
        {
            float _111 = radians(_101);
            float _112 = cos(_111);
            _123 = ((_106 * _112) + (cross(vec3(0.57735002040863037109375), _106) * sin(_111))) + ((vec3(0.57735002040863037109375) * dot(vec3(0.57735002040863037109375), _106)) * (1.0 - _112));
        }
        else
        {
            _123 = _106;
        }
        float _129 = (1.0 - _105) * 0.5;
        vec3 _140 = (vec4(_123, 1.0) * (mat4(vec4(_105, 0.0, 0.0, _129), vec4(0.0, _105, 0.0, _129), vec4(0.0, 0.0, _105, _129), vec4(0.0, 0.0, 0.0, 1.0)) * mat4(vec4(1.0, 0.0, 0.0, _104), vec4(0.0, 1.0, 0.0, _104), vec4(0.0, 0.0, 1.0, _104), vec4(0.0, 0.0, 0.0, 1.0)))).xyz;
        float _146 = _83.w;
        _159 = vec4(pow(vec4(clamp(mix(vec3(dot(_140, vec3(0.308600008487701416015625, 0.609399974346160888671875, 0.08200000226497650146484375))), _140, vec3(clamp(float((BlitUniforms.iHSBC >> 16) & 255) * 0.03125, 0.0, 2.0))), vec3(0.0), vec3(1.0)), _146), vec4(BlitUniforms.fGamma)).xyz, _146);
        break;
    } while(false);
    out_var_SV_Target = _159;
}

