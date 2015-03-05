require  File.dirname(File.absolute_path(__FILE__)) + '/PascalString'

PARSEABLE_RESOURCES = {}
class ImageResourceBlock < BinData::Record
  endian :big
  string :signature, :length => 4
  bit16  :id
  pascal_string :name
  bit32  :len

  def read(io)
  	super(io)
    
    self.len = Util.pad2(self.len)
		if PARSEABLE_RESOURCES.include?(self.id)
  		@block = Object.const_get(PARSEABLE_RESOURCES[self.id]).read(io)
  	else
  		io.seek io.tell + self.len
  	end
  end
end
