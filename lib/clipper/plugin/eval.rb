# clipper eval "\"# \" + self.chomp"
# clipper eval "\"HEADER \" + self.chomp + \" FOOTER\""
def eval(src, args)
  lines = src.split("\n")
  text = lines.map do |line|
    line.instance_eval(args[0])
  end.join("\n")
  Clipboard.copy(text)
end
