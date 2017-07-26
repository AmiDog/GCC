/* Test the `vbslQs64' ARM Neon intrinsic.  */
/* This file was autogenerated by neon-testgen.  */

/* { dg-do assemble } */
/* { dg-require-effective-target arm_neon_ok } */
/* { dg-options "-save-temps -O0" } */
/* { dg-add-options arm_neon } */

#include "arm_neon.h"

void test_vbslQs64 (void)
{
  int64x2_t out_int64x2_t;
  uint64x2_t arg0_uint64x2_t;
  int64x2_t arg1_int64x2_t;
  int64x2_t arg2_int64x2_t;

  out_int64x2_t = vbslq_s64 (arg0_uint64x2_t, arg1_int64x2_t, arg2_int64x2_t);
}

/* { dg-final { scan-assembler "((vbsl)|(vbit)|(vbif))\[ 	\]+\[qQ\]\[0-9\]+, \[qQ\]\[0-9\]+, \[qQ\]\[0-9\]+!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
/* { dg-final { cleanup-saved-temps } } */
