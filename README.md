## Overview

See http://en.wikipedia.org/wiki/Cyclic_redundancy_check for more information.

[![Build Status](https://travis-ci.org/fhs/CRC32.jl.png)](https://travis-ci.org/fhs/CRC32.jl)

## Installation

Install via the Julia package manager, `Pkg.add("CRC32")`.

## Usage

```julia
julia> using CRC32

julia> crc = crc32("hello")
0x3610a686

julia> crc32(", world", crc)
0xffab723a

julia> crc32("hello, world")
0xffab723a
```
