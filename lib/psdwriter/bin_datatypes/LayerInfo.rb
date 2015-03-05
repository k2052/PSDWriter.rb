require  File.dirname(File.absolute_path(__FILE__)) + '/BlendingRanges'

class LayerInfo < BinData::Record
  endian :big
  int32 :top
	int32 :left
	int32 :bottom
	int32 :right
	int16 :channels_count
  array :channels, :type => :channel_info,  :read_until => lambda { 
  	self.channels_count == self.channels.length
  }

	blend_mode :blend_mode
	bit16 :extra_data_length
	mask :mask
	blending_ranges :blending_ranges
	pascal_string :name

	def read(io)
		super(io)
    
    @layer_end = io.tell + self.extra_data_length 
    
    puts "name: #{self.name}"
    puts "top: #{self.top}"
    puts "left: #{self.left}"
    puts "bottom: #{self.bottom}"
    puts "right: #{self.right}"
    puts "channels_count: #{self.channels_count}"
    puts "channels: #{self.channels.inspect}"
    puts "blend_mode: #{self.blend_mode}"
    puts "extra_data_length: #{self.extra_data_length}"

    io.seek @layer_end 
	end
end
