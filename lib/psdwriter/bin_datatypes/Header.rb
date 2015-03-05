class Header < BinData::Record
  endian :big
	string :name, :length => 4
	bit16 :version
	string :reservered, :length => 6
	bit16 :channels
  bit32 :height
  bit32 :width
  bit16 :depth
  bit16 :color_mode
end
