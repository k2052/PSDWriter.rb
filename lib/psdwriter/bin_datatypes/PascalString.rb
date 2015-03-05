class PascalString < BinData::Primitive
  bit8   :len,  :value => lambda { data.length }
  string :data, :read_length => lambda {
  	Util.pad2(len + 1) - 1
  }

  def read(io)
  	super(io)
  end

  def get
    self.data
  end

  def set(v)
    self.data = v
  end
end
