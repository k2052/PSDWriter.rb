class ImageResources < BinData::Record
  endian :big
  bit32 :len

  def read(io)
  	super(io)

    resources_block_end = self.len + io.pos

  	# @image_resources = []
		# while io.pos < resources_block_end
		# 	@image_resources << ImageResourceBlock.read(io)
		# end

    io.seek resources_block_end if io.tell != resources_block_end
  end
end
