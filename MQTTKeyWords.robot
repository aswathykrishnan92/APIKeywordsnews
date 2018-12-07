*** Settings ***
Documentation    Suite description
Library  MQTTLibrary
Library  RequestsLibrary
Library  Collections
Variables  Data.yaml



*** Keywords ***
I Publish an MQTT Message
    connect  ${MQTT.hostname}
    publish  ${MQTT.topic}  ${MQTT.message}  ${MQTT.qos}
    disconnect

I SUBSCRIBE to a Topic
    connect  ${MQTT.hostname}
    subscribe and validate  ${MQTT.topic}  ${MQTT.qos}  ${MQTT.message}  5
    disconnect

I SUBSCRIBE to a topic and get message
    connect  ${MQTT.hostname}
    i publish an mqtt message
    ${messages} =  subscribe  ${MQTT.topic}  ${MQTT.qos}   5
    log to console  ${messages}

I Publish multiple messages
     connect  ${MQTT.hostname}
     ${message1} =  create dictionary  topic=${MQTT.topic}	payload=message 1
     ${message2} =  create dictionary  topic=${MQTT.topic}	payload=message 2
     ${message3} =  create dictionary  topic=${MQTT.topic}	payload=message 3
     @{msgs}  create list  ${message1}  ${message2}  ${message3}
     PUBLISH MULTIPLE  msgs=@{msgs}  hostname=127.0.0.1




