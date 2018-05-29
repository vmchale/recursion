abstype recursive_functor_type(a: t@ype+) = ptr
abstype base_functor_type(a: t@ype, x: t@ype+) = ptr

typedef recursive_functor(a: t@ype) = recursive_functor_type(a)
typedef base_functor(a: t@ype, x: t@ype) = base_functor_type(a, x)
typedef algebra(a: t@ype, x: t@ype) = base_functor(a, x) -<cloref1> x

// Projection
fun {a:t@ype} project (recursive_functor(a)) : base_functor(a, recursive_functor(a))

// A catamorphism
fun {a:t@ype}{b:t@ype} cata (algebra(a,b), recursive_functor(a)) : b

// Lift a function using a functor
fun {a:t@ype}{x0:t@ype}{x1:t@ype} map (f : x0 -<cloref1> x1, base_functor(a,x0)) :
  base_functor(a, x1)
