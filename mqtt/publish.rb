require 'mqtt'
require_relative '../utils/credentials'

topic = ARGV[0] || 'test_topic'

# Publish example
MQTT::Client.connect(Credentials.host,
  username: Credentials.username,
  password: Credentials.password
) do |c|
  puts 'Publishing...'

  # Fake measure
  message = rand(50)

  c.publish(topic, message)

  puts "Sent #{message} to #{topic}"
end
