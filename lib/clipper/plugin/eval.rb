# clipper eval "'# ' + self"
# clipper eval "'> ' + self + ' <'"
def eval(src, args)
  lines = src.split(/\R/)
  text = lines.map do |line|
    line.instance_eval(args[0])
  end.join("\n")
  Clipboard.copy(text)
end
