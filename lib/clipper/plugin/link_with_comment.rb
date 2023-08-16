require "clipper/plugin/markdown"

# https://github.com/ongaeshi/clipper/issues/1 #1
# link_with_comment プラグインの作成
def link_with_comment(src)
  index = 0
  Clipper::Util.map_line(src) do |line|
    index += 1
    if index % 2 == 1
      "- " + parse_markdown(line)
    else
      line
    end
  end
end
