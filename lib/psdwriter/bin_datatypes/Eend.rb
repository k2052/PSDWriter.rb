class Eend < BinData::BasePrimitive
  mandatory_parameter :len
  private

  def value_to_binary_string(val)
    ""
  end

  def read_and_return_value(io)
    puts get_parameter(:len)
    io.send(:raw_io).pos + get_parameter(:len)
  end

  def sensible_default
    0
  end
end
