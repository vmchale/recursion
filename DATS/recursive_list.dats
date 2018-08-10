staload "SATS/recursive.sats"
staload "libats/ML/SATS/basis.sats"

absimpl base_functor_type(a: t@ype, x: t@ype) = list0(x)

implement {a}{x0}{x1} map (f, x) =
  case+ x of
    | list0_cons (x, xs) => list0_cons(f(x), map(f, xs))
    | list0_nil() => list0_nil()
