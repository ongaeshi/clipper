require "clipper/util"

def unindent(src, _)
  space = src.split(/\R/).compact_blank.map do |line|
    line.length - line.lstrip.length
  end.min

  Clipper::Util.map_line(src) do |line|
    line.gsub(/^#{'\s' * space}/, "")
  end
end
