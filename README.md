# recursion

[![Build Status](https://travis-ci.org/vmchale/recursion.svg?branch=master)](https://travis-ci.org/vmchale/recusion)

## Example

Sum a list of integers using a catamorphism:

```ats
staload "SATS/recursive.sats"

#include "DATS/recursive.dats"
#include "DATS/recursive_list0.dats"

fun sum(is : list0(int)) : int =
  let
    fn go(i : list0f(int, int)) : int =
      case+ i of
        | list0_consf (x, xs) => x + xs
        | list0_nilf() => 0
  in
    cata(lam x0 =<cloref1> go(x0), is)
  end
```
