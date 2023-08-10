require "clipper/util"
require "launchy"
require "uri"

def open(src)
  Clipper::Util.map_line(src) do |line|
    Launchy.open(URI.extract(line).first)
  end
  src
end
