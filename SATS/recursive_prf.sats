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

prfn MAP {A:prop}{B:prop}{C:prop} (F : B -<prf> C, X : BASE_FUNCTOR_PROP(A, B)) : BASE_FUNCTOR_PROP(A, C)

prfn map_v {a:view}{b:view}{c:view} (f : b -<prf> c, x : base_functor_v(a, b)) : base_functor_v(a, c)

propdef ALGEBRA (A : prop, B : prop) = BASE_FUNCTOR_PROP(A, B) -<prf> B

viewdef algebra_v(a: view, b: view) = base_functor_v(a, b) -<prf> b

prfn {A:prop} PROJECT {n:nat} (FUNCTOR_PROP(A,n)) : BASE_FUNCTOR_PROP(A, FUNCTOR_PROP(A,n-1))

prval {A:prop}{B:prop} STOP : BASE_FUNCTOR_PROP(A, B)

prfn {a:view}{b:view} stop_v () : base_functor_v(a, b)

prfn {a:view} project_v {n:nat} (functor_v(a,n)) : base_functor_v(a, functor_v(a,n-1))

prfn {a:view} gfree_v (a) : void
