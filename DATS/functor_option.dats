staload "SATS/functor.sats"

assume functor_type(a:t@ype) = Option(a)

implement {a}{b} map(f, x) = 
  case+ x of
    | Some(x0) => Some(f(x0))
    | None() => None
