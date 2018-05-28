staload "SATS/recursive.sats"

datatype list0f(a: t@ype, x: t@ype+) =
  | list0_consf of (a, x)
  | list0_nilf of ()

assume base_functor_type (a: t@ype, x: t@ype) = list0f(a, x)
