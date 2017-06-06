require 'bunny'
require_relative '../utils/credentials'

user_id = ARGV[0] || 1703051
routing_key = "bots.#{user_id}.#"

conn = Bunny.new hostname: Credentials.host,
  automatically_recover: false,
  username: Credentials.username,
  password: Credentials.password

conn.start

channel = conn.create_channel

# We need to bound our queue to the MQTT exchange
exchange = channel.topic 'vaquita.mqtt', durable: true

# Server named queue, bound to MQTT exchange so we can filter by routing_key
# messages from a specific MQTT topic
q = channel.queue('', durable: false, auto_delete: true).bind exchange, routing_key: routing_key

begin
  puts "Waiting for messages on #{routing_key}. To exit press CTRL+C"

  q.subscribe(block: true) do |delivery_info, properties, body|
    puts "#{delivery_info[:routing_key]}: #{body}"
  end
rescue Interrupt => _
  conn.close

  exit(0)
end
