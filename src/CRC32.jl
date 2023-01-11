module CRC32

export crc32

function maketable(poly::UInt32)
	tab = zeros(UInt32, 256)
	for i in 0:255
		crc = UInt32(i)
		for _ in 1:8
			if (crc & 1) == 1
				crc = (crc >> 1) ⊻ poly
			else
				crc >>= 1
			end
		end
		tab[i+1] = crc
	end
	tab
end

const table = maketable(0xedb88320)

function crc32(data::AbstractVector{UInt8}, crc::UInt32=UInt32(0))
	crc = ~crc
	@inbounds for b in data
		crc = table[(((crc&0xff) % UInt8) ⊻ b) + 1] ⊻ (crc >> 8)
	end
	~crc
end

crc32(data, crc::Integer) = crc32(data, UInt32(crc))

crc32(data::AbstractString, crc::Integer=0) = crc32(codeunits(data), crc)

end # module
