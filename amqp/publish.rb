require 'bunny'
require_relative '../utils/credentials'

queue = ARGV[0] || 'test_queue'

conn = Bunny.new hostname: Credentials.host,
  username: Credentials.username,
  password: Credentials.password

conn.start

ch = conn.create_channel
q = ch.queue queue, durable: true

puts 'Publishing...'

# Fake measure
message = rand(50)

ch.default_exchange.publish(message, routing_key: q.name)

puts "Sent #{message} to #{queue}"

conn.close
