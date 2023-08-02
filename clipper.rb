require "clipper"
require "clipboard"

def markdown(src)
  lines = src.split("\n")
  text = lines.map do |line|
    url, title = line.split(" ")
    url.strip!
    title.strip!
    "[#{title}](#{url})"
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
