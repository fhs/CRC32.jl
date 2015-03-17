
using CRC32
using Base.Test

@test crc32("") == 0
@test crc32("hello") == 0x3610a686
@test crc32("Julia programming language") == 0xfc485364

crc = crc32("programming")
@test crc == 0x41f292cf
@test crc32("programming language") == 0xe83fb5fd
@test crc32(" language", crc) == 0xe83fb5fd
