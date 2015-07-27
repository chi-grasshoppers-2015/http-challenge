require 'socket'

server = TCPServer.new(2000)

loop do

  client = server.accept

  puts "Client connected"
  request = client.gets
  puts "Received #{request}"

  response = "HTTP/1.1 200 OK\nContent-Length: 127\n\n<html>\n<head>\n<title>An Example Page</title>\n</head>\n<body>\n  Hello World, this is a very simple HTML document.\n</body>\n</html>"

  puts "Sending #{response}"

  client.puts response

  client.close

end
