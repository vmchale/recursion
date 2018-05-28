staload "SATS/functor.sats"
staload "SATS/recursive.sats"

#include "share/atspre_staload.hats"
#include "$PATSHOMELOCS/specats-0.2.3/mylibies.hats"
#include "DATS/recursive.dats"
#include "DATS/recursive_list0.dats"

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
    var n0 = @{ fst = "folded", snd = folded_check }
    var xs = n0 :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "Functor", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }
