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

absimpl FUNCTOR_PROP(A, n) = LIST_PROP(A, n)
absimpl BASE_FUNCTOR_PROP(A, B) = LISTF_PROP(A, B)

primplmnt {a}{b} STOP =
  LISTF_PROP_NIL

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
