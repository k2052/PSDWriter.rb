class ColorMode < BinData::Record
  endian :big
  bit32 :len
  skip :data, :length => :len
end
