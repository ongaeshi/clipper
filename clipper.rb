require "clipper"
require "clipboard"

def main(argv)
  argv.each do |command|
    src = Clipboard.paste.encode("UTF-8")
    require "clipper/plugin/#{command}"
    send(command.to_sym, src)
  end
end

main(ARGV)
