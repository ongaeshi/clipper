require "clipboard"
require "active_support/all"

module Clipper
  class Util
    def self.map_line(src)
      lines = src.split(/\R/)
      text = lines.map do |line|
        yield line
      end.join("\n")
      Clipboard.copy(text)
    end

    def self.map_non_blank_line(src)
      lines = src.split(/\R/)
      text = lines.compact_blank.map do |line|
        yield line
      end.join("\n")
      Clipboard.copy(text)
    end
  end
end