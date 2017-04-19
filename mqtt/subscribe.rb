require 'mqtt'
require_relative '../utils/credentials'

# Subscribe example
MQTT::Client.connect(Credentials.host,
  username: Credentials.username,
  password: Credentials.password
) do |c|
  puts 'Waiting for messages. To exit press CTRL+C'
  c.get('test_topic') do |topic, message|
    puts "#{topic}: #{message}"
  end
end
