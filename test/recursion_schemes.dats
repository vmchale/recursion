staload "SATS/functor.sats"
staload "SATS/recursive.sats"

#include "DATS/functor.dats"
#include "share/atspre_staload.hats"
#include "$PATSHOMELOCS/specats-0.2.3/mylibies.hats"
#include "DATS/functor_option.dats"
#include "DATS/recursive_list0.dats"
#include "DATS/recursive.dats"

val option_map = let
  val x = map(lam x => x + 1u, Some(0u))
in
  case+ x of
    | Some (1u) => true
    | _ => false
end
val option_replace = let
  val x = replace(1u, Some(0u))
in
  case+ x of
    | Some (1u) => true
    | _ => false
end
val folded: int = let
  fun f(i : list0f(int, int)) : int =
    case+ i of
      | list0_consf (x, xs) => x + xs
      | list0_nilf() => 0
  
  val list = list0_cons(2, list0_cons(1, list0_nil()))
in
  cata(lam x0 =<cloref1> f(x0), list)
end
val folded_check = eq_g0int_int(folded, 3)

implement main0 () =
  {
    var n0 = @{ fst = "map", snd = option_map }
    var n1 = @{ fst = "replace", snd = option_replace }
    var n2 = @{ fst = "folded", snd = folded_check }
    var xs = n2 :: n1 :: n0 :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "Functor", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }
