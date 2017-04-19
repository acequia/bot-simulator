require 'bunny'
require_relative '../utils/credentials'

conn = Bunny.new hostname: Credentials.host,
  username: Credentials.username,
  password: Credentials.password

conn.start

ch = conn.create_channel
q = ch.queue 'amqp_test', durable: true

puts 'Publishing...'

ch.default_exchange.publish('some message!!', routing_key: q.name)

puts "Sent 'some message!!'"

conn.close
