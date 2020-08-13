/*
 * test.c
 */

#define MAKE_TEST(prefix, operation)                                     \
                                                                         \
void prefix ## test_2(unsigned short *dst, unsigned short *src)          \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_4a(unsigned int *dst, unsigned int *src)             \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_4b(unsigned long *dst, unsigned long *src)           \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_8(unsigned long long *dst, unsigned long long *src)  \
{                                                                        \
  *dst operation *src;                                                   \
}                                                                        \
                                                                         \
void prefix ## test_2i(unsigned short *dst)                              \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_4ia(unsigned int *dst)                               \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_4ib(unsigned long *dst)                              \
{                                                                        \
  *dst operation 0x1234;                                                 \
}                                                                        \
                                                                         \
void prefix ## test_8i(unsigned long long *dst)                          \
{                                                                        \
  *dst operation 0x1234;                                                 \
}

MAKE_TEST(add, +=)
MAKE_TEST(sub, -=)
MAKE_TEST(and, &=)
MAKE_TEST(or, |=)
MAKE_TEST(xor, ^=)
