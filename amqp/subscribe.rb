require 'bunny'
require_relative '../utils/credentials'

conn = Bunny.new hostname: Credentials.host,
  automatically_recover: false,
  username: Credentials.username,
  password: Credentials.password

conn.start

ch   = conn.create_channel
q    = ch.queue 'amqp_test', durable: true

begin
  puts 'Waiting for messages. To exit press CTRL+C'
  q.subscribe(block: true) do |delivery_info, properties, body|
    puts "Received: #{body}"
  end
rescue Interrupt => _
  conn.close

  exit(0)
end
