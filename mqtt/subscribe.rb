require 'mqtt'
require_relative '../utils/credentials'

user_id = ARGV[0] || 1703051
topic = "bots/#{user_id}/#"

# Subscribe example
MQTT::Client.connect(Credentials.host,
  username: Credentials.username,
  password: Credentials.password
) do |c|
  puts "Waiting for messages on #{topic}. To exit press CTRL+C"
  c.get(topic) do |topic, message|
    puts "#{topic}: #{message}"
  end
end
