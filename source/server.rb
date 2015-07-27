require 'socket'
server = TCPServer.new(2000)

loop do

  client = server.accept
  puts "A client has connected"
  p input = client.gets.chomp
  # p input2 = client.gets
  # p input3 = client.gets

  if input == "GET /index.html HTTP/1.1" #&& input2 == "Host: 10.1.10.131" && input3 == ""
    client.puts("HTTP/1.1 200 OK")
    client.puts("Content-Length: 130")
    client.puts("")
    client.puts("<html>")
    client.puts("<head>")
    client.puts("  <title>An Example Page</title>")
    client.puts("</head>")
    client.puts("<body>")
    client.puts("  Hello World, this is a very simple HTML document.")
    client.puts("</body>")
    client.puts("</html>")
  elsif input == "GET /hi HTTP/1.1" #&& input2 == "Host: 10.1.10.131" && input3 == ""
    content = "<html><head><title>An Example Page</title></head><body>Hi.</body></html>"
    client.puts("HTTP/1.1 200 OK")
    client.puts("Content-Length: #{content.length}")
    client.puts("")
    client.puts(content)
  elsif input == "GET /quote HTTP/1.1" #&& input2 == "Host: 10.1.10.131" && input3 == ""
    content = "<html><head><title>An Example Page</title></head><body>quote.</body></html>"
    client.puts("HTTP/1.1 200 OK")
    client.puts("Content-Length: #{content.length}")
    client.puts("")
    client.puts(content)
  else
    client.puts("HTTP/1.1 404 NOT FOUND")
  end

  client.close


end


