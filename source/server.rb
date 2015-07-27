require 'socket'

server = TCPServer.new(2000)

loop do

  client = server.accept

  puts "Client connected"
  request = client.gets.chomp
  puts "Received #{request}"

  base_content_length = 78
  if request == "GET /hi HTTP/1.1"
    message = "Welcome to my tiny web page."
  elsif request == "GET /quote HTTP/1.1"
    message = "Do or do not, there is not try."
  else
    puts "Bad request REJECTED!"
    client.puts "HTTP/1.1 404 Not Found\nContent-Length: 95\n\n<html>\n<head>\n<title>404 Not Found</title>\n</head>\n<body>\nBad request REJECTED!\n</body>\n</html>"
    client.close
    next
  end

  response = "HTTP/1.1 200 OK\nContent-Length: #{base_content_length + message.length}\n\n<html>\n<head>\n<title>An Example Page</title>\n</head>\n<body>\n  #{message}\n</body>\n</html>"

  puts "Sending #{response}"

  client.puts response

  client.close

end
