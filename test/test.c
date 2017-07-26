/*
 * test.c
 */

void addtest_2(unsigned short *dst, unsigned short *src)
{
  *dst += *src;
}

void addtest_4a(unsigned int *dst, unsigned int *src)
{
  *dst += *src;
}

void addtest_4b(unsigned long *dst, unsigned long *src)
{
  *dst += *src;
}

void addtest_8(unsigned long long *dst, unsigned long long *src)
{
  *dst += *src;
}
