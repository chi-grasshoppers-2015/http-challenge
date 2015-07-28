require 'socket'
server = TCPServer.new(2000)

loop do
  client = server.accept
  answer = client.gets.chomp
  puts "Client has connected."
  if answer == "GET /hi HTTP/1.1"
    client.puts "HI"
    client.puts "HTTP/1.1 200 OK"
    client.puts "Content-Length: 95"
    client.puts ""
    client.puts "<html>"
    client.puts "<head>"
    client.puts "\t<title>Greetings Page</title>"
    client.puts "</head>"
    client.puts "<body>"
    client.puts "Welcome to our page."
    client.puts "</body>"
    client.puts "</html>"
  elsif answer == "GET /quote HTTP/1.1"
    client.puts "HTTP/1.1 200 OK"
    client.puts "Content-Length: 107"
    client.puts ""
    client.puts "<html>"
    client.puts "<head>"
    client.puts "\t<title>Quote Page</title>"
    client.puts "</head>"
    client.puts "<body>"
    client.puts "And after all, you're my wonderwall."
    client.puts "</body>"
    client.puts "</html>"
  else
    client.puts "You've found the edge of the internet, my friend. Head back to home."
  end

  client.close

end
