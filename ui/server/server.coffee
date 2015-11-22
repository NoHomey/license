{join} = require "path"
express = require "express"
bodyParser = require "body-parser"
serveApp = require "./serveApp"
port = process.env.PORT ? 3000
app = express()
app.use bodyParser.json()
p = join __dirname, "../client"
console.log p
app.use serveApp p
app.listen port, -> console.log "Server started at port : #{port}"
