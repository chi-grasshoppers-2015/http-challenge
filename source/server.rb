require 'socket'

server = TCPServer.new(2000)
# greetingserv = TCPServer.new(2000/hi)
# quoteserv = TCPServer.new(2000/quote)



loop do
  client = server.accept
  path = client.gets.chomp
  p path

  if path == "GET / HTTP/1.1"
    puts "client has connected"
    client.puts "HTTP/1.1 200 OK"
    client.puts "Content-Length: 130"
    client.puts

    client.puts "<html>"
    client.puts "<head>"
    client.puts "  <title>An Example Page</title>"
    client.puts "</head>"
    client.puts "<body>"
    client.puts "  Hello World, this is a very simple HTML document."
    client.puts "</body>"
    client.puts "</html>"

  elsif path == "GET /hi HTTP/1.1"
    puts "client has connected"
    client.puts "HTTP/1.1 200 OK"
    client.puts
    client.puts "<html>"
    client.puts "<head>"
    client.puts "  <title>An Example Page</title>"
    client.puts "</head>"
    client.puts "<body>"
    client.puts "  Welcome to the party pallllll!!"
    client.puts "</body>"
    client.puts "</html>"
  elsif path == "GET /quote HTTP/1.1"
    puts "client has connected"
    client.puts "HTTP/1.1 200 OK"
    client.puts
    client.puts "<html>"
    client.puts "<head>"
    client.puts "  <title>An Example Page</title>"
    client.puts "</head>"
    client.puts "<body>"
    client.puts "  To air is human"
    client.puts "</body>"
    client.puts "</html>"
  end

  client.close
end
