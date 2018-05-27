staload "SATS/functor.sats"

// base functor type
abstype recursive_type(a: t@ype, x: t@ype+) = ptr

typedef recursive(a: t@ype, x: t@ype+) = recursive_type(a, x)
typedef algebra(a: t@ype, x: t@ype+) = recursive(a, x) -<cloref1> a

datatype list0f(a: t@ype, x: t@ype+) =
  | cons_f(a, x) of list0f(a, x)
  | nil_f of ()

fun {a:t@ype}{x:t@ype} project (a) : recursive(a, x)

fun {a:t@ype}{b:t@ype}{x:t@ype} cata (algebra(a,x), b) : b
