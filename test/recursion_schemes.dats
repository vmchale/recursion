staload "SATS/functor.sats"
staload "SATS/recursive.sats"

#include "DATS/functor.dats"
#include "share/atspre_staload.hats"
#include "$PATSHOMELOCS/specats-0.2.3/mylibies.hats"
#include "DATS/functor_option.dats"

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

implement main0 () =
  {
    var n0 = @{ fst = "map", snd = option_map }
    var n1 = @{ fst = "replace", snd = option_replace }
    var xs = n1 :: n0 :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "Functor", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }
