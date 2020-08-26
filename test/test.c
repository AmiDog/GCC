/*
 * test.c
 */

#define MAKE_TEST(prefix, operation)                                     \
                                                                         \
void prefix ## test_u2(unsigned short *dst, unsigned short *src)         \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_u4a(unsigned int *dst, unsigned int *src)            \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_u4b(unsigned long *dst, unsigned long *src)          \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_u8(unsigned long long *dst, unsigned long long *src) \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_u2i(unsigned short *dst)                             \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_u4ia(unsigned int *dst)                              \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_u4ib(unsigned long *dst)                             \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_u8i(unsigned long long *dst)                         \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_s2(signed short *dst, signed short *src)             \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_s4a(signed int *dst, signed int *src)                \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_s4b(signed long *dst, signed long *src)              \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_s8(signed long long *dst, signed long long *src)     \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_s2i(signed short *dst)                               \
{                                                                        \
  *dst operation -0x1234;                                                \
}                                                                        \
                                                                         \
void prefix ## test_s4ia(signed int *dst)                                \
{                                                                        \
  *dst operation -0x1234;                                                \
}                                                                        \
                                                                         \
void prefix ## test_s4ib(signed long *dst)                               \
{                                                                        \
  *dst operation -0x1234;                                                \
}                                                                        \
                                                                         \
void prefix ## test_s8i(signed long long *dst)                           \
{                                                                        \
  *dst operation -0x1234;                                                \
}

MAKE_TEST(add, +=)
MAKE_TEST(sub, -=)
MAKE_TEST(and, &=)
MAKE_TEST(or, |=)
MAKE_TEST(xor, ^=)

MAKE_TEST(mult, *=)
MAKE_TEST(div, /=)
