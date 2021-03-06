{
  'ByteOrder' => 'LittleEndian',
  'CharSize' => 1,
  'CompoundAlignment' => 1,
  'DoubleSize' => 8,
  'EnumSize' => 0,
  'FloatSize' => 4,
  'HasCPPComments' => 1,
  'IntSize' => 4,
  'LongDoubleSize' => 16,
  'LongLongSize' => 8,
  'LongSize' => 8,
  'PointerSize' => 8,
  'ShortSize' => 2,
  'UnsignedChars' => 0,
  Include => [
    'tests/include/pdclib/include',
    'tests/include/pdclib/platform/example/include',
  ],
  Define => [
    '__attribute__(x)=',
    '__CHAR_BIT__=8',
    '__DBL_DIG__=15',
    '__DBL_EPSILON__=((double)2.22044604925031308084726333618164062e-16L)',
    '__DBL_MANT_DIG__=53',
    '__DBL_MAX_10_EXP__=308',
    '__DBL_MAX_EXP__=1024',
    '__DBL_MAX__=((double)1.79769313486231570814527423731704357e+308L)',
    '__DBL_MIN_10_EXP__=(-307)',
    '__DBL_MIN_EXP__=(-1021)',
    '__DBL_MIN__=((double)2.22507385850720138309023271733240406e-308L)',
    '__FLT128_DECIMAL_DIG__=36',
    '__FLT_DIG__=6',
    '__FLT_EPSILON__=1.19209289550781250000000000000000000e-7F',
    '__FLT_MANT_DIG__=24',
    '__FLT_MAX_10_EXP__=38',
    '__FLT_MAX_EXP__=128',
    '__FLT_MAX__=3.40282346638528859811704183484516925e+38F',
    '__FLT_MIN_10_EXP__=(-37)',
    '__FLT_MIN_EXP__=(-125)',
    '__FLT_MIN__=1.17549435082228750796873653722224568e-38F',
    '__FLT_RADIX__=2',
    '__INT16_C=__INT16_C',
    '__INT32_C=__INT32_C',
    '__INT64_C=__INT64_C',
    '__INT8_C=__INT8_C',
    '__INTMAX_C=__INTMAX_C',
    '__INTMAX_MAX__=0x7fffffffffffffffL',
    '__INTMAX_TYPE__=long int',
    '__INTPTR_MAX__=0x7fffffffffffffffL',
    '__INTPTR_TYPE__=long int',
    '__INT_FAST16_MAX__=0x7fffffffffffffffL',
    '__INT_FAST16_TYPE__=long int',
    '__INT_FAST32_MAX__=0x7fffffffffffffffL',
    '__INT_FAST32_TYPE__=long int',
    '__INT_FAST64_MAX__=0x7fffffffffffffffL',
    '__INT_FAST64_TYPE__=long int',
    '__INT_FAST8_MAX__=0x7f',
    '__INT_FAST8_TYPE__=signed char',
    '__INT_LEAST16_MAX__=0x7fff',
    '__INT_LEAST16_TYPE__=short int',
    '__INT_LEAST32_MAX__=0x7fffffff',
    '__INT_LEAST32_TYPE__=int',
    '__INT_LEAST64_MAX__=0x7fffffffffffffffL',
    '__INT_LEAST64_TYPE__=long int',
    '__INT_LEAST8_MAX__=0x7f',
    '__INT_LEAST8_TYPE__=signed char',
    '__INT_MAX__=0x7fffffff',
    '__LDBL_DECIMAL_DIG__=21',
    '__LDBL_DIG__=18',
    '__LDBL_EPSILON__=1.08420217248550443400745280086994171e-19L',
    '__LDBL_MANT_DIG__=64',
    '__LDBL_MAX_10_EXP__=4932',
    '__LDBL_MAX_EXP__=16384',
    '__LDBL_MAX__=1.18973149535723176502126385303097021e+4932L',
    '__LDBL_MIN_10_EXP__=(-4931)',
    '__LDBL_MIN_EXP__=(-16381)',
    '__LDBL_MIN__=3.36210314311209350626267781732175260e-4932L',
    '__LONG_LONG_MAX__=0x7fffffffffffffffLL',
    '__LONG_MAX__=0x7fffffffffffffffL',
    '__PTRDIFF_MAX__=0x7fffffffffffffffL',
    '__PTRDIFF_TYPE__=long int',
    '__SCHAR_MAX__=0x7f',
    '__SHRT_MAX__=0x7fff',
    '__SIG_ATOMIC_MAX__=0x7fffffff',
    '__SIZE_MAX__=0xffffffffffffffffUL',
    '__SIZE_TYPE__=long unsigned int',
    '__UINT16_C=__UINT16_C',
    '__UINT32_C=__UINT32_C',
    '__UINT64_C=__UINT64_C',
    '__UINT8_C=__UINT8_C',
    '__UINTMAX_C=__UINTMAX_C',
    '__UINTMAX_MAX__=0xffffffffffffffffUL',
    '__UINTMAX_TYPE__=long unsigned int',
    '__UINTPTR_MAX__=0xffffffffffffffffUL',
    '__UINTPTR_TYPE__=long unsigned int',
    '__UINT_FAST16_MAX__=0xffffffffffffffffUL',
    '__UINT_FAST16_TYPE__=long unsigned int',
    '__UINT_FAST32_MAX__=0xffffffffffffffffUL',
    '__UINT_FAST32_TYPE__=long unsigned int',
    '__UINT_FAST64_MAX__=0xffffffffffffffffUL',
    '__UINT_FAST64_TYPE__=long unsigned int',
    '__UINT_FAST8_MAX__=0xff',
    '__UINT_FAST8_TYPE__=unsigned char',
    '__UINT_LEAST16_MAX__=0xffff',
    '__UINT_LEAST16_TYPE__=short unsigned int',
    '__UINT_LEAST32_MAX__=0xffffffffU',
    '__UINT_LEAST32_TYPE__=unsigned int',
    '__UINT_LEAST64_MAX__=0xffffffffffffffffUL',
    '__UINT_LEAST64_TYPE__=long unsigned int',
    '__UINT_LEAST8_MAX__=0xff',
    '__UINT_LEAST8_TYPE__=unsigned char',
    '__WCHAR_MAX__=0x7fffffff',
    '__WCHAR_MIN__=(-0x7fffffff - 1)',
    '__WCHAR_TYPE__=int',
    '__WINT_MAX__=0xffffffffU',
    '__WINT_MIN__=0U',
    '__WINT_TYPE__=unsigned int',
    '__builtin_va_list=long int',
    '__x86_64=1',
    '__x86_64__=1',
    'linux=1',
    'unix=1',
  ],
};
