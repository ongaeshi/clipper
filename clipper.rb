require "clipper"
require "clipboard"

def main(argv)
  src = Clipboard.paste.encode("UTF-8")
  argv.each do |command|
    begin
      require "clipper/user_plugin/#{command}"
    rescue LoadError
      require "clipper/plugin/#{command}"
    end
    src = send(command.to_sym, src)
  end
  Clipboard.copy(src)
end

main(ARGV)
