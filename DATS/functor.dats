staload "SATS/functor.sats"
staload "libats/ML/SATS/basis.sats"

implement {a}{b} replace (x, y) =
  map(lam x0 =<cloref1> x, y)

implement {a} void_ (x) =
  replace((), x)
