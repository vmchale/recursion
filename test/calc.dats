staload "SATS/recursive.sats"

#include "share/atspre_staload.hats"
#include "$PATSHOMELOCS/specats-0.4.0/mylibies.hats"
#include "DATS/recursive.dats"

datatype expression =
  | add of (expression, expression)
  | subtract of (expression, expression)
  | multiply of (expression, expression)
  | divide of (expression, expression)
  | value of int

datatype expression_f(a: t@ype+) =
  | add_f of (a, a)
  | subtract_f of (a, a)
  | multiply_f of (a, a)
  | divide_f of (a, a)
  | value_f of int

local
  absimpl recursive_functor_type(a) = expression
  absimpl base_functor_type(a, x) = expression_f(x)
in
  implement {a} project (x) =
    case+ x of
      | add (e0, e1) => add_f(e0, e1)
      | subtract (e0, e1) => subtract_f(e0, e1)
      | multiply (e0, e1) => multiply_f(e0, e1)
      | divide (e0, e1) => divide_f(e0, e1)
      | value (i) => value_f(i)
  
  implement {a}{x0}{x1} map (f, x) =
    case+ x of
      | add_f (e0, e1) => add_f(f(e0), f(e1))
      | subtract_f (e0, e1) => subtract_f(f(e0), f(e1))
      | multiply_f (e0, e1) => multiply_f(f(e0), f(e1))
      | divide_f (e0, e1) => divide_f(f(e0), f(e1))
      | value_f (i) => value_f(i)
  
  fun calculate(x : expression) : int =
    let
      fn go(e : expression_f(int)) : int =
        case+ e of
          | add_f (e0, e1) => e0 + e1
          | subtract_f (e0, e1) => e0 - e1
          | multiply_f (e0, e1) => e0 * e1
          | divide_f (e0, e1) => e0 / e1
          | value_f (i) => i
    in
      cata(lam x0 =<cloref1> go(x0), x)
    end
  
  implement main0 () =
    {
      val expr = add(value(2), multiply(value(3), value(5)))
      val i = calculate(expr)
      var folded_check = eq_g0int_int(i, 17)
      var n0 = @{ test_name = "arithmetic", test_result = folded_check }
      var xs = n0 :: nil
      var total = list_vt_length(xs)
      val g = @{ group = "Catamorphisms", leaves = xs } : test_tree
      val _ = iterate_list(g, 0, total)
    }
end
