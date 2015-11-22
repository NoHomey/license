{walk} = require "walk"
{join} = require "path"
fs = require "fs"

walker = walk join __dirname, "../client"
map = {}
walker.on "file", (root, file, next) ->
  info = file.name.split "."
  if info[1] is "html" and info[0] not in ["index", "error"]
    path = join root, file.name
    map[info[0]] = fs.readFileSync path, "utf8"
  next()
walker.on "end", ->
  file = join __dirname, "template.coffee"
  fs.writeFileSync file, "map = #{JSON.stringify map}\nmodule.exports = (tmp) -> map[tmp]"
