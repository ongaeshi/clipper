require "clipper/util"

def lineno(src, _)
  digis = src.split(/\R/).count.to_s.length
  no = 1
  Clipper::Util.map_line(src) do |line|
    str = "#{no.to_s.rjust(digis)}: #{line}"
    no += 1
    str
  end
end
