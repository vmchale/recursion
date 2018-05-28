abstype recursive_functor_type(a: t@ype+) = ptr
abstype base_functor_type(a: t@ype, x: t@ype+) = ptr

typedef recursive_functor(a: t@ype) = recursive_functor_type(a)
typedef base_functor(a: t@ype, x: t@ype) = base_functor_type(a, x)
typedef algebra(a: t@ype, x: t@ype) = base_functor(a, x) -<cloref1> x

// FIXME the type of project (for lists) should be list0(a) -> list0f(a, list0(a))
fun {a:t@ype} project (recursive_functor(a)) :
  base_functor(a, recursive_functor(a))

fun {a:t@ype}{b:t@ype} cata (algebra(a,b), a) : b
