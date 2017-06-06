require 'mqtt'
require_relative '../utils/credentials'

virtual_host = ''
user_id = ARGV[0] || 1703051

routing_key_base = [virtual_host, 'bots', user_id].join '/'

# Publish example
MQTT::Client.connect(Credentials.host,
  username: Credentials.username,
  password: Credentials.password
) do |c|
  puts 'Publishing...'

  %w{temperature humidity io reset_reason}.each do |topic|
    full_topic = [routing_key_base, topic].join '/'

    # Fake measure
    message = rand(50)

    c.publish(full_topic, message)

    puts "Sent #{message} to #{full_topic}"
  end
end
