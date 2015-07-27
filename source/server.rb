require 'socket'


server = TCPServer.new(2000)

loop do

  client = server.accept

  request = client.gets
  resource = request.split(" ")[1]

  if resource == "/hi"
    title = "Greetings"
    msg =  "Yar Matey!"
  elsif resource == "/quote"
    title = "Quotes"
    msg = "Cowards die many times before their death, the valiant never taste of death but once."
  else
    title = "An Example Page"
    msg = "Hello World, this is a very simple HTML document."
  end

  html_rendering = "<html><head><title>#{title}</title></head><body>#{msg}</body></html>"


  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Length: #{html_rendering.length}"
  client.puts ""
  client.puts html_rendering


  client.close


end
