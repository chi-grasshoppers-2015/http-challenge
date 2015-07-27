require 'socket'


server_connection = TCPSocket.new('www.example.com', 80)


server_connection.puts "GET /index.html HTTP/1.1"
server_connection.puts "Host: example.com"
server_connection.puts ""

until server_connection.gets == nil
  puts server_connection.gets
end






