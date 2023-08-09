require "clipper/util"

def ref(src)
  Clipper::Util.map_line(src) do |line|
    "> #{line}"
  end
end
