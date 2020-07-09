let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall sha256:33e41e509b6cfd0b075d1a8a5210ddfd1919372f9d972c2da783c6187d2298ba

in    prelude.default
    ⫽ { test =
        [   prelude.bin
          ⫽ { src = "test/recursion.dats"
            , target = "${prelude.atsProject}/recursion"
            , gcBin = True
            }
        ,   prelude.bin
          ⫽ { src = "test/calc.dats"
            , target = "${prelude.atsProject}/calc"
            , gcBin = True
            }
        ]
      , compiler = [ 0, 4, 0 ]
      , version = [ 0, 3, 13 ]
      , dependencies = prelude.mapPlainDeps [ "specats", "either" ]
      }
