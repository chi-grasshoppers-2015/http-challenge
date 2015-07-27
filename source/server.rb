require 'socket'
server = TCPServer.new(2000)

loop do
  client = server.accept

  page = client.gets

  if page.include?('hi')
    client.puts "Welcome to our page!"
  elsif page.include?('quote')
    client.puts "Jesus Christ & General Jackson"
  end

  client.close

end
