require "clipper"
require "clipboard"

def main(argv)
  command, args = argv[0], argv[1..]
  src = Clipboard.paste.encode("UTF-8")
  require "clipper/plugin/#{command}"
  send(command.to_sym, src, args)
end

main(ARGV)
