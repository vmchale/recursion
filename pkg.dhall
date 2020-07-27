let prelude =
      https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in  λ(x : List Natural) →
        prelude.makePkg { x, name = "recursion", githubUsername = "vmchale" }
      ⫽ { description = Some "A package for recursion schemes in ATS" }
