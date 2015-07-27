require 'socket'

url = "GET /index.html HTTP/1.1
Host: example.com"

greeting = "GET /hi HTTP/1.1
Host: example.com"

quote = "GET /quote HTTP/1.1
Host: example.com"
# host = ""


server_connection = TCPSocket.new('www.example.com', 80)

server_connection.puts url
# server_connection.puts host
server_connection.puts

until (line = server_connection.gets).nil?
  puts line
end




