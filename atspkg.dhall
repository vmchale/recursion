let prelude = http://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { test =
    [ prelude.bin ⫽
      { src = "test/recursion.dats"
      , target = "${prelude.atsProject}/recursion"
      , gcBin = True
      }
    , prelude.bin ⫽
      { src = "test/calc.dats"
      , target = "${prelude.atsProject}/calc"
      , gcBin = True
      }
    ]
  , dependencies = prelude.mapPlainDeps [ "specats" ]
  }
