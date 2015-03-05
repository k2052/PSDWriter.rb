# 

buffer = ByteBuffer.new()

# load

# write the signature
[result appendBytes:&signature8BPS length:4];

# write the version number
[result appendValue:1 withLength:2];

# write reserved blank space
[result appendValue:0 withLength:6];

# write number of channels
[result appendValue:layerChannelCount withLength:2];

# write height then width of the image in pixels
[result appendValue:documentSize.height withLength:4];
[result appendValue:documentSize.width withLength:4];

# write number of bits per channel
[result appendValue:8 withLength:2];

# write color mode (3 = RGB)
[result appendValue:3 withLength:2];
