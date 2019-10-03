// Functorial proofs in ATS
absprop FUNCTOR_PROP (A : prop, n : int)

absprop BASE_FUNCTOR_PROP (A : prop, B : prop)

absview functor_v(a: view, n: int)

absview base_functor_v(a: view, b: view)

dataprop LIST_PROP(A: prop, int) =
  | LIST_PROP_NIL(A, 0) of ()
  | { n : nat | n > 0 } LIST_PROP_CONS(A, n) of (A, LIST_PROP(A, n - 1))

dataprop LISTF_PROP(A: prop, B: prop) =
  | LISTF_PROP_NIL(A, B)
  | LISTF_PROP_CONS(A, B) of (A, B)

dataview list_v(a: view, int) =
  | list_v_nil(a, 0) of ()
  | { n : nat | n > 0 } list_v_cons(a, n) of (a, list_v(a, n-1))

dataview list_vf(a: view, b: view) =
  | list_v_nilf(a, b)
  | list_v_consf(a, b) of (a, b)

extern
prfn MAP {A:prop}{B:prop}{C:prop} (F : B -<prf> C, X : BASE_FUNCTOR_PROP(A, B)) : BASE_FUNCTOR_PROP(A, C)

extern
prfn map_v {a:view}{b:view}{c:view} (f : b -<prf> c, x : base_functor_v(a, b)) : base_functor_v(a, c)

propdef ALGEBRA (A : prop, B : prop) = BASE_FUNCTOR_PROP(A, B) -<prf> B

viewdef algebra_v(a: view, b: view) = base_functor_v(a, b) -<prf> b

extern
prfn {A:prop} PROJECT {n:nat} (FUNCTOR_PROP(A,n)) : BASE_FUNCTOR_PROP(A, FUNCTOR_PROP(A,n-1))

extern
prval {A:prop}{B:prop} STOP : BASE_FUNCTOR_PROP(A, B)

extern
prfn {a:view}{b:view} stop_v () : base_functor_v(a, b)

extern
prfn {a:view} project_v {n:nat} (functor_v(a,n)) : base_functor_v(a, functor_v(a,n-1))

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

extern
prfn {a:view} gfree_v (a) : void

prfun {a:view}{b:view} cata_v {n:nat} .<n>. (f : algebra_v(a, b), a : functor_v(a, n)) : b =
  sif n == 0 then
    let
      prval () = gfree_v<functor_v(a, n)>(a)
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
