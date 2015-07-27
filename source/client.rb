require 'socket'
server_connection = TCPSocket.new('10.1.10.131', 2000)

server_connection.puts("GET /index.html HTTP/1.1")
server_connection.puts("Host: 10.1.10.131")
server_connection.puts("")

until (line = server_connection.gets).nil?
  puts line
end
