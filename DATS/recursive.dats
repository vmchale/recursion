staload "SATS/recursive.sats"

implement {a}{b} cata (f, x) =
  f(map(lam x0 => cata(f, x0), project(x)))
