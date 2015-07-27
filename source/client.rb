require 'socket'

msg = "GET /index.html HTTP/1.1\nHost: www.example.com\n\n"
host = "www.example.com"
port = 80

server_connection = TCPSocket.new(host, port)
server_connection.print(msg)

while server_connection.gets != ""
  if server_connection.gets.include?"</html>"
    puts server_connection.gets
    break
  else
    puts server_connection.gets
  end
end

