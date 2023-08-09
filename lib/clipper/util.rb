require "clipboard"
require "active_support/all"

module Clipper
  class Util
    def self.map_line(src)
      src.split(/\R/).map do |line|
        yield line
      end.join("\n")
    end

    def self.map_non_blank_line(src)
      src.split(/\R/).compact_blank.map do |line|
        yield line
      end.join("\n")
    end
  end
end
