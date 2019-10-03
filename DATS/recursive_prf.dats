staload "SATS/recursive_prf.sats"

// Proof-level catamorphism
prfun {A:prop}{B:prop} CATA {n:nat} .<n>. (F : ALGEBRA(A, B), A : FUNCTOR_PROP(A, n)) : B =
  sif n == 0 then
    F(STOP)
  else
    F(MAP(lam A0 =<prf> CATA(F,A0),PROJECT(A)))

absimpl FUNCTOR_PROP(A, n) = LIST_PROP(A, n)
absimpl BASE_FUNCTOR_PROP(A, B) = LISTF_PROP(A, B)

primplmnt {a}{b} STOP =
  LISTF_PROP_NIL

prfun {a:view}{b:view} cata_v {n:nat} .<n>. (f : algebra_v(a, b), a : functor_v(a, n)) : b =
  sif n == 0 then
    let
      prval () = gfree_v(a)
    in
      f(stop_v())
    end
  else
    f(map_v(lam a0 =<prf> cata_v(f,a0),project_v(a)))

absimpl functor_v(a, n) = list_v(a, n)
absimpl base_functor_v(a, n) = list_vf(a, n)

primplmnt {a}{b} stop_v () =
  list_v_nilf()

primplmnt map_v (f, xs) =
  case+ xs of
    | list_v_nilf() => list_v_nilf()
    | list_v_consf (y, ys) => list_v_consf(y,f(ys))

primplmnt {a} project_v (a) =
  case+ a of
    | list_v_nil() => list_v_nilf()
    | list_v_cons (b, bs) => list_v_consf(b,bs)

primplmnt MAP (F, XS) =
  case+ XS of
    | LISTF_PROP_NIL() => LISTF_PROP_NIL()
    | LISTF_PROP_CONS (Y, YS) => LISTF_PROP_CONS(Y,F(YS))

primplmnt {A} PROJECT (A) =
  case+ A of
    | LIST_PROP_NIL() => LISTF_PROP_NIL()
    | LIST_PROP_CONS (B, BS) => LISTF_PROP_CONS(B,BS)
