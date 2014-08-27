nodeStatic = require 'node-static'

fileServer = new nodeStatic.Server('./public')

port =  process.env.PORT or 8080

require('http').createServer((request, response) ->
  request.addListener('end', () ->
    fileServer.serve request, response, (err, result) ->
      if err and err.status is 404
        fileServer.serveFile '/404.html', 404, {}, request, response

  ).resume()
).listen(port)
