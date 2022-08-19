# Package

version       = "0.1.0"
author        = "Mateus Canelhas"
description   = "A new awesome nimble package"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["slick"]


# Dependencies

requires "nim >= 1.6.6"
requires "winim >= 3.8.1"

task buildFast, "compile ":
    exec "nimble build -d:danger -d:strip --opt:speed --panics:on --passc:-flto --passc=-march=native --gc:arc "

task buildFlexible, "allows reflectively loading":
    exec "nimble build --opt:size --passL:-Wl,--dynamicbase"