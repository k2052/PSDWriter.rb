class LayerAndMaskInfo < BinData::Record
  endian :big
  int32 :mask_size
  int32 :layer_info_size
  int16 :layers_count

  def read(io)
  	super(io)     

    self.layer_info_size = Util.pad2(self.layer_info_size)
   
    @layers = []
    self.layers_count.times do 
      @layers << LayerInfo.read(io)
    end
  end
end
