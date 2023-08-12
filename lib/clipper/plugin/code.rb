require "clipper/util"

def code(src)
  if src.match?(/\R/)
    src.split(/\R/).unshift("```").push("```").join("\n")
  else
    "`" + src + "`"
  end
end
