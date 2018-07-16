staload "SATS/recursive.sats"

implement {a}{b} cata (f, x) =
  f(map(lam x0 => cata(f, x0), project(x)))

implement {a}{b} ana (f, x) =
  embed(map(lam x0 => ana(f, x0), f(x)))
