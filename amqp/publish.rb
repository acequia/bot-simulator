require 'bunny'
require_relative '../utils/credentials'

user_id = ARGV[0] || 1703051
routing_key = "bots.#{user_id}"

conn = Bunny.new hostname: Credentials.host,
  username: Credentials.username,
  password: Credentials.password

conn.start

channel = conn.create_channel

# We need to bound our queue to the MQTT exchange
exchange = channel.topic 'vaquita.mqtt', durable: true

q = channel.queue('', durable: false, auto_delete: true).bind exchange, routing_key: routing_key

puts 'Publishing...'

message = "temperature to #{rand(50)}"

exchange.publish(message, routing_key: routing_key)

puts "Sent control message: '#{message}' to #{routing_key}"

conn.close
