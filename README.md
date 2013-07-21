CRC32.jl: 32-bit cyclic redundancy check (CRC-32) checksum implementation for Julia
===================================================================================

See http://en.wikipedia.org/wiki/Cyclic_redundancy_check for more information.

Usage
-----

```julia
julia> using CRC32

julia> crc = crc32("hello")
0x3610a686

julia> crc32(", world", crc)
0xffab723a

julia> crc32("hello, world")
0xffab723a
```
