let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in  λ(x : List Natural) →
        prelude.makePkg { x, name = "recursion", githubUsername = "vmchale" }
      ⫽ { description = Some "A package for recursion schemes in ATS" }
