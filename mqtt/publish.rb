require 'mqtt'
require_relative '../utils/credentials'

# Publish example
MQTT::Client.connect(Credentials.host,
  username: Credentials.username,
  password: Credentials.password
) do |c|
  puts 'Publishing...'

  c.publish('test_topic', 'some message!!')

  puts "Sent 'some message!!'"
end
