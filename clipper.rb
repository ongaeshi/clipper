require "clipper"
require "clipboard"

def markdown(src)
  p "markdown #{src}"
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
