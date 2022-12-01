//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSIoTDataResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSIoTDataResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSIoTDataResources

+ (instancetype)sharedInstance {
    static AWSIoTDataResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSIoTDataResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-05-28\",\
    \"endpointPrefix\":\"data-ats.iot\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS IoT Data Plane\",\
    \"serviceId\":\"IoT Data Plane\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"iotdata\",\
    \"uid\":\"iot-data-2015-05-28\"\
  },\
  \"operations\":{\
    \"DeleteThingShadow\":{\
      \"name\":\"DeleteThingShadow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/things/{thingName}/shadow\"\
      },\
      \"input\":{\"shape\":\"DeleteThingShadowRequest\"},\
      \"output\":{\"shape\":\"DeleteThingShadowResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"UnsupportedDocumentEncodingException\"}\
      ],\
      \"documentation\":\"<p>Deletes the shadow for the specified thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">DeleteThingShadow</a> action.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_DeleteThingShadow.html\\\">DeleteThingShadow</a> in the IoT Developer Guide.</p>\"\
    },\
    \"GetRetainedMessage\":{\
      \"name\":\"GetRetainedMessage\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/retainedMessage/{topic}\"\
      },\
      \"input\":{\"shape\":\"GetRetainedMessageRequest\"},\
      \"output\":{\"shape\":\"GetRetainedMessageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"}\
      ],\
      \"documentation\":\"<p>Gets the details of a single retained message for the specified topic.</p> <p>This action returns the message payload of the retained message, which can incur messaging costs. To list only the topic names of the retained messages, call <a href=\\\"/iot/latest/developerguide/API_iotdata_ListRetainedMessages.html\\\">ListRetainedMessages</a>.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions\\\">GetRetainedMessage</a> action.</p> <p>For more information about messaging costs, see <a href=\\\"http://aws.amazon.com/iot-core/pricing/#Messaging\\\">Amazon Web Services IoT Core pricing - Messaging</a>.</p>\"\
    },\
    \"GetThingShadow\":{\
      \"name\":\"GetThingShadow\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/things/{thingName}/shadow\"\
      },\
      \"input\":{\"shape\":\"GetThingShadowRequest\"},\
      \"output\":{\"shape\":\"GetThingShadowResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"UnsupportedDocumentEncodingException\"}\
      ],\
      \"documentation\":\"<p>Gets the shadow for the specified thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">GetThingShadow</a> action.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_GetThingShadow.html\\\">GetThingShadow</a> in the IoT Developer Guide.</p>\"\
    },\
    \"ListNamedShadowsForThing\":{\
      \"name\":\"ListNamedShadowsForThing\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/api/things/shadow/ListNamedShadowsForThing/{thingName}\"\
      },\
      \"input\":{\"shape\":\"ListNamedShadowsForThingRequest\"},\
      \"output\":{\"shape\":\"ListNamedShadowsForThingResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"}\
      ],\
      \"documentation\":\"<p>Lists the shadows for the specified thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">ListNamedShadowsForThing</a> action.</p>\"\
    },\
    \"ListRetainedMessages\":{\
      \"name\":\"ListRetainedMessages\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/retainedMessage\"\
      },\
      \"input\":{\"shape\":\"ListRetainedMessagesRequest\"},\
      \"output\":{\"shape\":\"ListRetainedMessagesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"}\
      ],\
      \"documentation\":\"<p>Lists summary information about the retained messages stored for the account.</p> <p>This action returns only the topic names of the retained messages. It doesn't return any message payloads. Although this action doesn't return a message payload, it can still incur messaging costs.</p> <p>To get the message payload of a retained message, call <a href=\\\"https://docs.aws.amazon.com/iot/latest/developerguide/API_iotdata_GetRetainedMessage.html\\\">GetRetainedMessage</a> with the topic name of the retained message.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiotfleethubfordevicemanagement.html#awsiotfleethubfordevicemanagement-actions-as-permissions\\\">ListRetainedMessages</a> action.</p> <p>For more information about messaging costs, see <a href=\\\"http://aws.amazon.com/iot-core/pricing/#Messaging\\\">Amazon Web Services IoT Core pricing - Messaging</a>.</p>\"\
    },\
    \"Publish\":{\
      \"name\":\"Publish\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/topics/{topic}\"\
      },\
      \"input\":{\"shape\":\"PublishRequest\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Publishes an MQTT message.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">Publish</a> action.</p> <p>For more information about MQTT messages, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/mqtt.html\\\">MQTT Protocol</a> in the IoT Developer Guide.</p> <p>For more information about messaging costs, see <a href=\\\"http://aws.amazon.com/iot-core/pricing/#Messaging\\\">Amazon Web Services IoT Core pricing - Messaging</a>.</p>\"\
    },\
    \"UpdateThingShadow\":{\
      \"name\":\"UpdateThingShadow\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/things/{thingName}/shadow\"\
      },\
      \"input\":{\"shape\":\"UpdateThingShadowRequest\"},\
      \"output\":{\"shape\":\"UpdateThingShadowResponse\"},\
      \"errors\":[\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"RequestEntityTooLargeException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"UnauthorizedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"MethodNotAllowedException\"},\
        {\"shape\":\"UnsupportedDocumentEncodingException\"}\
      ],\
      \"documentation\":\"<p>Updates the shadow for the specified thing.</p> <p>Requires permission to access the <a href=\\\"https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions\\\">UpdateThingShadow</a> action.</p> <p>For more information, see <a href=\\\"http://docs.aws.amazon.com/iot/latest/developerguide/API_UpdateThingShadow.html\\\">UpdateThingShadow</a> in the IoT Developer Guide.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified version does not match the version of the document.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ContentType\":{\"type\":\"string\"},\
    \"CorrelationData\":{\"type\":\"string\"},\
    \"DeleteThingShadowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"shadowName\":{\
          \"shape\":\"ShadowName\",\
          \"documentation\":\"<p>The name of the shadow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>The input for the DeleteThingShadow operation.</p>\"\
    },\
    \"DeleteThingShadowResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"payload\"],\
      \"members\":{\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the DeleteThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"GetRetainedMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"topic\"],\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"documentation\":\"<p>The topic name of the retained message to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"topic\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetRetainedMessage operation.</p>\"\
    },\
    \"GetRetainedMessageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"documentation\":\"<p>The topic name to which the retained message was published.</p>\"\
        },\
        \"payload\":{\
          \"shape\":\"Payload\",\
          \"documentation\":\"<p>The Base64-encoded message payload of the retained message body.</p>\"\
        },\
        \"qos\":{\
          \"shape\":\"Qos\",\
          \"documentation\":\"<p>The quality of service (QoS) level used to publish the retained message.</p>\"\
        },\
        \"lastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The Epoch date and time, in milliseconds, when the retained message was stored by IoT.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetRetainedMessage operation.</p>\"\
    },\
    \"GetThingShadowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"shadowName\":{\
          \"shape\":\"ShadowName\",\
          \"documentation\":\"<p>The name of the shadow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>The input for the GetThingShadow operation.</p>\"\
    },\
    \"GetThingShadowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the GetThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An unexpected error has occurred.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"JsonDocument\":{\"type\":\"blob\"},\
    \"ListNamedShadowsForThingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"thingName\"],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"pageSize\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>The result page size.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"pageSize\"\
        }\
      }\
    },\
    \"ListNamedShadowsForThingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"results\":{\
          \"shape\":\"NamedShadowList\",\
          \"documentation\":\"<p>The list of shadows for the specified thing.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use to get the next set of results, or <b>null</b> if there are no additional results.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The Epoch date and time the response was generated by IoT.</p>\"\
        }\
      }\
    },\
    \"ListRetainedMessagesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>To retrieve the next set of results, the <code>nextToken</code> value from a previous response; otherwise <b>null</b> to receive the first set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"maxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return at one time.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRetainedMessagesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"retainedTopics\":{\
          \"shape\":\"RetainedMessageList\",\
          \"documentation\":\"<p>A summary list the account's retained messages. The information returned doesn't include the message payloads of the retained messages.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results, or null if there are no additional results.</p>\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"MessageExpiry\":{\"type\":\"long\"},\
    \"MethodNotAllowedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified combination of HTTP verb and URI is not supported.</p>\",\
      \"error\":{\"httpStatusCode\":405},\
      \"exception\":true\
    },\
    \"NamedShadowList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ShadowName\"}\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Payload\":{\"type\":\"blob\"},\
    \"PayloadFormatIndicator\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UNSPECIFIED_BYTES\",\
        \"UTF8_DATA\"\
      ]\
    },\
    \"PayloadSize\":{\"type\":\"long\"},\
    \"PublishRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"topic\"],\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"documentation\":\"<p>The name of the MQTT topic.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"topic\"\
        },\
        \"qos\":{\
          \"shape\":\"Qos\",\
          \"documentation\":\"<p>The Quality of Service (QoS) level. The default QoS level is 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"qos\"\
        },\
        \"retain\":{\
          \"shape\":\"Retain\",\
          \"documentation\":\"<p>A Boolean value that determines whether to set the RETAIN flag when the message is published.</p> <p>Setting the RETAIN flag causes the message to be retained and sent to new subscribers to the topic.</p> <p>Valid values: <code>true</code> | <code>false</code> </p> <p>Default value: <code>false</code> </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"retain\"\
        },\
        \"payload\":{\
          \"shape\":\"Payload\",\
          \"documentation\":\"<p>The message body. MQTT accepts text, binary, and empty (null) message payloads.</p> <p>Publishing an empty (null) payload with <b>retain</b> = <code>true</code> deletes the retained message identified by <b>topic</b> from Amazon Web Services IoT Core.</p>\"\
        },\
        \"userProperties\":{\
          \"shape\":\"UserProperties\",\
          \"documentation\":\"<p>A JSON string that contains an array of JSON objects. If you donât use Amazon Web Services SDK or CLI, you must encode the JSON string to base64 format before adding it to the HTTP header. <code>userProperties</code> is an HTTP header value in the API.</p> <p>The following example <code>userProperties</code> parameter is a JSON string which represents two User Properties. Note that it needs to be base64-encoded:</p> <p> <code>[{\\\"deviceName\\\": \\\"alpha\\\"}, {\\\"deviceCnt\\\": \\\"45\\\"}]</code> </p>\",\
          \"jsonvalue\":true,\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mqtt5-user-properties\"\
        },\
        \"payloadFormatIndicator\":{\
          \"shape\":\"PayloadFormatIndicator\",\
          \"documentation\":\"<p>An <code>Enum</code> string value that indicates whether the payload is formatted as UTF-8. <code>payloadFormatIndicator</code> is an HTTP header value in the API.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mqtt5-payload-format-indicator\"\
        },\
        \"contentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>A UTF-8 encoded string that describes the content of the publishing message.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"contentType\"\
        },\
        \"responseTopic\":{\
          \"shape\":\"ResponseTopic\",\
          \"documentation\":\"<p>A UTF-8 encoded string that's used as the topic name for a response message. The response topic is used to describe the topic which the receiver should publish to as part of the request-response flow. The topic must not contain wildcard characters.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"responseTopic\"\
        },\
        \"correlationData\":{\
          \"shape\":\"CorrelationData\",\
          \"documentation\":\"<p>The base64-encoded binary data used by the sender of the request message to identify which request the response message is for when it's received. <code>correlationData</code> is an HTTP header value in the API.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-amz-mqtt5-correlation-data\"\
        },\
        \"messageExpiry\":{\
          \"shape\":\"MessageExpiry\",\
          \"documentation\":\"<p>A user-defined integer value that represents the message expiry interval in seconds. If absent, the message doesn't expire. For more information about the limits of <code>messageExpiry</code>, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/iot-core.html#message-broker-limits\\\">Amazon Web Services IoT Core message broker and protocol limits and quotas </a> from the Amazon Web Services Reference Guide.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"messageExpiry\"\
        }\
      },\
      \"documentation\":\"<p>The input for the Publish operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"Qos\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"RequestEntityTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The payload exceeds the maximum size allowed.</p>\",\
      \"error\":{\"httpStatusCode\":413},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResponseTopic\":{\"type\":\"string\"},\
    \"Retain\":{\"type\":\"boolean\"},\
    \"RetainedMessageList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RetainedMessageSummary\"}\
    },\
    \"RetainedMessageSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"topic\":{\
          \"shape\":\"Topic\",\
          \"documentation\":\"<p>The topic name to which the retained message was published.</p>\"\
        },\
        \"payloadSize\":{\
          \"shape\":\"PayloadSize\",\
          \"documentation\":\"<p>The size of the retained message's payload in bytes.</p>\"\
        },\
        \"qos\":{\
          \"shape\":\"Qos\",\
          \"documentation\":\"<p>The quality of service (QoS) level used to publish the retained message.</p>\"\
        },\
        \"lastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The Epoch date and time, in milliseconds, when the retained message was stored by IoT.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a single retained message.</p>\"\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The service is temporarily unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"ShadowName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThingName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9:_-]+\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The rate exceeds the limit.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"long\"},\
    \"Topic\":{\"type\":\"string\"},\
    \"UnauthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>You are not authorized to perform this operation.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"UnsupportedDocumentEncodingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"errorMessage\",\
          \"documentation\":\"<p>The message for the exception.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The document encoding is not supported.</p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UpdateThingShadowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"thingName\",\
        \"payload\"\
      ],\
      \"members\":{\
        \"thingName\":{\
          \"shape\":\"ThingName\",\
          \"documentation\":\"<p>The name of the thing.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"thingName\"\
        },\
        \"shadowName\":{\
          \"shape\":\"ShadowName\",\
          \"documentation\":\"<p>The name of the shadow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"name\"\
        },\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input for the UpdateThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"UpdateThingShadowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"payload\":{\
          \"shape\":\"JsonDocument\",\
          \"documentation\":\"<p>The state information, in JSON format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The output from the UpdateThingShadow operation.</p>\",\
      \"payload\":\"payload\"\
    },\
    \"UserProperties\":{\"type\":\"string\"},\
    \"errorMessage\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>IoT data</fullname> <p>IoT data enables secure, bi-directional communication between Internet-connected things (such as sensors, actuators, embedded devices, or smart appliances) and the Amazon Web Services cloud. It implements a broker for applications and things to publish messages over HTTP (Publish) and retrieve, update, and delete shadows. A shadow is a persistent representation of your things and their state in the Amazon Web Services cloud.</p> <p>Find the endpoint address for actions in IoT data by running this CLI command:</p> <p> <code>aws iot describe-endpoint --endpoint-type iot:Data-ATS</code> </p> <p>The service name used by <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Amazon Web ServicesSignature Version 4</a> to sign requests is: <i>iotdevicegateway</i>.</p>\"\
}\
";
}

@end
