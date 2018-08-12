abstype recursive_functor_type(t@ype+) = ptr
abstype base_functor_type(t@ype, t@ype+) = ptr

typedef recursive_functor(a: t@ype) = recursive_functor_type(a)
typedef base_functor(a: t@ype, x: t@ype) = base_functor_type(a, x)
typedef algebra(a: t@ype, x: t@ype) = base_functor(a, x) -<cloref1> x
typedef coalgebra(a: t@ype, x: t@ype) = x -<cloref1> base_functor(a, x)

// Projection
fun {a:t@ype} project (recursive_functor(a)) : base_functor(a, recursive_functor(a))

// Embdedding
fun {a:t@ype} embed (base_functor(a,recursive_functor(a))) : recursive_functor(a)

// A catamorphism
fun {a:t@ype}{b:t@ype} cata (algebra(a,b), recursive_functor(a)) : b

// An anamorphism
fun {a:t@ype}{b:t@ype} ana (coalgebra(b,a), a) : recursive_functor(b)

// A hylomorphism
fun {a:t@ype}{b:t@ype}{x:t@ype} hylo (algebra(x,b), coalgebra(x,a), a) : b

// Lift a function using a functor
fun {a:t@ype}{x0:t@ype}{x1:t@ype} map (x0 -<cloref1> x1, base_functor(a,x0)) : base_functor(a, x1)
