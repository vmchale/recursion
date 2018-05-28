staload "SATS/recursive.sats"

implement {a}{b} cata (f, x) =
  f(map_base(lam x0 => cata(f, x0), project(x)))
