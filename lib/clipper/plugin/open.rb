require "clipper/util"
require "launchy"

def open(src)
  Clipper::Util.map_line(src) do |line|
    Launchy.open(line)
  end
  src
end
