staload "SATS/recursive.sats"
staload "libats/ML/SATS/basis.sats"

datatype list0f(a: t@ype, x: t@ype+) =
  | list0_consf of (a, x)
  | list0_nilf of ()

absimpl base_functor_type(a: t@ype, x: t@ype) = list0f(a, x)
absimpl recursive_functor_type(a: t@ype) = list0(a)

implement {a} embed (x) =
  case+ x of
    | list0_consf (y, ys) => list0_cons(y, ys)
    | list0_nilf() => list0_nil()

implement {a} project (x) =
  case+ x of
    | list0_cons (y, ys) => list0_consf(y, ys)
    | list0_nil() => list0_nilf()

implement {x1}{x0}{a} map (f, x) =
  case+ x of
    | list0_consf (x, xs) => list0_consf(x, f(xs))
    | list0_nilf() => list0_nilf()
