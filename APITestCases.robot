*** Settings ***
Documentation    Suite description
Library  MQTTLibrary
Library  RequestsLibrary
Library  Collections
Resource  MQTTKeyWords.robot
Resource  RestKeywords.robot

*** Test Cases ***
MQTT_PUBLISH
    I Publish an MQTT Message

MQTT_SUBSCRIBE_AND_VALIDATE
    I SUBSCRIBE to a Topic

MQTT_SUBSCRIBE_GET_MESSAGES
    I SUBSCRIBE to a topic and get message

POST_REQUEST
    I PROVIDE A POST REQUEST


