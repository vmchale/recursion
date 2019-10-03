staload "SATS/recursive_prf.sats"

// Proof-level catamorphism
prfun {A:prop}{B:prop} CATA {n:nat} .<n>. (F : ALGEBRA(A, B), A : FUNCTOR_PROP(A, n)) : B =
  sif n == 0 then
    F(STOP)
  else
    F(MAP(lam A0 =<prf> CATA(F,A0),PROJECT(A)))

prfun {a:view}{b:view} cata_v {n:nat} .<n>. (f : algebra_v(a, b), a : functor_v(a, n)) : b =
  sif n == 0 then
    let
      prval () = gfree_v(a)
    in
      f(stop_v())
    end
  else
    f(map_v(lam a0 =<prf> cata_v(f,a0),project_v(a)))
