require  File.dirname(File.absolute_path(__FILE__)) + '/Eend'

class Mask < BinData::Record
  endian :big
  int32 :len
	eend :mask_end, :len => lambda { len }
	skip :length => :mask_end
  # int32 :top
	# int32 :left
	# int32 :bottom
	# int32 :right
	# bit8 :default_color
	# bit8 :flags
end
