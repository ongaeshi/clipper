require "clipper"
require "clipboard"

def eval(src, args)
  lines = src.split("\n")
  text = lines.map do |line|
    line.instance_eval(args[0])
  end.join("\n")
  Clipboard.copy(text)
end

def main(argv)
  command, args = argv[0], argv[1..]
  src = Clipboard.paste.encode("UTF-8")
  require "clipper/plugin/#{command}"
  send(command.to_sym, src, args)
end

main(ARGV)
