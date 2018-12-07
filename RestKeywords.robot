*** Settings ***
Documentation    Suite description
Library  MQTTLibrary
Library  RequestsLibrary
Library  Collections
Variables  Data.yaml

*** Keywords ***
I provide a POST request
    ${proxies} =  create dictionary  http=http://  https=http://
    create session  ${POST_REQUEST.alias}  ${POST_REQUEST.session_url}  proxies=${proxies}
    ${headers} =  Create dictionary  Accept=${POST_REQUEST.Accept}  Cache-Control=${POST_REQUEST.cache_control}  Content-Type=${POST_REQUEST.content_type}
    ${params} =  create dictionary  grant_type=${POST_REQUEST.grant_type}  redirect-uri=${POST_REQUEST.redirect_uri}  client_id=${POST_REQUEST.client_id}  refresh_token=${POST_REQUEST.refresh_token}
    ${resp} =  POST REQUEST  ${POST_REQUEST.alias}  ${POST_REQUEST.uri}  ${headers}  ${params}
    log to console  ${resp.json()}
    SET SUITE VARIABLE   ${resp_code}  ${resp.status_code}

I provide a GET request
    create session   ${GET_REQUEST.alias}  ${GET_REQUEST.session_url}
    ${headers} =  Create dictionary  Accept=${GET_REQUEST.Accept}  Cache-Control=${GET_REQUEST.cache_control}  Content-Type=${GET_REQUEST.content_type} Authorization=${GET_REQUEST.Authorization}
    ${resp} =  GET REQUEST  ${GET_REQUEST.alias}  ${GET_REQUEST.uri}  ${headers}
    LOG TO CONSOLE  ${resp.json()}
    SET SUITE VARIABLE   ${resp_code}  ${resp.status_code}

Verify status code is ${resp.status_code}
    should be equal as strings  ${resp_code}  ${resp.status_code}
    LOG   status code is equal to:${resp.status_code}

I provide a PUT request
     create session   ${PUT_REQUEST.alias}  ${PUT_REQUEST.session_url}
     ${params} =  create dictionary  grant_type=${PUT_REQUEST.grant_type}  redirect-uri=${PUT_REQUEST.redirect_uri}  client_id=${PUT_REQUEST}
     ${resp} =  PUT REQUEST  ${PUT_REQUEST.alias}  ${PUT_REQUEST.uri}  ${params}

Convert to JSON ${value}
    log to console  ${value}
    TO JSON  ${value}  pretty_print=False



