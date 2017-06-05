# Usage

Set the following environment variables:

    CONEJO_HOST
    CONEJO_USER
    CONEJO_PASS

Then pass the queue name (for AMQP) or topic (for MQTT) to the scripts. For
example:

    mqtt/publish.rb temperature

and

    mqtt/subscribe.rb temperature
