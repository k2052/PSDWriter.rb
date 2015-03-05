class ChannelInfo < BinData::Record
  endian :big
  int16 :id
  bit32 :len
end
