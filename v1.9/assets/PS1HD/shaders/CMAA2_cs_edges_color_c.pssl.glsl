#version 450
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
layout(local_size_x = 16, local_size_y = 16, local_size_z = 1) in;

layout(binding = 2, std430) buffer type_RWStructuredBuffer_uint
{
    uint _m0[];
} g_workingShapeCandidates;

layout(binding = 6, std430) buffer type_RWByteAddressBuffer
{
    uint _m0[];
} g_workingControlBuffer;

layout(binding = 1, r32ui) uniform writeonly uimage2D g_workingEdges;
layout(binding = 5, r32ui) uniform writeonly uimage2D g_workingDeferredBlendItemListHeads;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedg_inoutColorReadonlySPIRV_Cross_DummySampler;
layout(binding = 0) uniform sampler2D SPIRV_Cross_Combinedg_inoutColorReadonlyg_gather_point_clamp_Sampler;

shared vec4 g_groupShared2x2FracEdgesH[256];
shared vec4 g_groupShared2x2FracEdgesV[256];

void main()
{
    uvec2 _86 = (((gl_WorkGroupID.xy * uvec2(14u)) + gl_LocalInvocationID.xy) - uvec2(1u)) * uvec2(2u);
    uint _90 = gl_LocalInvocationID.x + (gl_LocalInvocationID.y * 16u);
    bool _97 = !any(bvec4(gl_LocalInvocationID.x == 15u, gl_LocalInvocationID.x == 0u, gl_LocalInvocationID.y == 15u, gl_LocalInvocationID.y == 0u));
    uvec2 _99 = uvec2(textureSize(SPIRV_Cross_Combinedg_inoutColorReadonlySPIRV_Cross_DummySampler, 0));
    vec2 _107 = (vec2(_86) + vec2(0.5)) / vec2(float(_99.x), float(_99.y));
    vec4 _110 = textureGather(SPIRV_Cross_Combinedg_inoutColorReadonlyg_gather_point_clamp_Sampler, _107, 3);
    vec4 _112 = textureGatherOffset(SPIRV_Cross_Combinedg_inoutColorReadonlyg_gather_point_clamp_Sampler, _107, ivec2(1, 0), 3);
    vec4 _114 = textureGatherOffset(SPIRV_Cross_Combinedg_inoutColorReadonlyg_gather_point_clamp_Sampler, _107, ivec2(0, 1), 3);
    float _115 = _110.w;
    float _116 = _110.z;
    float _118 = _110.x;
    float _119 = _110.y;
    float _124 = abs(_115 - _116);
    float _126 = abs(_115 - _118);
    float _128 = abs(_116 - _112.z);
    float _130 = abs(_116 - _119);
    float _132 = abs(_118 - _119);
    float _134 = abs(_118 - _114.x);
    float _136 = abs(_119 - _112.y);
    float _138 = abs(_119 - _114.y);
    g_groupShared2x2FracEdgesV[_90] = vec4(_124, _128, _132, _136);
    g_groupShared2x2FracEdgesH[_90] = vec4(_126, _130, _134, _138);
    barrier();
    uvec4 _352;
    SPIRV_CROSS_BRANCH
    if (_97)
    {
        uint _145 = _90 - 16u;
        vec4 _147 = g_groupShared2x2FracEdgesH[_145];
        uint _148 = _90 - 1u;
        vec4 _150 = g_groupShared2x2FracEdgesV[_148];
        uvec4 _351;
        SPIRV_CROSS_BRANCH
        if (any(notEqual((vec4(_124, _126, _128, _130) + vec4(_132, _134, _136, _138)) + vec4(_147.zw, _150.yw), vec4(0.0))))
        {
            imageStore(g_workingDeferredBlendItemListHeads, ivec2(_86 / uvec2(2u)), uvec4(4294967295u));
            uint _166 = _90 - 17u;
            vec4 _168 = g_groupShared2x2FracEdgesH[_166];
            vec4 _171 = g_groupShared2x2FracEdgesV[_166];
            vec4 _174 = g_groupShared2x2FracEdgesV[_145];
            uint _177 = _90 + 4294967281u;
            vec4 _179 = g_groupShared2x2FracEdgesH[_177];
            vec4 _182 = g_groupShared2x2FracEdgesH[_148];
            uint _185 = _90 + 1u;
            vec4 _187 = g_groupShared2x2FracEdgesH[_185];
            uint _190 = _90 + 15u;
            vec4 _192 = g_groupShared2x2FracEdgesV[_190];
            uint _194 = _90 + 16u;
            vec4 _196 = g_groupShared2x2FracEdgesV[_194];
            float _199 = isnan(_174.z) ? _171.w : (isnan(_171.w) ? _174.z : max(_171.w, _174.z));
            float _200 = isnan(_124) ? _150.y : (isnan(_150.y) ? _124 : max(_150.y, _124));
            float _205 = float(fma(-(isnan(_200) ? _199 : (isnan(_199) ? _200 : max(_199, _200))), 0.100000001490116119384765625, _147.z) > 0.070000000298023223876953125);
            float _206 = isnan(_174.w) ? _174.z : (isnan(_174.z) ? _174.w : max(_174.z, _174.w));
            float _207 = isnan(_128) ? _124 : (isnan(_124) ? _128 : max(_124, _128));
            float _212 = float(fma(-(isnan(_207) ? _206 : (isnan(_206) ? _207 : max(_206, _207))), 0.100000001490116119384765625, _147.w) > 0.070000000298023223876953125);
            float _213 = isnan(_182.y) ? _168.w : (isnan(_168.w) ? _182.y : max(_168.w, _182.y));
            float _214 = isnan(_126) ? _147.z : (isnan(_147.z) ? _126 : max(_147.z, _126));
            float _219 = float(fma(-(isnan(_214) ? _213 : (isnan(_213) ? _214 : max(_213, _214))), 0.100000001490116119384765625, _150.y) > 0.070000000298023223876953125);
            float _220 = isnan(_182.w) ? _182.y : (isnan(_182.y) ? _182.w : max(_182.y, _182.w));
            float _221 = isnan(_134) ? _126 : (isnan(_126) ? _134 : max(_126, _134));
            float _226 = float(fma(-(isnan(_221) ? _220 : (isnan(_220) ? _221 : max(_220, _221))), 0.100000001490116119384765625, _150.w) > 0.070000000298023223876953125);
            float _227 = isnan(_130) ? _147.w : (isnan(_147.w) ? _130 : max(_147.w, _130));
            float _232 = float(fma(-(isnan(_227) ? _214 : (isnan(_214) ? _227 : max(_214, _227))), 0.100000001490116119384765625, _124) > 0.070000000298023223876953125);
            float _233 = isnan(_132) ? _150.w : (isnan(_150.w) ? _132 : max(_150.w, _132));
            float _238 = float(fma(-(isnan(_233) ? _200 : (isnan(_200) ? _233 : max(_200, _233))), 0.100000001490116119384765625, _126) > 0.070000000298023223876953125);
            float _239 = isnan(_187.x) ? _179.z : (isnan(_179.z) ? _187.x : max(_179.z, _187.x));
            float _244 = float(fma(-(isnan(_239) ? _227 : (isnan(_227) ? _239 : max(_227, _239))), 0.100000001490116119384765625, _128) > 0.070000000298023223876953125);
            float _245 = isnan(_136) ? _132 : (isnan(_132) ? _136 : max(_132, _136));
            float _250 = float(fma(-(isnan(_245) ? _207 : (isnan(_207) ? _245 : max(_207, _245))), 0.100000001490116119384765625, _130) > 0.070000000298023223876953125);
            float _251 = isnan(_138) ? _130 : (isnan(_130) ? _138 : max(_130, _138));
            float _256 = float(fma(-(isnan(_251) ? _221 : (isnan(_221) ? _251 : max(_221, _251))), 0.100000001490116119384765625, _132) > 0.070000000298023223876953125);
            float _257 = isnan(_196.x) ? _192.y : (isnan(_192.y) ? _196.x : max(_192.y, _196.x));
            float _262 = float(fma(-(isnan(_257) ? _233 : (isnan(_233) ? _257 : max(_233, _257))), 0.100000001490116119384765625, _134) > 0.070000000298023223876953125);
            float _263 = isnan(_187.z) ? _187.x : (isnan(_187.x) ? _187.z : max(_187.x, _187.z));
            float _268 = float(fma(-(isnan(_263) ? _251 : (isnan(_251) ? _263 : max(_251, _263))), 0.100000001490116119384765625, _136) > 0.070000000298023223876953125);
            float _269 = isnan(_196.y) ? _196.x : (isnan(_196.x) ? _196.y : max(_196.x, _196.y));
            float _274 = float(fma(-(isnan(_269) ? _245 : (isnan(_245) ? _269 : max(_245, _269))), 0.100000001490116119384765625, _138) > 0.070000000298023223876953125);
            if (fma(_205, _232, fma(_219, _205, fma(_232, _238, _238 * _219))) != 0.0)
            {
                uint _287 = atomicAdd(g_workingControlBuffer._m0[4u], 1u);
                g_workingShapeCandidates._m0[_287] = ((_86.x << 18u) | 0u) | _86.y;
            }
            uvec2 _296 = _86 + uvec2(1u, 0u);
            if (fma(_212, _244, fma(_232, _212, fma(_244, _250, _250 * _232))) != 0.0)
            {
                uint _305 = atomicAdd(g_workingControlBuffer._m0[4u], 1u);
                g_workingShapeCandidates._m0[_305] = ((_296.x << 18u) | 0u) | _296.y;
            }
            uvec2 _314 = _86 + uvec2(0u, 1u);
            if (fma(_238, _256, fma(_226, _238, fma(_256, _262, _262 * _226))) != 0.0)
            {
                uint _323 = atomicAdd(g_workingControlBuffer._m0[4u], 1u);
                g_workingShapeCandidates._m0[_323] = ((_314.x << 18u) | 0u) | _314.y;
            }
            uvec2 _332 = _86 + uvec2(1u);
            if (fma(_250, _268, fma(_256, _250, fma(_268, _274, _274 * _256))) != 0.0)
            {
                uint _341 = atomicAdd(g_workingControlBuffer._m0[4u], 1u);
                g_workingShapeCandidates._m0[_341] = ((_332.x << 18u) | 0u) | _332.y;
            }
            _351 = uvec4(uint(dot(vec4(_232, _238, _219, _205), vec4(1.0, 2.0, 4.0, 8.0))), uint(dot(vec4(_244, _250, _232, _212), vec4(1.0, 2.0, 4.0, 8.0))), uint(dot(vec4(_256, _262, _226, _238), vec4(1.0, 2.0, 4.0, 8.0))), uint(dot(vec4(_268, _274, _256, _250), vec4(1.0, 2.0, 4.0, 8.0))));
        }
        else
        {
            _351 = uvec4(0u);
        }
        _352 = _351;
    }
    else
    {
        _352 = uvec4(0u);
    }
    SPIRV_CROSS_BRANCH
    if (_97)
    {
        int _361 = int(_86.x / 2u);
        uint _362 = _86.y;
        imageStore(g_workingEdges, ivec2(uvec2(ivec2(_361, int(_362)))), uvec4((_352.y << 4u) | _352.x));
        imageStore(g_workingEdges, ivec2(uvec2(ivec2(_361, int(_362 + 1u)))), uvec4((_352.w << 4u) | _352.z));
    }
}

