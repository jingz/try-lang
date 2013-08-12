require 'em-websocket'

EM.run {
  EM::WebSocket.run(:host => "localhost", :port => 8000) do |ws|
    puts "server started"
    i = 1
    ws.onopen { |handshake|
      puts "WebSocket connection open"
      # Access properties on the EM::WebSocket::Handshake object,
      # e.g. path, query_string, origin, headers
      # Publish message to the client
      ws.send "Hello Client, you connected to #{handshake.path}"
    }

    ws.onclose { puts "Connection closed" }

    ws.onmessage { |msg|
      puts "Recieved message: #{msg} #{i}"
      i += 1
      ws.send((100*rand).round(0).to_s) if msg == "ok"
      sleep 0.1
    }
  end
}
