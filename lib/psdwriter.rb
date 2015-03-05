require 'bindata'

dir_root = File.dirname(File.absolute_path(__FILE__)) + '/psdwriter'
[
  '/bin_datatypes/*'
].each do |path|
  Dir.glob(dir_root + path) { |file| 
  	require file if File.file?(file) 
  }
end

module Util
  extend self
  
  def pad2(i)
    (i + 1) & ~0x01
  end

  # Ensures value is a multiple of 4
  def pad4(i)
    ((i + 4) & ~0x03) - 1
  end

  def clamp(num, min, max)
    return max if num > max
    return min if num < min
    num
  end
end


class PSDReader
  def initialize(file, opts={})
    @file = File.new(file, 'rb')
    @file.seek 0 # If the file was previously used and not closed
  end

	def parse!
		@header = ::Header.read(@file)
		puts "Header:       
		                     name: #{@header.name}
		                  version: #{@header.version}
		                 channels: #{@header.channels}
		                   height: #{@header.height}
		                    width: #{@header.width}
		                    depth: #{@header.depth}
		               color_mode: #{@header.color_mode}"

		puts "
	  ======================================"
	  @color_mode = ::ColorMode.read(@file)
    puts "Color Mode:
	   									   length: #{@color_mode.len}"

    puts "
    ======================================"
    @image_resources = ::ImageResources.read(@file)
    puts "ImageResources:
    							         length: #{@image_resources.len}"

		puts "
		======================================"
    @layer_and_mask_info = ::LayerAndMaskInfo.read(@file)
    puts "LayerAndMaskInfo:
                           count: #{@layer_and_mask_info.layers_count}"
	end
end