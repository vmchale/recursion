staload "SATS/recursive.sats"
staload "SATS/functor.sats"
staload "libats/ML/SATS/list0.sats"

datatype list0f(a: t@ype, x: t@ype+) =
  | list0_consf of (a, x)
  | list0_nilf of ()

assume base_functor_type(a: t@ype, x: t@ype) = list0f(a, x)
assume recursive_functor_type(a: t@ype) = list0(a)

implement {a} project (x) =
  case+ x of
    | list0_cons (y, ys) => list0_consf(y, ys)
    | list0_nil() => list0_nilf()
