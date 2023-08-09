require "clipper"
require "clipboard"

def main(argv)
  src = Clipboard.paste.encode("UTF-8")
  argv.each do |command|
    require "clipper/plugin/#{command}"
    src = send(command.to_sym, src)
  end
  Clipboard.copy(src)
end

main(ARGV)
