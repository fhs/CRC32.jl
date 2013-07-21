
using CRC32
using Base.Test

function crcmatch(data, crc)
	crc32(convert(Vector{Uint8}, data)) == crc
end

@test crcmatch("", 0)
@test crcmatch("hello", 0x3610a686)
@test crcmatch("Julia programming language", 0xfc485364)
