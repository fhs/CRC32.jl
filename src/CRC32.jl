module CRC32

export crc32

function maketable(poly::Uint32)
	tab = zeros(Uint32, 256)
	for i in 0:255
		crc = uint32(i)
		for _ in 1:8
			if (crc&1) == 1
				crc = (crc >> 1) $ poly
			else
				crc >>= 1
			end
		end
		tab[i+1] = crc
	end
	tab
end

const table = maketable(0xedb88320)

function crc32(data::Vector{Uint8}, crc::Integer=0)
	crc = ~uint32(crc)
	for b in data
		crc = table[(uint8(crc) $ b) + 1] $ (crc >> 8)
	end
	~crc
end

crc32(data::String, crc::Integer=0) = crc32(convert(Vector{Uint8}, data), crc)

end # module
