require "clipper/util"

# clipper eval "'# ' + self"
# clipper eval "'> ' + self + ' <'"
def eval(src, args)
  Clipper::Util.map_line(src) do |line|
    line.instance_eval(args[0])
  end
end
