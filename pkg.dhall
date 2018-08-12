let prelude = http://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in λ(x : List Natural) →
  prelude.makePkg { x = x, name = "recursion", githubUsername = "vmchale" }
    ⫽ { description = [ "A simple-minded package for recursion schemes in ATS" ] : Optional Text }
