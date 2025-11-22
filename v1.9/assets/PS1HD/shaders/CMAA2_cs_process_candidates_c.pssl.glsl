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
layout(local_size_x = 128, local_size_y = 1, local_size_z = 1) in;

layout(binding = 2, std430) buffer type_RWStructuredBuffer_uint
{
    uint _m0[];
} g_workingShapeCandidates;

layout(binding = 3, std430) buffer g_workingDeferredBlendLocationList
{
    uint _m0[];
} g_workingDeferredBlendLocationList_1;

layout(binding = 4, std430) buffer type_RWStructuredBuffer_v2uint
{
    uvec2 _m0[];
} g_workingDeferredBlendItemList;

layout(binding = 6, std430) buffer type_RWByteAddressBuffer
{
    uint _m0[];
} g_workingControlBuffer;

layout(binding = 1, r32ui) uniform readonly uimage2D g_workingEdges;
layout(binding = 5, r32ui) uniform uimage2D g_workingDeferredBlendItemListHeads;

shared uint g_groupSharedBlendItemCount;
shared uvec2 g_groupSharedBlendItems[768];

void main()
{
    if (gl_LocalInvocationID.x == 0u)
    {
        g_groupSharedBlendItemCount = 0u;
    }
    barrier();
    if (gl_GlobalInvocationID.x < g_workingControlBuffer._m0[3u])
    {
        uint _116 = g_workingShapeCandidates._m0[gl_GlobalInvocationID.x];
        uint _117 = _116 >> 18u;
        uint _118 = _116 & 16383u;
        uvec2 _119 = uvec2(_117, _118);
        ivec2 _120 = ivec2(_119);
        int _121 = _120.x;
        uint _122 = uint(_121);
        uint _124 = _122 / 2u;
        int _125 = _120.y;
        uint _126 = uint(_125);
        uvec4 _130 = imageLoad(g_workingEdges, ivec2(uvec2(_124, _126)));
        uint _133 = ((_122 % 2u) * 4u) & 31u;
        uint _135 = (_130.x >> _133) & 15u;
        float _138 = float((_135 & 1u) != 0u);
        float _141 = float((_135 & 2u) != 0u);
        float _144 = float((_135 & 4u) != 0u);
        float _147 = float((_135 & 8u) != 0u);
        uint _149 = uint(_121 + (-1));
        uvec4 _155 = imageLoad(g_workingEdges, ivec2(uvec2(_149 / 2u, _126)));
        uint _160 = (_155.x >> (((_149 % 2u) * 4u) & 31u)) & 15u;
        float _163 = float((_160 & 2u) != 0u);
        float _166 = float((_160 & 8u) != 0u);
        uint _168 = uint(_121 + 1);
        uvec4 _174 = imageLoad(g_workingEdges, ivec2(uvec2(_168 / 2u, _126)));
        uint _179 = (_174.x >> (((_168 % 2u) * 4u) & 31u)) & 15u;
        float _182 = float((_179 & 1u) != 0u);
        float _185 = float((_179 & 2u) != 0u);
        float _188 = float((_179 & 8u) != 0u);
        uvec4 _194 = imageLoad(g_workingEdges, ivec2(uvec2(_124, uint(_125 + 1))));
        uint _197 = (_194.x >> _133) & 15u;
        float _200 = float((_197 & 1u) != 0u);
        float _203 = float((_197 & 4u) != 0u);
        uvec4 _209 = imageLoad(g_workingEdges, ivec2(uvec2(_124, uint(_125 + (-1)))));
        uint _212 = (_209.x >> _133) & 15u;
        float _215 = float((_212 & 1u) != 0u);
        float _218 = float((_212 & 4u) != 0u);
        float _221 = float((_212 & 8u) != 0u);
        uint _223 = atomicAdd(g_workingControlBuffer._m0[12u], 1u);
        uvec2 _224 = _119 / uvec2(2u);
        uint _234 = imageAtomicExchange(g_workingDeferredBlendItemListHeads, ivec2(_224), _223 | ((((((_118 % 2u) * 2u) + (_117 % 2u)) << 30u) | 0u) | 0u));
        uint _235 = packHalf2x16(vec2(0.0));
        uint _236 = _235 + 4u;
        g_workingDeferredBlendItemList._m0[_223] = uvec2(_234, (((_236 >> 3u) & 2047u) | ((_236 << 8u) & 4192256u)) | (((_235 + 8u) << 18u) & 4290772992u));
        if (_234 == 4294967295u)
        {
            uint _252 = atomicAdd(g_workingControlBuffer._m0[8u], 1u);
            g_workingDeferredBlendLocationList_1._m0[_252] = (_224.x << 16u) | _224.y;
        }
        uint _259 = uint(_121 + 2);
        uint _270 = (imageLoad(g_workingEdges, ivec2(uvec2(_259 / 2u, _126))).x >> (((_259 % 2u) * 4u) & 31u)) & 15u;
        float _273 = float((_270 & 2u) != 0u);
        float _276 = float((_270 & 8u) != 0u);
        float _287 = ((_138 * _141) * _188) * fma(-0.699999988079071044921875, ((_273 + _166) + _144) + _182, (2.0 + (_163 + _276)) - (_147 + _185));
        float _298 = ((_138 * _147) * _185) * fma(-0.699999988079071044921875, ((_276 + _163) + _144) + _182, (2.0 + (_166 + _273)) - (_141 + _188));
        float _299 = isnan(_298) ? _287 : (isnan(_287) ? _298 : max(_287, _298));
        bool _304;
        if (_299 > 0.0)
        {
            _304 = _287 > _298;
        }
        else
        {
            _304 = false;
        }
        uint _313 = (imageLoad(g_workingEdges, ivec2(uvec2(_124, uint(_125 + (-2))))).x >> _133) & 15u;
        float _316 = float((_313 & 1u) != 0u);
        float _319 = float((_313 & 4u) != 0u);
        float _330 = ((_147 * _138) * _218) * fma(-0.699999988079071044921875, ((_316 + _203) + _141) + _221, (2.0 + (_200 + _319)) - (_144 + _215));
        float _341 = ((_147 * _144) * _215) * fma(-0.699999988079071044921875, ((_319 + _200) + _141) + _221, (2.0 + (_203 + _316)) - (_138 + _218));
        float _342 = isnan(_341) ? _330 : (isnan(_330) ? _341 : max(_330, _341));
        bool _343 = _342 > _299;
        bool _347;
        if (_343)
        {
            _347 = _330 > _341;
        }
        else
        {
            _347 = _304;
        }
        bool _348 = _343 ? false : true;
        float _349 = _343 ? _342 : _299;
        if (_349 > 0.0)
        {
            float _355 = floor(clamp(4.0 - _349, 0.0, 3.0));
            vec2 _357 = mix(vec2(0.0, -1.0), vec2(1.0, 0.0), bvec2(_348));
            uint _358 = _348 ? 2u : 1u;
            uint _359 = _348 ? 8u : 4u;
            uint _360 = _347 ? _359 : _358;
            uint _361 = _347 ? _358 : _359;
            float _369;
            float _371;
            vec2 _374;
            bool _364;
            bool _367;
            bool _363 = true;
            bool _366 = true;
            float _368 = 1.0;
            float _370 = 1.0;
            SPIRV_CROSS_LOOP
            for (;;)
            {
                _374 = vec2(_119);
                ivec2 _377 = ivec2(_374 - (_357 * _370));
                uint _379 = uint(_377.x);
                ivec2 _396 = ivec2(_374 + (_357 * (_368 + 1.0)));
                uint _398 = uint(_396.x);
                if (_366)
                {
                    _367 = (((imageLoad(g_workingEdges, ivec2(uvec2(_379 / 2u, uint(_377.y)))).x >> (((_379 % 2u) * 4u) & 31u)) & 15u) & _361) == _361;
                }
                else
                {
                    _367 = false;
                }
                if (_363)
                {
                    _364 = (((imageLoad(g_workingEdges, ivec2(uvec2(_398 / 2u, uint(_396.y)))).x >> (((_398 % 2u) * 4u) & 31u)) & 15u) & _360) == _360;
                }
                else
                {
                    _364 = false;
                }
                _371 = _370 + float(_367);
                _369 = _368 + float(_364);
                bool _427;
                if (!_367)
                {
                    _427 = !_364;
                }
                else
                {
                    _427 = false;
                }
                float _430 = fma(1.25, isnan(_371) ? _369 : (isnan(_369) ? _371 : min(_369, _371)), -0.25);
                if ((_427 ? 86.0 : (isnan(_371) ? _369 : (isnan(_369) ? _371 : max(_369, _371)))) >= (isnan(_430) ? 86.0 : (isnan(86.0) ? _430 : min(86.0, _430))))
                {
                    break;
                }
                _363 = _364;
                _366 = _367;
                _368 = _369;
                _370 = _371;
                continue;
            }
            float _434 = _371 - _355;
            float _435 = _369 - _355;
            float _436 = _434 + _435;
            if (_436 >= 5.0)
            {
                float _442;
                float _443;
                float _446;
                float _450;
                float _453;
                float _455;
                bool _509;
                do
                {
                    _442 = _434 - 2.0 * trunc(_434 / 2.0);
                    _443 = _435 - 2.0 * trunc(_435 / 2.0);
                    _446 = clamp((_436 - _355) * 0.1500000059604644775390625, 0.0, 1.0);
                    _450 = 1.0 - floor((_434 + 1.0) * 0.5);
                    _453 = floor((_435 + 1.0) * 0.5);
                    _455 = (_453 - _450) + 1.0;
                    uint _456 = uint(_455);
                    uint _457 = atomicAdd(g_groupSharedBlendItemCount, _456);
                    if ((_457 + _456) > 768u)
                    {
                        _509 = false;
                        break;
                    }
                    float _464 = 1.0 / fma(-0.2199999988079071044921875, _443, fma(-0.2199999988079071044921875, _442, _455));
                    float _466 = fma(-0.2199999988079071044921875, _442, 0.5) - _450;
                    uint _469 = ((_117 << 18u) | 0u) | _118;
                    uint _475 = uint((int(_348) << 31) | (int(_347) << 30));
                    uint _477 = _457;
                    float _480 = _450;
                    for (; _480 <= _453; )
                    {
                        float _485 = float(_480 > 0.0);
                        float _487 = fma(-_485, 2.0, 1.0);
                        g_groupSharedBlendItems[_477] = uvec2(ivec2(int(_469), int(((_475 | (uint(_480 + 256.0) << 20u)) | (uint(_487 + 256.0) << 10u)) | uint(fma(clamp(fma(_464 * (_480 + _466), _487, _485) * _446, 0.0, 1.0), 1023.0, 0.5)))));
                        _477++;
                        _480 += 1.0;
                        continue;
                    }
                    _509 = true;
                    break;
                } while(false);
                if (!_509)
                {
                    float _515 = 1.0 / fma(-0.2199999988079071044921875, _443, fma(-0.2199999988079071044921875, _442, _455));
                    float _517 = fma(-0.2199999988079071044921875, _442, 0.5) - _450;
                    for (float _519 = _450; _519 <= _453; _519 += 1.0)
                    {
                        float _526 = float(_519 > 0.0);
                        uvec2 _537 = uvec2(_374 + (_357 * _519));
                        uint _538 = atomicAdd(g_workingControlBuffer._m0[12u], 1u);
                        uvec2 _539 = _537 / uvec2(2u);
                        uint _551 = imageAtomicExchange(g_workingDeferredBlendItemListHeads, ivec2(_539), _538 | ((((((_537.y % 2u) * 2u) + (_537.x % 2u)) << 30u) | 0u) | 67108864u));
                        vec3 _552 = clamp(mix(vec3(0.0), vec3(0.0), vec3(fma(_515 * (_519 + _517), fma(-_526, 2.0, 1.0), _526) * _446)), vec3(0.0), vec3(1.99999988079071044921875));
                        g_workingDeferredBlendItemList._m0[_538] = uvec2(_551, ((((packHalf2x16(vec2(_552.x, 0.0)) + 4u) >> 3u) & 2047u) | (((packHalf2x16(vec2(_552.y, 0.0)) + 4u) << 8u) & 4192256u)) | (((packHalf2x16(vec2(_552.z, 0.0)) + 8u) << 18u) & 4290772992u));
                        if (_551 == 4294967295u)
                        {
                            uint _579 = atomicAdd(g_workingControlBuffer._m0[8u], 1u);
                            g_workingDeferredBlendLocationList_1._m0[_579] = (_539.x << 16u) | _539.y;
                        }
                    }
                }
            }
        }
    }
    barrier();
    uint _589 = ((min(768u, g_groupSharedBlendItemCount) + 127u) - gl_LocalInvocationID.x) / 128u;
    for (uint _591 = 0u; _591 < _589; _591++)
    {
        uint _598 = (_591 * 128u) + gl_LocalInvocationID.x;
        uvec2 _600 = g_groupSharedBlendItems[_598];
        uvec2 _620 = uvec2(_600.x >> 18u, _600.x & 16383u) + uvec2(mix(vec2(0.0, -1.0), vec2(1.0, 0.0), bvec2(((_600.y >> 31u) & 1u) != 0u)) * (float((_600.y >> 20u) & 1023u) - 256.0));
        uint _624 = atomicAdd(g_workingControlBuffer._m0[12u], 1u);
        uvec2 _625 = _620 / uvec2(2u);
        uint _637 = imageAtomicExchange(g_workingDeferredBlendItemListHeads, ivec2(_625), _624 | ((((((_620.y % 2u) * 2u) + (_620.x % 2u)) << 30u) | 0u) | 67108864u));
        vec3 _638 = clamp(mix(vec3(0.0), vec3(0.0), vec3(float(_600.y & 1023u) * 0.000977517105638980865478515625)), vec3(0.0), vec3(1.99999988079071044921875));
        g_workingDeferredBlendItemList._m0[_624] = uvec2(_637, ((((packHalf2x16(vec2(_638.x, 0.0)) + 4u) >> 3u) & 2047u) | (((packHalf2x16(vec2(_638.y, 0.0)) + 4u) << 8u) & 4192256u)) | (((packHalf2x16(vec2(_638.z, 0.0)) + 8u) << 18u) & 4290772992u));
        if (_637 == 4294967295u)
        {
            uint _665 = atomicAdd(g_workingControlBuffer._m0[8u], 1u);
            g_workingDeferredBlendLocationList_1._m0[_665] = (_625.x << 16u) | _625.y;
        }
    }
}

