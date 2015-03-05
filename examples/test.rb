require './lib/psdwriter'

psd = nil
file = ARGV[0] || 'examples/images/example.psd'
psd = PSDReader.new(file)
psd.parse!
