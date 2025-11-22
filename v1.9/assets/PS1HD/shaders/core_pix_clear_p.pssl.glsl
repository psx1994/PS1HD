#version 450

layout(binding = 0, std140) uniform type_pix_clear_constants
{
    vec4 m_color;
} pix_clear_constants;

layout(location = 0) out vec4 out_var_SV_Target0;

void main()
{
    out_var_SV_Target0 = pix_clear_constants.m_color;
}

