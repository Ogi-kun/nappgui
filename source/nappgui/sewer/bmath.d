/** Math funcions */
module nappgui.sewer.bmath;

import nappgui.sewer.types;
import nappgui.sewer.sewer;

extern(C) @nogc nothrow:

real32_t bmath_cosf(real32_t angle);
real64_t bmath_cosd(real64_t angle);
real32_t bmath_sinf(real32_t angle);
real64_t bmath_sind(real64_t angle);
real32_t bmath_tanf(real32_t angle);
real64_t bmath_tand(real64_t angle);
real32_t bmath_acosf(real32_t cos);
real64_t bmath_acosd(real64_t cos);
real32_t bmath_asinf(real32_t sin);
real64_t bmath_asind(real64_t sin);
real32_t bmath_atan2f(real32_t y, real32_t x);
real64_t bmath_atan2d(real64_t y, real64_t x);
real32_t bmath_norm_anglef(real32_t a);
real64_t bmath_norm_angled(real64_t a);
real32_t bmath_sqrtf(real32_t value);
real64_t bmath_sqrtd(real64_t value);
real32_t bmath_isqrtf(real32_t value);
real64_t bmath_isqrtd(real64_t value);
real32_t bmath_logf(real32_t value);
real64_t bmath_logd(real64_t value);
real32_t bmath_log10f(real32_t value);
real64_t bmath_log10d(real64_t value);
real32_t bmath_expf(real32_t value);
real64_t bmath_expd(real64_t value);
real32_t bmath_powf(real32_t base, real32_t exponent);
real64_t bmath_powd(real64_t base, real64_t exponent);
real32_t bmath_absf(real32_t value);
real64_t bmath_absd(real64_t value);
real32_t bmath_maxf(real32_t value1, real32_t value2);
real64_t bmath_maxd(real64_t value1, real64_t value2);
real32_t bmath_minf(real32_t value1, real32_t value2);
real64_t bmath_mind(real64_t value1, real64_t value2);
real32_t bmath_clampf(real32_t value, real32_t min, real32_t max);
real64_t bmath_clampd(real64_t value, real64_t min, real64_t max);
real32_t bmath_modf(real32_t num, real32_t den);
real64_t bmath_modd(real64_t num, real64_t den);
real32_t bmath_modff(real32_t value, real32_t *intpart);
real64_t bmath_modfd(real64_t value, real64_t *intpart);
uint32_t bmath_precf(real32_t value);
uint32_t bmath_precd(real64_t value);
real32_t bmath_roundf(real32_t value);
real64_t bmath_roundd(real64_t value);
real32_t bmath_round_stepf(real32_t value, real32_t step);
real64_t bmath_round_stepd(real64_t value, real64_t step);
real32_t bmath_floorf(real32_t value);
real64_t bmath_floord(real64_t value);
real32_t bmath_ceilf(real32_t value);
real64_t bmath_ceild(real64_t value);
void bmath_rand_seed(uint32_t seed);
real32_t bmath_randf(real32_t from, real32_t to);
real64_t bmath_randd(real64_t from, real64_t to);
uint32_t bmath_randi(uint32_t from, uint32_t to);
REnv *bmath_rand_env(uint32_t seed);
void bmath_rand_destroy(REnv **env);
real32_t bmath_rand_mtf(REnv *env, real32_t from, real32_t to);
real64_t bmath_rand_mtd(REnv *env, real64_t from, real64_t to);
uint32_t bmath_rand_mti(REnv *env, uint32_t from, uint32_t to);

extern export __gshared {
    real32_t kBMATH_Ef;
    real64_t kBMATH_Ed;
    real32_t kBMATH_LN2f;
    real64_t kBMATH_LN2d;
    real32_t kBMATH_LN10f;
    real64_t kBMATH_LN10d;
    real32_t kBMATH_PIf;
    real64_t kBMATH_PId;
    real32_t kBMATH_SQRT2f;
    real64_t kBMATH_SQRT2d;
    real32_t kBMATH_SQRT3f;
    real64_t kBMATH_SQRT3d;
    real32_t kBMATH_DEG2RADf;
    real64_t kBMATH_DEG2RADd;
    real32_t kBMATH_RAD2DEGf;
    real64_t kBMATH_RAD2DEGd;
    real32_t kBMATH_INFINITYf;
    real64_t kBMATH_INFINITYd;
}

struct BMath(R : real32_t) {
static:
    R function(R angle) cos = &bmath_cosf;
    R function(R angle) sin = &bmath_sinf;
    R function(R angle) tan = &bmath_tanf;
    R function(R cos) acos = &bmath_acosf;
    R function(R sin) asin = &bmath_asinf;
    R function(R y, R x) atan2 = &bmath_atan2f;
    R function(R a) norm_angle = &bmath_norm_anglef;
    R function(R value) sqrt = &bmath_sqrtf;
    R function(R value) isqrt = &bmath_isqrtf;
    R function(R value) log = &bmath_logf;
    R function(R value) log10 = &bmath_log10f;
    R function(R value) exp = &bmath_expf;
    R function(R base, R exponent) pow = &bmath_powf;
    R function(R value) abs = &bmath_absf;
    R function(R value1, R value2) max = &bmath_maxf;
    R function(R value1, R value2) min = &bmath_minf;
    R function(R value, R min, R max) clamp = &bmath_clampf;
    R function(R num, R den) mod = &bmath_modf;
    R function(R value, R *intpart) modf = &bmath_modff;
    uint32_t function(R value) prec = &bmath_precf;
    R function(R value) round = &bmath_roundf;
    R function(R value, R step) round_step = &bmath_round_stepf;
    R function(R value) floor = &bmath_floorf;
    R function(R value) ceil = &bmath_ceilf;

    const R = kBMATH_Ef;
    const R = kBMATH_LN2f;
    const R = kBMATH_LN10f;
    const R = kBMATH_PIf;
    const R = kBMATH_SQRT2f;
    const R = kBMATH_SQRT3f;
    const R = kBMATH_DEG2RADf;
    const R = kBMATH_RAD2DEGf;
    const R = kBMATH_INFINITYf;
}

struct BMath(R : real64_t) {
static:
    R function(R angle) cos = &bmath_cosd;
    R function(R angle) sin = &bmath_sind;
    R function(R angle) tan = &bmath_tand;
    R function(R cos) acos = &bmath_acosd;
    R function(R sin) asin = &bmath_asind;
    R function(R y, R x) atan2 = &bmath_atan2d;
    R function(R a) norm_angle = &bmath_norm_angled;
    R function(R value) sqrt = &bmath_sqrtd;
    R function(R value) isqrt = &bmath_isqrtd;
    R function(R value) log = &bmath_logd;
    R function(R value) log10 = &bmath_log10d;
    R function(R value) exp = &bmath_expd;
    R function(R base, R exponent) pow = &bmath_powd;
    R function(R value) abs = &bmath_absd;
    R function(R value1, R value2) max = &bmath_maxd;
    R function(R value1, R value2) min = &bmath_mind;
    R function(R value, R min, R max) clamp = &bmath_clampd;
    R function(R num, R den) mod = &bmath_modd;
    R function(R value, R *intpart) modf = &bmath_modfd;
    uint32_t function(R value) prec = &bmath_precd;
    R function(R value) round = &bmath_roundd;
    R function(R value, R step) round_step = &bmath_round_stepd;
    R function(R value) floor = &bmath_floord;
    R function(R value) ceil = &bmath_ceild;

    const R = kBMATH_Ed;
    const R = kBMATH_LN2d;
    const R = kBMATH_LN10d;
    const R = kBMATH_PId;
    const R = kBMATH_SQRT2d;
    const R = kBMATH_SQRT3d;
    const R = kBMATH_DEG2RADd;
    const R = kBMATH_RAD2DEGd;
    const R = kBMATH_INFINITYd;
}