staload "SATS/recursive.sats"

#include "share/atspre_staload.hats"
#include "$PATSHOMELOCS/specats-0.4.0/mylibies.hats"
#include "DATS/recursive.dats"
#include "DATS/recursive_list.dats"

fun sum(x : int) : int =
  0

implement main0 () =
  {
    var expected = 55
    var actual = sum(10)
    var b0 = expected = actual
    var n0 = @{ test_name = "hylo", test_result = b0 }
    var xs = n0 :: nil
    var total = list_vt_length(xs)
    val g = @{ group = "Recursion schemes", leaves = xs } : test_tree
    val _ = iterate_list(g, 0, total)
  }
