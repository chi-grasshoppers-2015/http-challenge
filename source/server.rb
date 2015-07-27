require 'socket'

server = TCPServer.new(2000)

loop do

client = server.accept

# client.status

# clients.puts("GET :2000 HTTP/1.1 200 OK")
# clients.puts("HOST: 127.0.0.1)

status = "/quote HTTP/1.1 200 OK"
content =
"<html>
    <head>
      <title>An Example Page</title>
    </head>
  <body>
      Hello word! CHeck out my numbers!
      Here is a random number: #{rand(5)*rand(5)}
  </body>
</html>"

client.puts(status)
client.puts("Content-Length: #{content.length}")

client.puts

client.puts(content)




client.close




end
