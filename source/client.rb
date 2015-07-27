require 'socket'





server_connection = TCPSocket.new('http://127.0.0.1', 2000)

server_connection.puts("GET :2000 HTTP/1.1")
server_connection.puts("Host: 127.0.0.1")
server_connection.puts("")

# arr = []

while true  do
  puts server_connection.gets
  break if server_connection.gets == nil
end





