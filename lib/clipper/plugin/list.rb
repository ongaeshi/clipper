require "clipper/util"

def list(src)
  Clipper::Util.map_line(src) do |line|
    "- #{line}"
  end
end
