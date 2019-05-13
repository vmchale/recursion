let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

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
  , dependencies = prelude.mapPlainDeps [ "specats", "either" ]
  }
