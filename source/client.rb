require 'socket'

Socket.tcp("www.example.com", 80) do |socket|
  socket.print "GET / HTTP/1.1\r\nHost: www.example.com\r\n\r\n"
  socket.close_write
  puts socket.read
end
