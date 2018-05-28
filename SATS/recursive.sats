abstype base_functor_type(a: t@ype, x: t@ype+) = ptr

typedef base_functor(a: t@ype, x: t@ype) = base_functor_type(a, x)
typedef algebra(a: t@ype, x: t@ype) = base_functor(a, x) -<cloref1> x

// TODO project function?
// fun {a:t@ype} project(
fun {a:t@ype}{b:t@ype} cata (algebra(a,b), a) : b
