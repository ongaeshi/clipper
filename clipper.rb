require "clipper"
require "clipboard"
require "uri"

def uri?(src)
  URI::DEFAULT_PARSER.make_regexp.match(src)
end

# Patter1:
# https://github.com/ongaeshi/clipper ongaeshi/clipper
# [ongaeshi/clipper](https://github.com/ongaeshi/clipper)
#
# Patter2:
# https://github.com/ongaeshi/clipper ongaeshi/clipper - GitHub
# [ongaeshi/clipper - GitHub](https://github.com/ongaeshi/clipper)
#
# Patter3:
# ongaeshi/clipper - GitHub https://github.com/ongaeshi/clipper
# [ongaeshi/clipper - GitHub](https://github.com/ongaeshi/clipper)
def parse_markdown(src)
  d = src.split(" ")
  if uri?(d[0]) 
    url, title = d[0], d[1..].join(" ")
  else
    title, url = d[0..-2].join(" "), d[-1]
  end
  url.strip!
  title.strip!
  "[#{title}](#{url})"
end

def markdown(src)
  lines = src.split("\n")
  text = lines.map do |line|
    parse_markdown(line)
  end.join("\n")
  Clipboard.copy(text)
end

def eval(src)
  p "eval #{src}"
end

def main(argv)
  command = argv[0]
  src = Clipboard.paste.encode("UTF-8")
  send(command.to_sym, src)
end

main(ARGV)
