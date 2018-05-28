let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { test =
    [ prelude.bin ⫽
      { src = "test/recursion.dats"
      , target = "target/recursion"
      , gcBin = True
      }
    ]
  , dependencies = prelude.mapPlainDeps [ "specats" ]
  }
