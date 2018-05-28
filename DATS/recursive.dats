implement {a}{b} cata (f, x) =
  let
    val p = project(x)
    val mapped = map_base(lam x0 => cata(f, x0), p)
    val final = f(mapped)
  in
    final
  end
