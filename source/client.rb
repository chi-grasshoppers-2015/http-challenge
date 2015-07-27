require 'socket'

server_connection = TCPSocket.new('www.example.com', 80)

server_connection.puts("GET / HTTP/1.1\nHost: www.example.com\n\n")

response_line = server_connection.gets
until response_line == nil
  puts response_line
  response_line = server_connection.gets
end
