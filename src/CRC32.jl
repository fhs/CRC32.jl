module CRC32

export crc32

using Compat

function maketable(poly::UInt32)
	tab = zeros(UInt32, 256)
	for i in 0:255
		crc = @compat UInt32(i)
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

function crc32(data::Vector{UInt8}, crc::UInt32=@compat(UInt32(0)))
	for b in data
		crc = table[(@compat UInt8(crc&0xff) $ b) + 1] $ (crc >> 8)
	end
	~crc
end
crc32(data, crc::Integer) = crc32(data, @compat UInt32(crc))

crc32(data::String, crc::Integer=0) = crc32(convert(Vector{UInt8}, data), crc)

end # module
