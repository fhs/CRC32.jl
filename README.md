[![Build Status](https://travis-ci.org/fhs/CRC32.jl.png)](https://travis-ci.org/fhs/CRC32.jl)

## Overview

See http://en.wikipedia.org/wiki/Cyclic_redundancy_check for more information.

**If you're looking for a fast CRC32 function and don't mind depending on libz,
you should use the crc32 function in [Zlib package](https://github.com/dcjones/Zlib.jl).
Current benchmark shows Zlib crc32 is about 26
times faster than crc32 in this package.**


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
