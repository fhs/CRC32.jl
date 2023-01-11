## Overview

See http://en.wikipedia.org/wiki/Cyclic_redundancy_check for more information.

**This package is deprecated.** Please use the CRC32 implementation in any of the following libraries:
- [CRC32.jl](https://github.com/JuliaIO/CRC32.jl) -- interface to the optimized CRC-32 implementation in Zlib
- [CRC.jl](https://github.com/andrewcooke/CRC.jl) -- written in pure Julia, supports many CRC variants
- [CRC32c standard library](https://docs.julialang.org/en/v1/stdlib/CRC32c/) -- highly optimized implementation of the closely related CRC-32c checksum

That being said, this package demonstrates a minimal, simple
implementation of CRC32 in pure Julia code, which may be of
educational interest.

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
