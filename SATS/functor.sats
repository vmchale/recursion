abstype functor_type(a: t@ype+) = ptr

typedef functor(a: t@ype) = functor_type(a)

// implement
// {}(*tmp*)
// monad_unit() = monad_return<unit>(unit)
fun {a:t@ype}{b:t@ype} map (a -<cloref1> b, functor(a)) : functor(b)

fun {a:t@ype}{b:t@ype} replace (b, functor(a)) : functor(b)

fun {a:t@ype} void_ (functor(a)) : functor(void)
