/* RuleTree:
rt :=
TFCall_tag( TFCall(TRC(TTensorI(MDDFT([ 4, 4, 4 ], 63, false), 4, APar, APar)), rec(
  fname := "batch3ddft4x4_cu_cu",
  params := [  ] )).withTags([ ASIMTKernelFlag(ASIMTGridDimY), ASIMTGridDimX, ASIMTBlockDimZ ]),
  TRC_SIMT( TRC(TTensorI(MDDFT([ 4, 4, 4 ], 63, false), 4, APar, APar)).withTags([ ASIMTKernelFlag(ASIMTGridDimY), ASIMTGridDimX, ASIMTBlockDimZ ]),
    IxA_SIMT( TTensorI(MDDFT([ 4, 4, 4 ], 63, false), 4, APar, APar).withTags([ ASIMTKernelFlag(ASIMTGridDimY), ASIMTGridDimX, ASIMTBlockDimZ ]),
      MDDFT_RowCol_3D_SIMT( MDDFT([ 4, 4, 4 ], 63, false).withTags([ ASIMTGridDimX, ASIMTBlockDimZ ]),
        MDDFT_tSPL_RowCol( MDDFT([ 4, 4 ], 15, false).withTags([ ASIMTBlockDimZ ]),
          IxB_AxI( TTensor(MDDFT([ 4 ], 3, false), MDDFT([ 4 ], 3, false)).withTags([ ASIMTBlockDimZ ]),
            TCompose_tag( TCompose([ TTensorI(MDDFT([ 4 ], 3, false), 4, APar, APar), TTensorI(MDDFT([ 4 ], 3, false), 4, AVec, AVec) ]).withTags([ ASIMTBlockDimZ ]),
              IxA_SIMT( TTensorI(MDDFT([ 4 ], 3, false), 4, APar, APar).withTags([ ASIMTBlockDimZ ]),
                MDDFT_Base( MDDFT([ 4 ], 3, false),
                  DFT_CT( DFT(4, 3),
                    DFT_Base( DFT(2, 1) ),
                    DFT_Base( DFT(2, 1) ) ) ) ),
              AxI_SIMT( TTensorI(MDDFT([ 4 ], 3, false), 4, AVec, AVec).withTags([ ASIMTBlockDimZ ]),
                MDDFT_Base( MDDFT([ 4 ], 3, false),
                  DFT_CT( DFT(4, 3),
                    DFT_Base( DFT(2, 1) ),
                    DFT_Base( DFT(2, 1) ) ) ) ) ) ) ),
        DFT_CT( DFT(4, 3),
          DFT_Base( DFT(2, 1) ),
          DFT_Base( DFT(2, 1) ) ) ) ) ) )
;
*/


/*
 * This code was generated by Spiral 8.3.0, www.spiral.net
 */

/*
__device__ double P1[512];
__device__ double P2[512];
*/

extern "C" __global__ void ker_batch3ddft4x4_cu_cu0(double  *X, double * P1) {
    double s25, s26, s27, s28, s29, s30, s31, s32, 
            t89, t90, t91, t92, t93, t94, t95, t96;
    int a84, a85, a86, a87, a88, a89, a90, a91;
    a84 = ((128*blockIdx.y) + (32*blockIdx.x) + (8*blockIdx.z));
    s25 = X[a84];
    a85 = (a84 + 1);
    s26 = X[a85];
    a86 = (a84 + 4);
    s27 = X[a86];
    a87 = (a84 + 5);
    s28 = X[a87];
    t89 = (s25 + s27);
    t90 = (s26 + s28);
    t91 = (s25 - s27);
    t92 = (s26 - s28);
    a88 = (a84 + 2);
    s29 = X[a88];
    a89 = (a84 + 3);
    s30 = X[a89];
    a90 = (a84 + 6);
    s31 = X[a90];
    a91 = (a84 + 7);
    s32 = X[a91];
    t93 = (s29 + s31);
    t94 = (s30 + s32);
    t95 = (s29 - s31);
    t96 = (s30 - s32);
    P1[a84] = (t89 + t93);
    P1[a85] = (t90 + t94);
    P1[a86] = (t89 - t93);
    P1[a87] = (t90 - t94);
    P1[a88] = (t91 + t96);
    P1[a89] = (t92 - t95);
    P1[a90] = (t91 - t96);
    P1[a91] = (t92 + t95);
}

extern "C" __global__ void ker_batch3ddft4x4_cu_cu1(double *P1, double *P2) {
    double s57, s58, s59, s60, s61, s62, s63, s64, 
            t137, t138, t139, t140, t141, t142, t143, t144;
    int a180, a181, a182;
    a180 = (128*blockIdx.y);
    a181 = (a180 + (8*blockIdx.z) + (2*blockIdx.x));
    s57 = P1[a181];
    s58 = P1[(a181 + 1)];
    s59 = P1[(a181 + 64)];
    s60 = P1[(a181 + 65)];
    t137 = (s57 + s59);
    t138 = (s58 + s60);
    t139 = (s57 - s59);
    t140 = (s58 - s60);
    s61 = P1[(a181 + 32)];
    s62 = P1[(a181 + 33)];
    s63 = P1[(a181 + 96)];
    s64 = P1[(a181 + 97)];
    t141 = (s61 + s63);
    t142 = (s62 + s64);
    t143 = (s61 - s63);
    t144 = (s62 - s64);
    a182 = (a180 + (2*blockIdx.z) + (32*blockIdx.x));
    P2[a182] = (t137 + t141);
    P2[(a182 + 1)] = (t138 + t142);
    P2[(a182 + 16)] = (t137 - t141);
    P2[(a182 + 17)] = (t138 - t142);
    P2[(a182 + 8)] = (t139 + t144);
    P2[(a182 + 9)] = (t140 - t143);
    P2[(a182 + 24)] = (t139 - t144);
    P2[(a182 + 25)] = (t140 + t143);
}

extern "C" __global__ void ker_batch3ddft4x4_cu_cu2(double  *Y, double *P2) {
    double s89, s90, s91, s92, s93, s94, s95, s96, 
            t185, t186, t187, t188, t189, t190, t191, t192;
    int a271, a272, a273;
    a271 = (128*blockIdx.y);
    a272 = (a271 + (8*blockIdx.z) + (32*blockIdx.x));
    s89 = P2[a272];
    s90 = P2[(a272 + 1)];
    s91 = P2[(a272 + 4)];
    s92 = P2[(a272 + 5)];
    t185 = (s89 + s91);
    t186 = (s90 + s92);
    t187 = (s89 - s91);
    t188 = (s90 - s92);
    s93 = P2[(a272 + 2)];
    s94 = P2[(a272 + 3)];
    s95 = P2[(a272 + 6)];
    s96 = P2[(a272 + 7)];
    t189 = (s93 + s95);
    t190 = (s94 + s96);
    t191 = (s93 - s95);
    t192 = (s94 - s96);
    a273 = (a271 + (32*blockIdx.z) + (2*blockIdx.x));
    Y[a273] = (t185 + t189);
    Y[(a273 + 1)] = (t186 + t190);
    Y[(a273 + 16)] = (t185 - t189);
    Y[(a273 + 17)] = (t186 - t190);
    Y[(a273 + 8)] = (t187 + t192);
    Y[(a273 + 9)] = (t188 - t191);
    Y[(a273 + 24)] = (t187 - t192);
    Y[(a273 + 25)] = (t188 + t191);
}

