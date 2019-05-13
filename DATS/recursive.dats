staload "SATS/recursive.sats"
staload "$PATSHOMELOCS/either-0.2.4/either.sats"

implement {a}{b} cata (f, x) =
  f(map(lam x0 => cata(f, x0), project(x)))

implement {a}{b} ana (f, x) =
  embed(map(lam x0 => ana(f, x0), f(x)))

implement {a}{b}{x} hylo (f, g, x) =
  f(map(lam x0 => hylo(f, g, x0), g(x)))

implement {a}{b}{x} elgot (f, g, x) =
  either_(lam x0 => x0, lam x0 => f(map(lam y0 => elgot(f, g, y0), x0)), g(x))
