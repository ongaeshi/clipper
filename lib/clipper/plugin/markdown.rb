require "clipboard"
require "uri"
require "active_support/all"

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
#
# Patter4:
#  ongaeshi/clipper - GitHub https://github.com/ongaeshi/clipper 
# [ongaeshi/clipper - GitHub](https://github.com/ongaeshi/clipper)
#
# Patter5:
# https://github.com/ongaeshi/clipper
# [https://github.com/ongaeshi/clipper](https://github.com/ongaeshi/clipper)
def parse_markdown(src)
  d = src.split(" ")
  if uri?(d[0])
    url, title = d[0], d[1..].join(" ")
  elsif uri?(d[-1])
    title, url = d[0..-2].join(" "), d[-1]
  else
    return src
  end

  if title.empty?
    "[#{url}](#{url})"
  else
    "[#{title}](#{url})"
  end
end

def markdown(src, _args)
  lines = src.split(/\R/)
  text = lines.compact_blank.map do |line|
    parse_markdown(line)
  end.join("\n")
  Clipboard.copy(text)
end

