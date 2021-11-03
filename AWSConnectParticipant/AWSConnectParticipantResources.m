//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSConnectParticipantResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSConnectParticipantResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSConnectParticipantResources

+ (instancetype)sharedInstance {
    static AWSConnectParticipantResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSConnectParticipantResources new];
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
    \"apiVersion\":\"2018-09-07\",\
    \"endpointPrefix\":\"participant.connect\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amazon Connect Participant\",\
    \"serviceFullName\":\"Amazon Connect Participant Service\",\
    \"serviceId\":\"ConnectParticipant\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"execute-api\",\
    \"uid\":\"connectparticipant-2018-09-07\"\
  },\
  \"operations\":{\
    \"CompleteAttachmentUpload\":{\
      \"name\":\"CompleteAttachmentUpload\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/complete-attachment-upload\"\
      },\
      \"input\":{\"shape\":\"CompleteAttachmentUploadRequest\"},\
      \"output\":{\"shape\":\"CompleteAttachmentUploadResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Allows you to confirm that the attachment has been uploaded using the pre-signed URL provided in StartAttachmentUpload API. </p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    },\
    \"CreateParticipantConnection\":{\
      \"name\":\"CreateParticipantConnection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/connection\"\
      },\
      \"input\":{\"shape\":\"CreateParticipantConnectionRequest\"},\
      \"output\":{\"shape\":\"CreateParticipantConnectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Creates the participant's connection. Note that ParticipantToken is used for invoking this API instead of ConnectionToken.</p> <p>The participant token is valid for the lifetime of the participant â until they are part of a contact.</p> <p>The response URL for <code>WEBSOCKET</code> Type has a connect expiry timeout of 100s. Clients must manually connect to the returned websocket URL and subscribe to the desired topic. </p> <p>For chat, you need to publish the following on the established websocket connection:</p> <p> <code>{\\\"topic\\\":\\\"aws/subscribe\\\",\\\"content\\\":{\\\"topics\\\":[\\\"aws/chat\\\"]}}</code> </p> <p>Upon websocket URL expiry, as specified in the response ConnectionExpiry parameter, clients need to call this API again to obtain a new websocket URL and perform the same steps as before.</p> <p> <b>Message streaming support</b>: This API can also be used together with the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html\\\">StartContactStreaming</a> API to create a participant connection for chat contacts that are not using a websocket. For more information about message streaming, <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html\\\">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <p> <b>Feature specifications</b>: For information about feature specifications, such as the allowed number of open websocket connections per participant, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits\\\">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p> <note> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p> </note>\"\
    },\
    \"DisconnectParticipant\":{\
      \"name\":\"DisconnectParticipant\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/disconnect\"\
      },\
      \"input\":{\"shape\":\"DisconnectParticipantRequest\"},\
      \"output\":{\"shape\":\"DisconnectParticipantResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Disconnects a participant. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    },\
    \"GetAttachment\":{\
      \"name\":\"GetAttachment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/attachment\"\
      },\
      \"input\":{\"shape\":\"GetAttachmentRequest\"},\
      \"output\":{\"shape\":\"GetAttachmentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Provides a pre-signed URL for download of a completed attachment. This is an asynchronous API for use with active contacts.</p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    },\
    \"GetTranscript\":{\
      \"name\":\"GetTranscript\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/transcript\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a transcript of the session, including details about any attachments. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    },\
    \"SendEvent\":{\
      \"name\":\"SendEvent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/event\"\
      },\
      \"input\":{\"shape\":\"SendEventRequest\"},\
      \"output\":{\"shape\":\"SendEventResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Sends an event. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    },\
    \"SendMessage\":{\
      \"name\":\"SendMessage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/message\"\
      },\
      \"input\":{\"shape\":\"SendMessageRequest\"},\
      \"output\":{\"shape\":\"SendMessageResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"}\
      ],\
      \"documentation\":\"<p>Sends a message. Note that ConnectionToken is used for invoking this API instead of ParticipantToken.</p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    },\
    \"StartAttachmentUpload\":{\
      \"name\":\"StartAttachmentUpload\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/participant/start-attachment-upload\"\
      },\
      \"input\":{\"shape\":\"StartAttachmentUploadRequest\"},\
      \"output\":{\"shape\":\"StartAttachmentUploadResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Provides a pre-signed Amazon S3 URL in response for uploading the file directly to S3.</p> <p>The Amazon Connect Participant Service APIs do not use <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 authentication</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>You do not have sufficient access to perform this action.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"ArtifactId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ArtifactStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"APPROVED\",\
        \"REJECTED\",\
        \"IN_PROGRESS\"\
      ]\
    },\
    \"AttachmentIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ArtifactId\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"AttachmentItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>Describes the MIME file type of the attachment. For a list of supported file types, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits\\\">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"AttachmentId\":{\
          \"shape\":\"ArtifactId\",\
          \"documentation\":\"<p>A unique identifier for the attachment.</p>\"\
        },\
        \"AttachmentName\":{\
          \"shape\":\"AttachmentName\",\
          \"documentation\":\"<p>A case-sensitive name of the attachment being uploaded.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ArtifactStatus\",\
          \"documentation\":\"<p>Status of the attachment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The case-insensitive input to indicate standard MIME type that describes the format of the file that will be uploaded.</p>\"\
    },\
    \"AttachmentName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"AttachmentSizeInBytes\":{\
      \"type\":\"long\",\
      \"min\":1\
    },\
    \"Attachments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttachmentItem\"}\
    },\
    \"Bool\":{\"type\":\"boolean\"},\
    \"ChatContent\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ChatContentType\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ChatItemId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ChatItemType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TYPING\",\
        \"PARTICIPANT_JOINED\",\
        \"PARTICIPANT_LEFT\",\
        \"CHAT_ENDED\",\
        \"TRANSFER_SUCCEEDED\",\
        \"TRANSFER_FAILED\",\
        \"MESSAGE\",\
        \"EVENT\",\
        \"ATTACHMENT\",\
        \"CONNECTION_ACK\"\
      ]\
    },\
    \"ClientToken\":{\
      \"type\":\"string\",\
      \"max\":500\
    },\
    \"CompleteAttachmentUploadRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AttachmentIds\",\
        \"ClientToken\",\
        \"ConnectionToken\"\
      ],\
      \"members\":{\
        \"AttachmentIds\":{\
          \"shape\":\"AttachmentIdList\",\
          \"documentation\":\"<p>A list of unique identifiers for the attachments.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"NonEmptyClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the participant's connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"CompleteAttachmentUploadResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Reason\"}\
      },\
      \"documentation\":\"<p>An attachment with that identifier is already being uploaded.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ConnectionCredentials\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The connection token.</p>\"\
        },\
        \"Expiry\":{\
          \"shape\":\"ISO8601Datetime\",\
          \"documentation\":\"<p>The expiration of the token.</p> <p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Connection credentials. </p>\"\
    },\
    \"ConnectionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"WEBSOCKET\",\
        \"CONNECTION_CREDENTIALS\"\
      ]\
    },\
    \"ConnectionTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ConnectionType\"},\
      \"min\":1\
    },\
    \"ContactId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ContentType\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"CreateParticipantConnectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Type\",\
        \"ParticipantToken\"\
      ],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"ConnectionTypeList\",\
          \"documentation\":\"<p>Type of connection information required.</p>\"\
        },\
        \"ParticipantToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>This is a header parameter.</p> <p>The ParticipantToken as obtained from <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_StartChatContact.html\\\">StartChatContact</a> API response.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        },\
        \"ConnectParticipant\":{\
          \"shape\":\"Bool\",\
          \"documentation\":\"<p>Amazon Connect Participant is used to mark the participant as connected for message streaming.</p>\"\
        }\
      }\
    },\
    \"CreateParticipantConnectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Websocket\":{\
          \"shape\":\"Websocket\",\
          \"documentation\":\"<p>Creates the participant's websocket connection.</p>\"\
        },\
        \"ConnectionCredentials\":{\
          \"shape\":\"ConnectionCredentials\",\
          \"documentation\":\"<p>Creates the participant's connection credentials. The authentication token associated with the participant's connection.</p>\"\
        }\
      }\
    },\
    \"DisconnectParticipantRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConnectionToken\"],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the participant's connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"DisconnectParticipantResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DisplayName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"GetAttachmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AttachmentId\",\
        \"ConnectionToken\"\
      ],\
      \"members\":{\
        \"AttachmentId\":{\
          \"shape\":\"ArtifactId\",\
          \"documentation\":\"<p>A unique identifier for the attachment.</p>\"\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the participant's connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"GetAttachmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"PreSignedAttachmentUrl\",\
          \"documentation\":\"<p>This is the pre-signed URL that can be used for uploading the file to Amazon S3 when used in response to <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_StartAttachmentUpload.html\\\">StartAttachmentUpload</a>.</p>\"\
        },\
        \"UrlExpiry\":{\
          \"shape\":\"ISO8601Datetime\",\
          \"documentation\":\"<p>The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConnectionToken\"],\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The contactId from the current contact chain for which transcript is needed.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of results to return in the page. Default: 10. </p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token. Use the value returned previously in the next subsequent request to retrieve the next set of results.</p>\"\
        },\
        \"ScanDirection\":{\
          \"shape\":\"ScanDirection\",\
          \"documentation\":\"<p>The direction from StartPosition from which to retrieve message. Default: BACKWARD when no StartPosition is provided, FORWARD with StartPosition. </p>\"\
        },\
        \"SortOrder\":{\
          \"shape\":\"SortKey\",\
          \"documentation\":\"<p>The sort order for the records. Default: DESCENDING.</p>\"\
        },\
        \"StartPosition\":{\
          \"shape\":\"StartPosition\",\
          \"documentation\":\"<p>A filtering option for where to start.</p>\"\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the participant's connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"GetTranscriptResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The initial contact ID for the contact. </p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>The list of messages in the session.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The pagination token. Use the value returned previously in the next subsequent request to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ISO8601Datetime\":{\"type\":\"string\"},\
    \"Instant\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>This exception occurs when there is an internal failure in the Amazon Connect service.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"Item\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AbsoluteTime\":{\
          \"shape\":\"Instant\",\
          \"documentation\":\"<p>The time when the message or event was sent.</p> <p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ChatContent\",\
          \"documentation\":\"<p>The content of the message or event.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"ChatContentType\",\
          \"documentation\":\"<p>The type of content of the item.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ChatItemId\",\
          \"documentation\":\"<p>The ID of the item.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ChatItemType\",\
          \"documentation\":\"<p>Type of the item: message or event. </p>\"\
        },\
        \"ParticipantId\":{\
          \"shape\":\"ParticipantId\",\
          \"documentation\":\"<p>The ID of the sender in the session.</p>\"\
        },\
        \"DisplayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p>The chat display name of the sender.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>The role of the sender. For example, is it a customer, agent, or system.</p>\"\
        },\
        \"Attachments\":{\
          \"shape\":\"Attachments\",\
          \"documentation\":\"<p>Provides information about the attachments.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An item - message or event - that has been sent. </p>\"\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Message\":{\"type\":\"string\"},\
    \"MostRecent\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"NonEmptyClientToken\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"ParticipantId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ParticipantRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AGENT\",\
        \"CUSTOMER\",\
        \"SYSTEM\"\
      ]\
    },\
    \"ParticipantToken\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"PreSignedAttachmentUrl\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"PreSignedConnectionUrl\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"Reason\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"ScanDirection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FORWARD\",\
        \"BACKWARD\"\
      ]\
    },\
    \"SendEventRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContentType\",\
        \"ConnectionToken\"\
      ],\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ChatContentType\",\
          \"documentation\":\"<p>The content type of the request. Supported types are:</p> <ul> <li> <p>application/vnd.amazonaws.connect.event.typing</p> </li> <li> <p>application/vnd.amazonaws.connect.event.connection.acknowledged</p> </li> </ul>\"\
        },\
        \"Content\":{\
          \"shape\":\"ChatContent\",\
          \"documentation\":\"<p>The content of the event to be sent (for example, message text). This is not yet supported.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the participant's connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"SendEventResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ChatItemId\",\
          \"documentation\":\"<p>The ID of the response.</p>\"\
        },\
        \"AbsoluteTime\":{\
          \"shape\":\"Instant\",\
          \"documentation\":\"<p>The time when the event was sent.</p> <p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        }\
      }\
    },\
    \"SendMessageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContentType\",\
        \"Content\",\
        \"ConnectionToken\"\
      ],\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ChatContentType\",\
          \"documentation\":\"<p>The type of the content. Supported types are text/plain.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ChatContent\",\
          \"documentation\":\"<p>The content of the message.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"SendMessageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ChatItemId\",\
          \"documentation\":\"<p>The ID of the message.</p>\"\
        },\
        \"AbsoluteTime\":{\
          \"shape\":\"Instant\",\
          \"documentation\":\"<p>The time when the message was sent.</p> <p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        }\
      }\
    },\
    \"ServiceQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The number of attachments per contact exceeds the quota.</p>\",\
      \"error\":{\"httpStatusCode\":402},\
      \"exception\":true\
    },\
    \"SortKey\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DESCENDING\",\
        \"ASCENDING\"\
      ]\
    },\
    \"StartAttachmentUploadRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContentType\",\
        \"AttachmentSizeInBytes\",\
        \"AttachmentName\",\
        \"ClientToken\",\
        \"ConnectionToken\"\
      ],\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>Describes the MIME file type of the attachment. For a list of supported file types, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits\\\">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"AttachmentSizeInBytes\":{\
          \"shape\":\"AttachmentSizeInBytes\",\
          \"documentation\":\"<p>The size of the attachment in bytes.</p>\"\
        },\
        \"AttachmentName\":{\
          \"shape\":\"AttachmentName\",\
          \"documentation\":\"<p>A case-sensitive name of the attachment being uploaded.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"NonEmptyClientToken\",\
          \"documentation\":\"<p>A unique case sensitive identifier to support idempotency of request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ConnectionToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The authentication token associated with the participant's connection.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Bearer\"\
        }\
      }\
    },\
    \"StartAttachmentUploadResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttachmentId\":{\
          \"shape\":\"ArtifactId\",\
          \"documentation\":\"<p>A unique identifier for the attachment.</p>\"\
        },\
        \"UploadMetadata\":{\
          \"shape\":\"UploadMetadata\",\
          \"documentation\":\"<p>Fields to be used while uploading the attachment.</p>\"\
        }\
      }\
    },\
    \"StartPosition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ChatItemId\",\
          \"documentation\":\"<p>The ID of the message or event where to start. </p>\"\
        },\
        \"AbsoluteTime\":{\
          \"shape\":\"Instant\",\
          \"documentation\":\"<p>The time in ISO format where to start.</p> <p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        },\
        \"MostRecent\":{\
          \"shape\":\"MostRecent\",\
          \"documentation\":\"<p>The start position of the most recent message where you want to start. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A filtering option for where to start. For example, if you sent 100 messages, start with message 50. </p>\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The request was denied due to request throttling.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Transcript\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Item\"}\
    },\
    \"UploadMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"UploadMetadataUrl\",\
          \"documentation\":\"<p>This is the pre-signed URL that can be used for uploading the file to Amazon S3 when used in response to <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_StartAttachmentUpload.html\\\">StartAttachmentUpload</a>.</p>\"\
        },\
        \"UrlExpiry\":{\
          \"shape\":\"ISO8601Datetime\",\
          \"documentation\":\"<p>The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        },\
        \"HeadersToInclude\":{\
          \"shape\":\"UploadMetadataSignedHeaders\",\
          \"documentation\":\"<p>The headers to be provided while uploading the file to the URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Fields to be used while uploading the attachment.</p>\"\
    },\
    \"UploadMetadataSignedHeaders\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"UploadMetadataSignedHeadersKey\"},\
      \"value\":{\"shape\":\"UploadMetadataSignedHeadersValue\"}\
    },\
    \"UploadMetadataSignedHeadersKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"UploadMetadataSignedHeadersValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"UploadMetadataUrl\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\"shape\":\"Reason\"}\
      },\
      \"documentation\":\"<p>The input fails to satisfy the constraints specified by Amazon Connect.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Websocket\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"PreSignedConnectionUrl\",\
          \"documentation\":\"<p>The URL of the websocket.</p>\"\
        },\
        \"ConnectionExpiry\":{\
          \"shape\":\"ISO8601Datetime\",\
          \"documentation\":\"<p>The URL expiration timestamp in ISO date format.</p> <p>It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The websocket for the participant's connection.</p>\"\
    }\
  },\
  \"documentation\":\"<p>Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p> <p>Amazon Connect enables customer contacts through voice or chat.</p> <p>The APIs described here are used by chat participants, such as agents and customers.</p>\"\
}\
";
}

@end
