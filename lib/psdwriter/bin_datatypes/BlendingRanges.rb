require  File.dirname(File.absolute_path(__FILE__)) + '/Eend'

class BlendingRanges < BinData::Record
  endian :big
  int32 :len
	eend :blending_end, :len => lambda { len }
	skip :length => :blending_end
end
