let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in λ(x : List Natural) →
  prelude.makePkg { x = x
                  , name = "recursion_schemes"
                  , githubUsername = "vmchale"
                  , description = [ "A simple-minded package for recursion schemes in ATS" ]
                    : Optional Text
                  }
