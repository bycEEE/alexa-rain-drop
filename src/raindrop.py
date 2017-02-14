# -*- coding: utf-8 -*-
"""
This sample demonstrates a simple skill built with the Amazon Alexa Skills Kit.
The Intent Schema, Custom Slots, and Sample Utterances for this skill, as well
as testing instructions are located at http://amzn.to/1LzFrj6
For additional samples, visit the Alexa Skills Kit Getting Started guide at
http://amzn.to/1LGWsLG
"""

from __future__ import print_function

def lambda_handler(event, context):
    print("event.session.application.applicationId=" +
          event['session']['application']['applicationId'])

    if event['session']['new']:
        on_session_started({'requestId': event['request']['requestId']},
                           event['session'])

    return on_launch(event['request'], event['session'])

def on_session_started(session_started_request, session):
    print("on_session_started requestId=" + session_started_request['requestId']
          + ", sessionId=" + session['sessionId'])

def on_launch(launch_request, session):
    print("on_launch requestId=" + launch_request['requestId'] +
          ", sessionId=" + session['sessionId'])

    return say_rain_drop_lyrics()

def say_rain_drop_lyrics():
    session_attributes = {}
    speech_output = "Drop top. " \
                    "Smoking on cookie in the hot box, " \
                    "<phoneme alphabet='ipa' ph='ˈfʌkɪŋ'>forking</phoneme> on your <phoneme alphabet='ipa' ph='ˈbɪtʃ'>beech</phoneme> she a thot thot thot," \
                    "Cooking up dope in the crock pot pot"

    should_end_session = True
    return build_response(session_attributes, build_ssml_response(
        speech_output, should_end_session))

def build_ssml_response(output, should_end_session):
    return {
        'outputSpeech': {
            'type': 'SSML',
            'ssml': "<speak>" + output + "</speak>"
        },
        'shouldEndSession': should_end_session
}
 
 
def build_response(session_attributes, speechlet_response):
    return {
        'version': '1.0',
        'sessionAttributes': session_attributes,
        'response': speechlet_response
    }
