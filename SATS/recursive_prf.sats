// Functorial proofs in ATS
absprop FUNCTOR_PROP (A : prop, n : int)

absprop BASE_FUNCTOR_PROP (A : prop, B : prop)

absview functor_v(a: view, n: int)

absview base_functor_v(a: view, b: view)

prfn MAP {A:prop}{B:prop}{C:prop} (F : B -<prf> C, X : BASE_FUNCTOR_PROP(A, B)) : BASE_FUNCTOR_PROP(A, C)

prfn map_v {a:view}{b:view}{c:view} (f : b -<prf> c, x : base_functor_v(a, b)) : base_functor_v(a, c)

propdef ALGEBRA (A : prop, B : prop) = BASE_FUNCTOR_PROP(A, B) -<prf> B

viewdef algebra_v(a: view, b: view) = base_functor_v(a, b) -<prf> b

prfn {A:prop} PROJECT {n:nat} (FUNCTOR_PROP(A,n)) : BASE_FUNCTOR_PROP(A, FUNCTOR_PROP(A,n-1))

prval {A:prop}{B:prop} STOP : BASE_FUNCTOR_PROP(A, B)

prfn {a:view}{b:view} stop_v () : base_functor_v(a, b)

prfn {a:view} project_v {n:nat} (functor_v(a,n)) : base_functor_v(a, functor_v(a,n-1))

prfn {a:view} gfree_v (a) : void
