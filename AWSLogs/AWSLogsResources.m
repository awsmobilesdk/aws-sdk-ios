//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLogsResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLogsResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLogsResources

+ (instancetype)sharedInstance {
    static AWSLogsResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLogsResources new];
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
    \"apiVersion\":\"2014-03-28\",\
    \"endpointPrefix\":\"logs\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon CloudWatch Logs\",\
    \"serviceId\":\"CloudWatch Logs\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Logs_20140328\",\
    \"uid\":\"logs-2014-03-28\"\
  },\
  \"operations\":{\
    \"AssociateKmsKey\":{\
      \"name\":\"AssociateKmsKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateKmsKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Associates the specified KMS key with the specified log group.</p> <p>Associating a KMS key with a log group overrides any existing associations between the log group and a KMS key. After a KMS key is associated with a log group, all newly ingested data for the log group is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS keyis still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p> <important> <p>CloudWatch Logs supports only symmetric KMS keys. Do not use an associate an asymmetric KMS key with your log group. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Using Symmetric and Asymmetric Keys</a>.</p> </important> <p>It can take up to 5 minutes for this operation to take effect.</p> <p>If you attempt to associate a KMS key with a log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p>\"\
    },\
    \"CancelExportTask\":{\
      \"name\":\"CancelExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelExportTaskRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Cancels the specified export task.</p> <p>The task must be in the <code>PENDING</code> or <code>RUNNING</code> state.</p>\"\
    },\
    \"CreateExportTask\":{\
      \"name\":\"CreateExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateExportTaskRequest\"},\
      \"output\":{\"shape\":\"CreateExportTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates an export task so that you can efficiently export data from a log group to an Amazon S3 bucket. When you perform a <code>CreateExportTask</code> operation, you must use credentials that have permission to write to the S3 bucket that you specify as the destination.</p> <p>Exporting log data to S3 buckets that are encrypted by KMS is supported. Exporting log data to Amazon S3 buckets that have S3 Object Lock enabled with a retention period is also supported.</p> <p>Exporting to S3 buckets that are encrypted with AES-256 is supported. </p> <p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html\\\">DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html\\\">CancelExportTask</a>.</p> <p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate log data for each export task, specify a prefix to be used as the Amazon S3 key prefix for all exported objects.</p> <note> <p>Time-based sorting on chunks of log data inside an exported file is not guaranteed. You can sort the exported log field data by using Linux utilities.</p> </note>\"\
    },\
    \"CreateLogGroup\":{\
      \"name\":\"CreateLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a log group with the specified name. You can create up to 20,000 log groups per account.</p> <p>You must use the following guidelines when naming a log group:</p> <ul> <li> <p>Log group names must be unique within a Region for an Amazon Web Services account.</p> </li> <li> <p>Log group names can be between 1 and 512 characters long.</p> </li> <li> <p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)</p> </li> </ul> <p>When you create a log group, by default the log events in the log group do not expire. To set a retention policy so that events expire and are deleted after a specified time, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html\\\">PutRetentionPolicy</a>.</p> <p>If you associate an KMS key with the log group, ingested data is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p> <p>If you attempt to associate a KMS key with the log group but the KMS keydoes not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p> <important> <p>CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key with your log group. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Using Symmetric and Asymmetric Keys</a>.</p> </important>\"\
    },\
    \"CreateLogStream\":{\
      \"name\":\"CreateLogStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogStreamRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a log stream for the specified log group. A log stream is a sequence of log events that originate from a single source, such as an application instance or a resource that is being monitored.</p> <p>There is no limit on the number of log streams that you can create for a log group. There is a limit of 50 TPS on <code>CreateLogStream</code> operations, after which transactions are throttled.</p> <p>You must use the following guidelines when naming a log stream:</p> <ul> <li> <p>Log stream names must be unique within the log group.</p> </li> <li> <p>Log stream names can be between 1 and 512 characters long.</p> </li> <li> <p>Don't use ':' (colon) or '*' (asterisk) characters.</p> </li> </ul>\"\
    },\
    \"DeleteDataProtectionPolicy\":{\
      \"name\":\"DeleteDataProtectionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDataProtectionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the data protection policy from the specified log group. </p> <p>For more information about data protection policies, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html\\\">PutDataProtectionPolicy</a>.</p>\"\
    },\
    \"DeleteDestination\":{\
      \"name\":\"DeleteDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDestinationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified destination, and eventually disables all the subscription filters that publish to it. This operation does not delete the physical resource encapsulated by the destination.</p>\"\
    },\
    \"DeleteLogGroup\":{\
      \"name\":\"DeleteLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified log group and permanently deletes all the archived log events associated with the log group.</p>\"\
    },\
    \"DeleteLogStream\":{\
      \"name\":\"DeleteLogStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogStreamRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified log stream and permanently deletes all the archived log events associated with the log stream.</p>\"\
    },\
    \"DeleteMetricFilter\":{\
      \"name\":\"DeleteMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMetricFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified metric filter.</p>\"\
    },\
    \"DeleteQueryDefinition\":{\
      \"name\":\"DeleteQueryDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteQueryDefinitionRequest\"},\
      \"output\":{\"shape\":\"DeleteQueryDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a saved CloudWatch Logs Insights query definition. A query definition contains details about a saved CloudWatch Logs Insights query.</p> <p>Each <code>DeleteQueryDefinition</code> operation can delete one query definition.</p> <p>You must have the <code>logs:DeleteQueryDefinition</code> permission to be able to perform this operation.</p>\"\
    },\
    \"DeleteResourcePolicy\":{\
      \"name\":\"DeleteResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteResourcePolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a resource policy from this account. This revokes the access of the identities in that policy to put log events to this account.</p>\"\
    },\
    \"DeleteRetentionPolicy\":{\
      \"name\":\"DeleteRetentionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRetentionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified retention policy.</p> <p>Log events do not expire if they belong to log groups without a retention policy.</p>\"\
    },\
    \"DeleteSubscriptionFilter\":{\
      \"name\":\"DeleteSubscriptionFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSubscriptionFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified subscription filter.</p>\"\
    },\
    \"DescribeDestinations\":{\
      \"name\":\"DescribeDestinations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDestinationsRequest\"},\
      \"output\":{\"shape\":\"DescribeDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists all your destinations. The results are ASCII-sorted by destination name.</p>\"\
    },\
    \"DescribeExportTasks\":{\
      \"name\":\"DescribeExportTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeExportTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeExportTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified export tasks. You can list all your export tasks or filter the results based on task ID or task status.</p>\"\
    },\
    \"DescribeLogGroups\":{\
      \"name\":\"DescribeLogGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLogGroupsRequest\"},\
      \"output\":{\"shape\":\"DescribeLogGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p> <p>CloudWatch Logs doesnât support IAM policies that control access to the <code>DescribeLogGroups</code> action by using the <code>aws:ResourceTag/<i>key-name</i> </code> condition key. Other CloudWatch Logs actions do support the use of the <code>aws:ResourceTag/<i>key-name</i> </code> condition key to control access. For more information about using tags to control access, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html\\\">Controlling access to Amazon Web Services resources using tags</a>.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"DescribeLogStreams\":{\
      \"name\":\"DescribeLogStreams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLogStreamsRequest\"},\
      \"output\":{\"shape\":\"DescribeLogStreamsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p> <p>This operation has a limit of five transactions per second, after which transactions are throttled.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"DescribeMetricFilters\":{\
      \"name\":\"DescribeMetricFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeMetricFiltersRequest\"},\
      \"output\":{\"shape\":\"DescribeMetricFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified metric filters. You can list all of the metric filters or filter the results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter name.</p>\"\
    },\
    \"DescribeQueries\":{\
      \"name\":\"DescribeQueries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeQueriesRequest\"},\
      \"output\":{\"shape\":\"DescribeQueriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been run recently in this account. You can request all queries or limit it to queries of a specific log group or queries with a certain status.</p>\"\
    },\
    \"DescribeQueryDefinitions\":{\
      \"name\":\"DescribeQueryDefinitions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeQueryDefinitionsRequest\"},\
      \"output\":{\"shape\":\"DescribeQueryDefinitionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>This operation returns a paginated list of your saved CloudWatch Logs Insights query definitions.</p> <p>You can use the <code>queryDefinitionNamePrefix</code> parameter to limit the results to only the query definitions that have names that start with a certain string.</p>\"\
    },\
    \"DescribeResourcePolicies\":{\
      \"name\":\"DescribeResourcePolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeResourcePoliciesRequest\"},\
      \"output\":{\"shape\":\"DescribeResourcePoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the resource policies in this account.</p>\"\
    },\
    \"DescribeSubscriptionFilters\":{\
      \"name\":\"DescribeSubscriptionFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSubscriptionFiltersRequest\"},\
      \"output\":{\"shape\":\"DescribeSubscriptionFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the subscription filters for the specified log group. You can list all the subscription filters or filter the results by prefix. The results are ASCII-sorted by filter name.</p>\"\
    },\
    \"DisassociateKmsKey\":{\
      \"name\":\"DisassociateKmsKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateKmsKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Disassociates the associated KMS key from the specified log group.</p> <p>After the KMS key is disassociated from the log group, CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and CloudWatch Logs requires permissions for the KMS key whenever the encrypted data is requested.</p> <p>Note that it can take up to 5 minutes for this operation to take effect.</p>\"\
    },\
    \"FilterLogEvents\":{\
      \"name\":\"FilterLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"FilterLogEventsRequest\"},\
      \"output\":{\"shape\":\"FilterLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p> <p>You must have the <code>logs;FilterLogEvents</code> permission to perform this operation.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p> <p>By default, this operation returns as many log events as can fit in 1 MB (up to 10,000 log events) or all the events found within the specified time range. If the results include a token, that means there are more log events available. You can get additional results by specifying the token in a subsequent call. This operation can return empty results while there are more log events available through the token.</p> <p>The returned log events are sorted by event timestamp, the timestamp when the event was ingested by CloudWatch Logs, and the ID of the <code>PutLogEvents</code> request.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"GetDataProtectionPolicy\":{\
      \"name\":\"GetDataProtectionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDataProtectionPolicyRequest\"},\
      \"output\":{\"shape\":\"GetDataProtectionPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a log group data protection policy.</p>\"\
    },\
    \"GetLogEvents\":{\
      \"name\":\"GetLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogEventsRequest\"},\
      \"output\":{\"shape\":\"GetLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists log events from the specified log stream. You can list all of the log events or filter using a time range.</p> <p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). You can get additional log events by specifying one of the tokens in a subsequent call. This operation can return empty results while there are more log events available through the token.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p>\"\
    },\
    \"GetLogGroupFields\":{\
      \"name\":\"GetLogGroupFields\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogGroupFieldsRequest\"},\
      \"output\":{\"shape\":\"GetLogGroupFieldsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the fields that are included in log events in the specified log group. Includes the percentage of log events that contain each field. The search is limited to a time period that you specify.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must specify one of these parameters, but you can't specify both. </p> <p>In the results, fields that start with <code>@</code> are fields generated by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of each log event. For more information about the fields that are generated by CloudWatch logs, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html\\\">Supported Logs and Discovered Fields</a>.</p> <p>The response results are sorted by the frequency percentage, starting with the highest percentage.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"GetLogRecord\":{\
      \"name\":\"GetLogRecord\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogRecordRequest\"},\
      \"output\":{\"shape\":\"GetLogRecordResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Retrieves all of the fields and values of a single log event. All fields are retrieved, even if the original query that produced the <code>logRecordPointer</code> retrieved only a subset of fields. Fields are returned as field name/field value pairs.</p> <p>The full unparsed log event is returned within <code>@message</code>.</p>\"\
    },\
    \"GetQueryResults\":{\
      \"name\":\"GetQueryResults\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetQueryResultsRequest\"},\
      \"output\":{\"shape\":\"GetQueryResultsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns the results from the specified query.</p> <p>Only the fields requested in the query are returned, along with a <code>@ptr</code> field, which is the identifier for the log record. You can use the value of <code>@ptr</code> in a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html\\\">GetLogRecord</a> operation to get the full log record.</p> <p> <code>GetQueryResults</code> does not start running a query. To run a query, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a>.</p> <p>If the value of the <code>Status</code> field in the output is <code>Running</code>, this operation returns only partial results. If you see a value of <code>Scheduled</code> or <code>Running</code> for the status, you can retry the operation later to see the final results. </p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start queries in linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Displays the tags associated with a CloudWatch Logs resource. Currently, log groups and destinations support tagging.</p>\"\
    },\
    \"ListTagsLogGroup\":{\
      \"name\":\"ListTagsLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsLogGroupRequest\"},\
      \"output\":{\"shape\":\"ListTagsLogGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<important> <p>The ListTagsLogGroup operation is on the path to deprecation. We recommend that you use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a> instead.</p> </important> <p>Lists the tags for the specified log group.</p>\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API ListTagsForResource\"\
    },\
    \"PutDataProtectionPolicy\":{\
      \"name\":\"PutDataProtectionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDataProtectionPolicyRequest\"},\
      \"output\":{\"shape\":\"PutDataProtectionPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a data protection policy for the specified log group. A data protection policy can help safeguard sensitive data that's ingested by the log group by auditing and masking the sensitive log data.</p> <important> <p>Sensitive data is detected and masked when it is ingested into the log group. When you set a data protection policy, log events ingested into the log group before that time are not masked.</p> </important> <p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html\\\">GetLogEvents</a> or <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html\\\">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p> <p>For more information, including a list of types of data that can be audited and masked, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html\\\">Protect sensitive log data with masking</a>.</p>\"\
    },\
    \"PutDestination\":{\
      \"name\":\"PutDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDestinationRequest\"},\
      \"output\":{\"shape\":\"PutDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a destination. This operation is used only to create destinations for cross-account subscriptions.</p> <p>A destination encapsulates a physical resource (such as an Amazon Kinesis stream). With a destination, you can subscribe to a real-time stream of log events for a different account, ingested using <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html\\\">PutLogEvents</a>.</p> <p>Through an access policy, a destination controls what is written to it. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html\\\">PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html\\\">PutDestinationPolicy</a> after <code>PutDestination</code>.</p> <p>To perform a <code>PutDestination</code> operation, you must also have the <code>iam:PassRole</code> permission.</p>\"\
    },\
    \"PutDestinationPolicy\":{\
      \"name\":\"PutDestinationPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDestinationPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html\\\">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>\"\
    },\
    \"PutLogEvents\":{\
      \"name\":\"PutLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutLogEventsRequest\"},\
      \"output\":{\"shape\":\"PutLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidSequenceTokenException\"},\
        {\"shape\":\"DataAlreadyAcceptedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnrecognizedClientException\"}\
      ],\
      \"documentation\":\"<p>Uploads a batch of log events to the specified log stream.</p> <important> <p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream. </p> </important> <p>The batch of events must satisfy the following constraints:</p> <ul> <li> <p>The maximum batch size is 1,048,576 bytes. This size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p> </li> <li> <p>None of the log events in the batch can be more than 2 hours in the future.</p> </li> <li> <p>None of the log events in the batch can be more than 14 days in the past. Also, none of the log events can be from earlier than the retention period of the log group.</p> </li> <li> <p>The log events in the batch must be in chronological order by their timestamp. The timestamp is the time that the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. (In Amazon Web Services Tools for PowerShell and the Amazon Web Services SDK for .NET, the timestamp is specified in .NET format: <code>yyyy-mm-ddThh:mm:ss</code>. For example, <code>2017-09-15T13:45:30</code>.) </p> </li> <li> <p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p> </li> <li> <p>The maximum number of log events in a batch is 10,000.</p> </li> <li> <important> <p>The quota of five requests per second per log stream has been removed. Instead, <code>PutLogEvents</code> actions are throttled based on a per-second per-account quota. You can request an increase to the per-second throttling quota by using the Service Quotas service.</p> </important> </li> </ul> <p>If a call to <code>PutLogEvents</code> returns \\\"UnrecognizedClientException\\\" the most likely cause is a non-valid Amazon Web Services access key ID or secret key. </p>\"\
    },\
    \"PutMetricFilter\":{\
      \"name\":\"PutMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutMetricFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a metric filter and associates it with the specified log group. With metric filters, you can configure rules to extract metric data from log events ingested through <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html\\\">PutLogEvents</a>.</p> <p>The maximum number of metric filters that can be associated with a log group is 100.</p> <p>When you create a metric filter, you can also optionally assign a unit and dimensions to the metric that is created.</p> <important> <p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p> <p>CloudWatch Logs disables a metric filter if it generates 1,000 different name/value pairs for your specified dimensions within a certain amount of time. This helps to prevent accidental high charges.</p> <p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html\\\"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p> </important>\"\
    },\
    \"PutQueryDefinition\":{\
      \"name\":\"PutQueryDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutQueryDefinitionRequest\"},\
      \"output\":{\"shape\":\"PutQueryDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a query definition for CloudWatch Logs Insights. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html\\\">Analyzing Log Data with CloudWatch Logs Insights</a>.</p> <p>To update a query definition, specify its <code>queryDefinitionId</code> in your request. The values of <code>name</code>, <code>queryString</code>, and <code>logGroupNames</code> are changed to the values that you specify in your update operation. No current values are retained from the current query definition. For example, imagine updating a current query definition that includes log groups. If you don't specify the <code>logGroupNames</code> parameter in your update operation, the query definition changes to contain no log groups.</p> <p>You must have the <code>logs:PutQueryDefinition</code> permission to be able to perform this operation.</p>\"\
    },\
    \"PutResourcePolicy\":{\
      \"name\":\"PutResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"PutResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a resource policy allowing other Amazon Web Services services to put log events to this account, such as Amazon Route 53. An account can have up to 10 resource policies per Amazon Web Services Region.</p>\"\
    },\
    \"PutRetentionPolicy\":{\
      \"name\":\"PutRetentionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutRetentionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets the retention of the specified log group. With a retention policy, you can configure the number of days for which to retain log events in the specified log group.</p> <note> <p>CloudWatch Logs doesnât immediately delete log events when they reach their retention setting. It typically takes up to 72 hours after that before log events are deleted, but in rare situations might take longer.</p> <p>To illustrate, imagine that you change a log group to have a longer retention setting when it contains log events that are past the expiration date, but havenât been deleted. Those log events will take up to 72 hours to be deleted after the new retention date is reached. To make sure that log data is deleted permanently, keep a log group at its lower retention setting until 72 hours after the previous retention period ends. Alternatively, wait to change the retention setting until you confirm that the earlier log events are deleted. </p> </note>\"\
    },\
    \"PutSubscriptionFilter\":{\
      \"name\":\"PutSubscriptionFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutSubscriptionFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a subscription filter and associates it with the specified log group. With subscription filters, you can subscribe to a real-time stream of log events ingested through <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html\\\">PutLogEvents</a> and have them delivered to a specific destination. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p> <p>The following destinations are supported for subscription filters:</p> <ul> <li> <p>An Amazon Kinesis data stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A logical destination that belongs to a different account, for cross-account delivery.</p> </li> <li> <p>An Amazon Kinesis Data Firehose delivery stream that belongs to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>An Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p> </li> </ul> <p>Each log group can have up to two subscription filters associated with it. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. </p> <p>To perform a <code>PutSubscriptionFilter</code> operation, you must also have the <code>iam:PassRole</code> permission.</p>\"\
    },\
    \"StartQuery\":{\
      \"name\":\"StartQuery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartQueryRequest\"},\
      \"output\":{\"shape\":\"StartQueryResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedQueryException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Schedules a query of a log group using CloudWatch Logs Insights. You specify the log group and time range to query and the query string to use.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p> <p>Queries time out after 15 minutes of runtime. If your queries are timing out, reduce the time range being searched or partition your query into a number of queries.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start a query in a linked source account. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>. For a cross-account <code>StartQuery</code> operation, the query definition must be defined in the monitoring account.</p> <p>You can have up to 20 concurrent CloudWatch Logs insights queries, including queries that have been added to dashboards. </p>\"\
    },\
    \"StopQuery\":{\
      \"name\":\"StopQuery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopQueryRequest\"},\
      \"output\":{\"shape\":\"StopQueryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Stops a CloudWatch Logs Insights query that is in progress. If the query has already ended, the operation returns an error indicating that the specified query is not running.</p>\"\
    },\
    \"TagLogGroup\":{\
      \"name\":\"TagLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<important> <p>The TagLogGroup operation is on the path to deprecation. We recommend that you use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html\\\">TagResource</a> instead.</p> </important> <p>Adds or updates the specified tags for the specified log group.</p> <p>To list the tags for a log group, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a>. To remove tags, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html\\\">UntagResource</a>.</p> <p>For more information about tags, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging\\\">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p> <p>CloudWatch Logs doesnât support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code> condition keys. For more information about using tags to control access, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html\\\">Controlling access to Amazon Web Services resources using tags</a>.</p>\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API TagResource\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"TooManyTagsException\"}\
      ],\
      \"documentation\":\"<p>Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource. Currently, the only CloudWatch Logs resources that can be tagged are log groups and destinations. </p> <p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values.</p> <p>Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.</p> <p>You can use the <code>TagResource</code> action with a resource that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p> <p>You can associate as many as 50 tags with a CloudWatch Logs resource.</p>\"\
    },\
    \"TestMetricFilter\":{\
      \"name\":\"TestMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TestMetricFilterRequest\"},\
      \"output\":{\"shape\":\"TestMetricFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Tests the filter pattern of a metric filter against a sample of log event messages. You can use this operation to validate the correctness of a metric filter pattern.</p>\"\
    },\
    \"UntagLogGroup\":{\
      \"name\":\"UntagLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<important> <p>The UntagLogGroup operation is on the path to deprecation. We recommend that you use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html\\\">UntagResource</a> instead.</p> </important> <p>Removes the specified tags from the specified log group.</p> <p>To list the tags for a log group, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a>. To add tags, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html\\\">TagResource</a>.</p> <p>CloudWatch Logs doesnât support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code> condition keys. </p>\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API UntagResource\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from the specified resource.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessPolicy\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"AccountId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^\\\\d{12}$\"\
    },\
    \"AccountIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccountId\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"AmazonResourceName\":{\
      \"type\":\"string\",\
      \"max\":1011,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+=/:,.@-]*\"\
    },\
    \"Arn\":{\"type\":\"string\"},\
    \"AssociateKmsKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"kmsKeyId\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. This must be a symmetric KMS key. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms\\\">Amazon Resource Names</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Using Symmetric and Asymmetric Keys</a>.</p>\"\
        }\
      }\
    },\
    \"CancelExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        }\
      }\
    },\
    \"CreateExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"from\",\
        \"to\",\
        \"destination\"\
      ],\
      \"members\":{\
        \"taskName\":{\
          \"shape\":\"ExportTaskName\",\
          \"documentation\":\"<p>The name of the export task.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>Export only log streams that match the provided prefix. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"from\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time of the range for the request, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp earlier than this time are not exported.</p>\"\
        },\
        \"to\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time of the range for the request, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not exported.</p> <p>You must specify a time that is not earlier than when this log group was created.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"ExportDestinationBucket\",\
          \"documentation\":\"<p>The name of S3 bucket for the exported log data. The bucket must be in the same Amazon Web Services Region.</p>\"\
        },\
        \"destinationPrefix\":{\
          \"shape\":\"ExportDestinationPrefix\",\
          \"documentation\":\"<p>The prefix used as the start of the key for every object exported. If you don't specify a value, the default is <code>exportedlogs</code>.</p>\"\
        }\
      }\
    },\
    \"CreateExportTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        }\
      }\
    },\
    \"CreateLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms\\\">Amazon Resource Names</a>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to use for the tags.</p> <p>You can grant users access to certain log groups while preventing them from accessing other log groups. To do so, tag your groups and use IAM policies that refer to those tags. To assign tags when you create a log group, you must have either the <code>logs:TagResource</code> or <code>logs:TagLogGroup</code> permission. For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a>. For more information about using tags to control access, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html\\\">Controlling access to Amazon Web Services resources using tags</a>.</p>\"\
        }\
      }\
    },\
    \"CreateLogStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        }\
      }\
    },\
    \"DataAlreadyAcceptedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expectedSequenceToken\":{\"shape\":\"SequenceToken\"}\
      },\
      \"documentation\":\"<p>The event was already logged.</p> <important> <p> <code>PutLogEvents</code> actions are now always accepted and never return <code>DataAlreadyAcceptedException</code> regardless of whether a given batch of log events has already been accepted. </p> </important>\",\
      \"exception\":true\
    },\
    \"DataProtectionPolicyDocument\":{\"type\":\"string\"},\
    \"DataProtectionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVATED\",\
        \"DELETED\",\
        \"ARCHIVED\",\
        \"DISABLED\"\
      ]\
    },\
    \"Days\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The number of days to retain the log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 2192, 2557, 2922, 3288, and 3653.</p> <p>To set a log group so that its log events do not expire, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteRetentionPolicy.html\\\">DeleteRetentionPolicy</a>. </p>\"\
    },\
    \"DefaultValue\":{\"type\":\"double\"},\
    \"DeleteDataProtectionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupIdentifier\"],\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The name or ARN of the log group that you want to delete the data protection policy for.</p>\"\
        }\
      }\
    },\
    \"DeleteDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"destinationName\"],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The name of the destination.</p>\"\
        }\
      }\
    },\
    \"DeleteLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"DeleteLogStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        }\
      }\
    },\
    \"DeleteMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the metric filter.</p>\"\
        }\
      }\
    },\
    \"DeleteQueryDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryDefinitionId\"],\
      \"members\":{\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID of the query definition that you want to delete. You can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html\\\">DescribeQueryDefinitions</a> to retrieve the IDs of your saved query definitions.</p>\"\
        }\
      }\
    },\
    \"DeleteQueryDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"success\":{\
          \"shape\":\"Success\",\
          \"documentation\":\"<p>A value of TRUE indicates that the operation succeeded. FALSE indicates that the operation failed.</p>\"\
        }\
      }\
    },\
    \"DeleteResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to be revoked. This parameter is required.</p>\"\
        }\
      }\
    },\
    \"DeleteRetentionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"DeleteSubscriptionFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the subscription filter.</p>\"\
        }\
      }\
    },\
    \"Descending\":{\"type\":\"boolean\"},\
    \"DescribeDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DestinationNamePrefix\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default maximum value of 50 items is used.</p>\"\
        }\
      }\
    },\
    \"DescribeDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinations\":{\
          \"shape\":\"Destinations\",\
          \"documentation\":\"<p>The destinations.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeExportTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task. Specifying a task ID filters the results to one or zero export tasks.</p>\"\
        },\
        \"statusCode\":{\
          \"shape\":\"ExportTaskStatusCode\",\
          \"documentation\":\"<p>The status code of the export task. Specifying a status code filters the results to zero or more export tasks.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeExportTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"exportTasks\":{\
          \"shape\":\"ExportTasks\",\
          \"documentation\":\"<p>The export tasks.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"DescribeLogGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"accountIdentifiers\":{\
          \"shape\":\"AccountIds\",\
          \"documentation\":\"<p>When <code>includeLinkedAccounts</code> is set to <code>True</code>, use this parameter to specify the list of accounts to search. You can specify as many as 20 account IDs in the array. </p>\"\
        },\
        \"logGroupNamePrefix\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The prefix to match.</p> <note> <p> <code>logGroupNamePrefix</code> and <code>logGroupNamePattern</code> are mutually exclusive. Only one of these parameters can be passed. </p> </note>\"\
        },\
        \"logGroupNamePattern\":{\
          \"shape\":\"LogGroupNamePattern\",\
          \"documentation\":\"<p>If you specify a string for this parameter, the operation returns only log groups that have names that match the string based on a case-sensitive substring search. For example, if you specify <code>Foo</code>, log groups named <code>FooBar</code>, <code>aws/Foo</code>, and <code>GroupFoo</code> would match, but <code>foo</code>, <code>F/o/o</code> and <code>Froo</code> would not match.</p> <note> <p> <code>logGroupNamePattern</code> and <code>logGroupNamePrefix</code> are mutually exclusive. Only one of these parameters can be passed. </p> </note>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        },\
        \"includeLinkedAccounts\":{\
          \"shape\":\"IncludeLinkedAccounts\",\
          \"documentation\":\"<p>If you are using a monitoring account, set this to <code>True</code> to have the operation return log groups in the accounts listed in <code>accountIdentifiers</code>.</p> <p>If this parameter is set to <code>true</code> and <code>accountIdentifiers</code> contains a null value, the operation returns all log groups in the monitoring account and all log groups in all source accounts that are linked to the monitoring account. </p> <note> <p> If you specify <code>includeLinkedAccounts</code> in your request, then <code>metricFilterCount</code>, <code>retentionInDays</code>, and <code>storedBytes</code> are not included in the response. </p> </note>\"\
        }\
      }\
    },\
    \"DescribeLogGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroups\":{\
          \"shape\":\"LogGroups\",\
          \"documentation\":\"<p>The log groups.</p> <p>If the <code>retentionInDays</code> value is not included for a log group, then that log group's events do not expire.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeLogStreamsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The prefix to match.</p> <p>If <code>orderBy</code> is <code>LastEventTime</code>, you cannot specify this parameter.</p>\"\
        },\
        \"orderBy\":{\
          \"shape\":\"OrderBy\",\
          \"documentation\":\"<p>If the value is <code>LogStreamName</code>, the results are ordered by log stream name. If the value is <code>LastEventTime</code>, the results are ordered by the event time. The default value is <code>LogStreamName</code>.</p> <p>If you order the results by event time, you cannot specify the <code>logStreamNamePrefix</code> parameter.</p> <p> <code>lastEventTimestamp</code> represents the time of the most recent log event in the log stream in CloudWatch Logs. This number is expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. <code>lastEventTimestamp</code> updates on an eventual consistency basis. It typically updates in less than an hour from ingestion, but in rare situations might take longer.</p>\"\
        },\
        \"descending\":{\
          \"shape\":\"Descending\",\
          \"documentation\":\"<p>If the value is true, results are returned in descending order. If the value is to false, results are returned in ascending order. The default value is false.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeLogStreamsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreams\":{\
          \"shape\":\"LogStreams\",\
          \"documentation\":\"<p>The log streams.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeMetricFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterNamePrefix\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The prefix to match. CloudWatch Logs uses the value that you set here only if you also include the <code>logGroupName</code> parameter in your request.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>Filters results to include only those with the specified metric name. If you include this parameter in your request, you must also include the <code>metricNamespace</code> parameter.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>Filters results to include only those in the specified namespace. If you include this parameter in your request, you must also include the <code>metricName</code> parameter.</p>\"\
        }\
      }\
    },\
    \"DescribeMetricFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricFilters\":{\
          \"shape\":\"MetricFilters\",\
          \"documentation\":\"<p>The metric filters.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueriesMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"DescribeQueriesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>Limits the returned queries to only those for the specified log group.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"QueryStatus\",\
          \"documentation\":\"<p>Limits the returned queries to only those that have the specified status. Valid values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, and <code>Scheduled</code>.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"DescribeQueriesMaxResults\",\
          \"documentation\":\"<p>Limits the number of returned queries to the specified number.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queries\":{\
          \"shape\":\"QueryInfoList\",\
          \"documentation\":\"<p>The list of queries that match the request.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueryDefinitionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitionNamePrefix\":{\
          \"shape\":\"QueryDefinitionName\",\
          \"documentation\":\"<p>Use this parameter to filter your results to only the query definitions that have names that start with the prefix you specify.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"QueryListMaxResults\",\
          \"documentation\":\"<p>Limits the number of returned query definitions to the specified number.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueryDefinitionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitions\":{\
          \"shape\":\"QueryDefinitionList\",\
          \"documentation\":\"<p>The list of query definitions that match your request.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeResourcePoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\"shape\":\"NextToken\"},\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of resource policies to be displayed with one call of this API.</p>\"\
        }\
      }\
    },\
    \"DescribeResourcePoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourcePolicies\":{\
          \"shape\":\"ResourcePolicies\",\
          \"documentation\":\"<p>The resource policies that exist in this account.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeSubscriptionFiltersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterNamePrefix\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeSubscriptionFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"subscriptionFilters\":{\
          \"shape\":\"SubscriptionFilters\",\
          \"documentation\":\"<p>The subscription filters.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The name of the destination.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the physical target where the log events are delivered (for example, a Kinesis stream).</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>A role for impersonation, used when delivering log events to the target.</p>\"\
        },\
        \"accessPolicy\":{\
          \"shape\":\"AccessPolicy\",\
          \"documentation\":\"<p>An IAM policy document that governs which Amazon Web Services accounts can create subscription filters against this destination.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of this destination.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the destination, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a cross-account destination that receives subscription log events.</p>\"\
    },\
    \"DestinationArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"DestinationName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"Destinations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Destination\"}\
    },\
    \"Dimensions\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"DimensionsKey\"},\
      \"value\":{\"shape\":\"DimensionsValue\"}\
    },\
    \"DimensionsKey\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DimensionsValue\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DisassociateKmsKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"Distribution\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The method used to distribute log data to the destination, which can be either random or grouped by log stream.</p>\",\
      \"enum\":[\
        \"Random\",\
        \"ByLogStream\"\
      ]\
    },\
    \"EventId\":{\"type\":\"string\"},\
    \"EventMessage\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"EventNumber\":{\"type\":\"long\"},\
    \"EventsLimit\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"ExportDestinationBucket\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportDestinationPrefix\":{\"type\":\"string\"},\
    \"ExportTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        },\
        \"taskName\":{\
          \"shape\":\"ExportTaskName\",\
          \"documentation\":\"<p>The name of the export task.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group from which logs data was exported.</p>\"\
        },\
        \"from\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not exported.</p>\"\
        },\
        \"to\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not exported.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"ExportDestinationBucket\",\
          \"documentation\":\"<p>The name of the S3 bucket to which the log data was exported.</p>\"\
        },\
        \"destinationPrefix\":{\
          \"shape\":\"ExportDestinationPrefix\",\
          \"documentation\":\"<p>The prefix that was used as the start of Amazon S3 key for every object exported.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ExportTaskStatus\",\
          \"documentation\":\"<p>The status of the export task.</p>\"\
        },\
        \"executionInfo\":{\
          \"shape\":\"ExportTaskExecutionInfo\",\
          \"documentation\":\"<p>Execution information about the export task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an export task.</p>\"\
    },\
    \"ExportTaskExecutionInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the export task, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"completionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The completion time of the export task, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of an export task.</p>\"\
    },\
    \"ExportTaskId\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportTaskName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportTaskStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\
          \"shape\":\"ExportTaskStatusCode\",\
          \"documentation\":\"<p>The status code of the export task.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"ExportTaskStatusMessage\",\
          \"documentation\":\"<p>The status message related to the status code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of an export task.</p>\"\
    },\
    \"ExportTaskStatusCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CANCELLED\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"PENDING\",\
        \"PENDING_CANCEL\",\
        \"RUNNING\"\
      ]\
    },\
    \"ExportTaskStatusMessage\":{\"type\":\"string\"},\
    \"ExportTasks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExportTask\"}\
    },\
    \"ExtractedValues\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Token\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"Field\":{\"type\":\"string\"},\
    \"FilterCount\":{\"type\":\"integer\"},\
    \"FilterLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group to search.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view log events from. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logStreamNames\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>Filters the results to only logs from the log streams in this list.</p> <p>If you specify a value for both <code>logStreamNamePrefix</code> and <code>logStreamNames</code>, the action returns an <code>InvalidParameterException</code> error.</p>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>Filters the results to include only events from log streams that have names starting with this prefix.</p> <p>If you specify a value for both <code>logStreamNamePrefix</code> and <code>logStreamNames</code>, but the value for <code>logStreamNamePrefix</code> does not match any log stream names specified in <code>logStreamNames</code>, the action returns an <code>InvalidParameterException</code> error.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not returned.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not returned.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>The filter pattern to use. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html\\\">Filter and Pattern Syntax</a>.</p> <p>If not provided, all the events are matched.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of events to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of events to return. The default is 10,000 events.</p>\"\
        },\
        \"interleaved\":{\
          \"shape\":\"Interleaved\",\
          \"documentation\":\"<p>If the value is true, the operation attempts to provide responses that contain events from multiple log streams within the log group, interleaved in a single response. If the value is false, all the matched log events in the first log stream are searched first, then those in the next log stream, and so on.</p> <p> <b>Important</b> As of June 17, 2019, this parameter is ignored and the value is assumed to be true. The response from this operation always interleaves events from multiple log streams within a log group.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Starting on June 17, 2019, this parameter will be ignored and the value will be assumed to be true. The response from this operation will always interleave events from multiple log streams within a log group.\"\
        },\
        \"unmask\":{\
          \"shape\":\"Unmask\",\
          \"documentation\":\"<p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p> <p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>\"\
        }\
      }\
    },\
    \"FilterLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"events\":{\
          \"shape\":\"FilteredLogEvents\",\
          \"documentation\":\"<p>The matched events.</p>\"\
        },\
        \"searchedLogStreams\":{\
          \"shape\":\"SearchedLogStreams\",\
          \"documentation\":\"<p> <b>Important</b> As of May 15, 2020, this parameter is no longer supported. This parameter returns an empty list.</p> <p>Indicates which log streams have been searched and whether each has been searched completely.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. The token expires after 24 hours.</p>\"\
        }\
      }\
    },\
    \"FilterName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"FilterPattern\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A symbolic description of how CloudWatch Logs should interpret the data in each log event. For example, a log event can contain timestamps, IP addresses, strings, and so on. You use the filter pattern to specify what to look for in the log event message.</p>\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"FilteredLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream to which this event belongs.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The data contained in the log event.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event was ingested, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"eventId\":{\
          \"shape\":\"EventId\",\
          \"documentation\":\"<p>The ID of the event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a matched event.</p>\"\
    },\
    \"FilteredLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilteredLogEvent\"}\
    },\
    \"ForceUpdate\":{\"type\":\"boolean\"},\
    \"GetDataProtectionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupIdentifier\"],\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The name or ARN of the log group that contains the data protection policy that you want to see.</p>\"\
        }\
      }\
    },\
    \"GetDataProtectionPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The log group name or ARN that you specified in your request.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"DataProtectionPolicyDocument\",\
          \"documentation\":\"<p>The data protection policy document for this log group.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this policy was most recently updated.</p>\"\
        }\
      }\
    },\
    \"GetLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logStreamName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view events from. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to this time or later than this time are included. Events with a timestamp earlier than this time are not included.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to or later than this time are not included.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of log events returned. If you don't specify a limit, the default is as many log events as can fit in a response size of 1 MB (up to 10,000 log events).</p>\"\
        },\
        \"startFromHead\":{\
          \"shape\":\"StartFromHead\",\
          \"documentation\":\"<p>If the value is true, the earliest log events are returned first. If the value is false, the latest log events are returned first. The default value is false.</p> <p>If you are using a previous <code>nextForwardToken</code> value as the <code>nextToken</code> in this operation, you must specify <code>true</code> for <code>startFromHead</code>.</p>\"\
        },\
        \"unmask\":{\
          \"shape\":\"Unmask\",\
          \"documentation\":\"<p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p> <p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>\"\
        }\
      }\
    },\
    \"GetLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"events\":{\
          \"shape\":\"OutputLogEvents\",\
          \"documentation\":\"<p>The events.</p>\"\
        },\
        \"nextForwardToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items in the forward direction. The token expires after 24 hours. If you have reached the end of the stream, it returns the same token you passed in.</p>\"\
        },\
        \"nextBackwardToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items in the backward direction. The token expires after 24 hours. This token is not null. If you have reached the end of the stream, it returns the same token you passed in.</p>\"\
        }\
      }\
    },\
    \"GetLogGroupFieldsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group to search.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"time\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time to set as the center of the query. If you specify <code>time</code>, the 15 minutes before this time are queries. If you omit <code>time</code>, the 8 minutes before and 8 minutes after this time are searched.</p> <p>The <code>time</code> value is specified as epoch time, which is the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view. If the log group is in a source account and you are using a monitoring account, you must specify the ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        }\
      }\
    },\
    \"GetLogGroupFieldsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupFields\":{\
          \"shape\":\"LogGroupFieldList\",\
          \"documentation\":\"<p>The array of fields found in the query. Each object in the array contains the name of the field, along with the percentage of time it appeared in the log events that were queried.</p>\"\
        }\
      }\
    },\
    \"GetLogRecordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logRecordPointer\"],\
      \"members\":{\
        \"logRecordPointer\":{\
          \"shape\":\"LogRecordPointer\",\
          \"documentation\":\"<p>The pointer corresponding to the log event record you want to retrieve. You get this from the response of a <code>GetQueryResults</code> operation. In that response, the value of the <code>@ptr</code> field for a log event is the value to use as <code>logRecordPointer</code> to retrieve that complete log event record.</p>\"\
        },\
        \"unmask\":{\
          \"shape\":\"Unmask\",\
          \"documentation\":\"<p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p> <p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>\"\
        }\
      }\
    },\
    \"GetLogRecordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logRecord\":{\
          \"shape\":\"LogRecord\",\
          \"documentation\":\"<p>The requested log event, as a JSON string.</p>\"\
        }\
      }\
    },\
    \"GetQueryResultsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryId\"],\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID number of the query.</p>\"\
        }\
      }\
    },\
    \"GetQueryResultsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"results\":{\
          \"shape\":\"QueryResults\",\
          \"documentation\":\"<p>The log events that matched the query criteria during the most recent time it ran.</p> <p>The <code>results</code> value is an array of arrays. Each log event is one object in the top-level array. Each of these log event objects is an array of <code>field</code>/<code>value</code> pairs.</p>\"\
        },\
        \"statistics\":{\
          \"shape\":\"QueryStatistics\",\
          \"documentation\":\"<p>Includes the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned. These values reflect the full raw results of the query.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"QueryStatus\",\
          \"documentation\":\"<p>The status of the most recent running of the query. Possible values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, <code>Scheduled</code>, <code>Timeout</code>, and <code>Unknown</code>.</p> <p>Queries time out after 15 minutes of runtime. To avoid having your queries time out, reduce the time range being searched or partition your query into a number of queries.</p>\"\
        }\
      }\
    },\
    \"IncludeLinkedAccounts\":{\"type\":\"boolean\"},\
    \"InputLogEvent\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"timestamp\",\
        \"message\"\
      ],\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The raw event message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log event, which is a record of activity that was recorded by the application or resource being monitored.</p>\"\
    },\
    \"InputLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InputLogEvent\"},\
      \"max\":10000,\
      \"min\":1\
    },\
    \"InputLogStreamNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogStreamName\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"Interleaved\":{\"type\":\"boolean\"},\
    \"InvalidOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The operation is not valid on the specified resource.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A parameter is specified incorrectly.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSequenceTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expectedSequenceToken\":{\"shape\":\"SequenceToken\"}\
      },\
      \"documentation\":\"<p>The sequence token is not valid. You can get the correct sequence token in the <code>expectedSequenceToken</code> field in the <code>InvalidSequenceTokenException</code> message. </p> <important> <p> <code>PutLogEvents</code> actions are now always accepted and never return <code>InvalidSequenceTokenException</code> regardless of receiving an invalid sequence token. </p> </important>\",\
      \"exception\":true\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You have reached the maximum number of resources that can be created.</p>\",\
      \"exception\":true\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArn\"],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the resource that you want to view tags for.</p> <p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i> </code> </p> <p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i> </code> </p> <p>For more information about ARN format, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html\\\">CloudWatch Logs resources and operations</a>.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of tags associated with the requested resource.&gt;</p>\"\
        }\
      }\
    },\
    \"ListTagsLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model ListTagsForResourceRequest and ListTagsForResourceResponse\"\
    },\
    \"ListTagsLogGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags for the log group.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model ListTagsForResourceRequest and ListTagsForResourceResponse\"\
    },\
    \"LogEventIndex\":{\"type\":\"integer\"},\
    \"LogGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the log group, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"retentionInDays\":{\"shape\":\"Days\"},\
        \"metricFilterCount\":{\
          \"shape\":\"FilterCount\",\
          \"documentation\":\"<p>The number of metric filters.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log group.</p>\"\
        },\
        \"storedBytes\":{\
          \"shape\":\"StoredBytes\",\
          \"documentation\":\"<p>The number of bytes stored.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data.</p>\"\
        },\
        \"dataProtectionStatus\":{\
          \"shape\":\"DataProtectionStatus\",\
          \"documentation\":\"<p>Displays whether this log group has a protection policy, or whether it had one in the past. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html\\\">PutDataProtectionPolicy</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log group.</p>\"\
    },\
    \"LogGroupField\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"Field\",\
          \"documentation\":\"<p>The name of a log field.</p>\"\
        },\
        \"percent\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of log events queried that contained the field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The fields contained in log events found by a <code>GetLogGroupFields</code> operation, along with the percentage of queried log events in which each field appears.</p>\"\
    },\
    \"LogGroupFieldList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupField\"}\
    },\
    \"LogGroupIdentifier\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\w#+=/:,.@-]*\"\
    },\
    \"LogGroupIdentifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupIdentifier\"}\
    },\
    \"LogGroupName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]+\"\
    },\
    \"LogGroupNamePattern\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]*\"\
    },\
    \"LogGroupNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupName\"}\
    },\
    \"LogGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroup\"}\
    },\
    \"LogRecord\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Field\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"LogRecordPointer\":{\"type\":\"string\"},\
    \"LogStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the stream, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"firstEventTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time of the first event, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"lastEventTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time of the most recent log event in the log stream in CloudWatch Logs. This number is expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. The <code>lastEventTime</code> value updates on an eventual consistency basis. It typically updates in less than an hour from ingestion, but in rare situations might take longer.</p>\"\
        },\
        \"lastIngestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The ingestion time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code> The <code>lastIngestionTime</code> value updates on an eventual consistency basis. It typically updates in less than an hour after ingestion, but in rare situations might take longer.</p>\"\
        },\
        \"uploadSequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The sequence token.</p> <important> <p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted regardless of receiving an invalid sequence token. You don't need to obtain <code>uploadSequenceToken</code> to use a <code>PutLogEvents</code> action.</p> </important>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log stream.</p>\"\
        },\
        \"storedBytes\":{\
          \"shape\":\"StoredBytes\",\
          \"documentation\":\"<p>The number of bytes stored.</p> <p> <b>Important:</b> As of June 17, 2019, this parameter is no longer supported for log streams, and is always reported as zero. This change applies only to log streams. The <code>storedBytes</code> parameter for log groups is not affected.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Starting on June 17, 2019, this parameter will be deprecated for log streams, and will be reported as zero. This change applies only to log streams. The storedBytes parameter for log groups is not affected.\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log stream, which is a sequence of log events from a single emitter of logs.</p>\"\
    },\
    \"LogStreamName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"LogStreamSearchedCompletely\":{\"type\":\"boolean\"},\
    \"LogStreams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogStream\"}\
    },\
    \"MalformedQueryException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryCompileError\":{\"shape\":\"QueryCompileError\"}\
      },\
      \"documentation\":\"<p>The query string is not valid. Details about this error are displayed in a <code>QueryCompileError</code> object. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_QueryCompileError.html\\\">QueryCompileError</a>.</p> <p>For more information about valid query syntax, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\",\
      \"exception\":true\
    },\
    \"Message\":{\"type\":\"string\"},\
    \"MetricFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the metric filter.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"metricTransformations\":{\
          \"shape\":\"MetricTransformations\",\
          \"documentation\":\"<p>The metric transformations.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the metric filter, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metric filters express how CloudWatch Logs would extract metric observations from ingested log events and transform them into metric data in a CloudWatch metric.</p>\"\
    },\
    \"MetricFilterMatchRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"eventNumber\":{\
          \"shape\":\"EventNumber\",\
          \"documentation\":\"<p>The event number.</p>\"\
        },\
        \"eventMessage\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The raw event data.</p>\"\
        },\
        \"extractedValues\":{\
          \"shape\":\"ExtractedValues\",\
          \"documentation\":\"<p>The values extracted from the event data by the filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a matched event.</p>\"\
    },\
    \"MetricFilterMatches\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilterMatchRecord\"}\
    },\
    \"MetricFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilter\"}\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of the CloudWatch metric to which the monitored log information should be published. For example, you might publish to a metric named ErrorCount.</p>\",\
      \"max\":255,\
      \"pattern\":\"[^:*$]*\"\
    },\
    \"MetricNamespace\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"[^:*$]*\"\
    },\
    \"MetricTransformation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"metricNamespace\",\
        \"metricValue\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the CloudWatch metric.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>A custom namespace to contain your metric in CloudWatch. Use namespaces to group together metrics that are similar. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace\\\">Namespaces</a>.</p>\"\
        },\
        \"metricValue\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value to publish to the CloudWatch metric when a filter pattern matches a log event.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"DefaultValue\",\
          \"documentation\":\"<p>(Optional) The value to emit when a filter pattern does not match a log event. This value can be null.</p>\"\
        },\
        \"dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The fields to use as dimensions for the metric. One metric filter can include as many as three dimensions.</p> <important> <p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p> <p>CloudWatch Logs disables a metric filter if it generates 1000 different name/value pairs for your specified dimensions within a certain amount of time. This helps to prevent accidental high charges.</p> <p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html\\\"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p> </important>\"\
        },\
        \"unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit to assign to the metric. If you omit this, the unit is set as <code>None</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates how to transform ingested log events to metric data in a CloudWatch metric.</p>\"\
    },\
    \"MetricTransformations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricTransformation\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"MetricValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The value to publish to the CloudWatch metric. For example, if you're counting the occurrences of a term like <code>Error</code>, the value is <code>1</code> for each occurrence. If you're counting the bytes transferred, the value is the value in the log event.</p>\",\
      \"max\":100\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The token for the next set of items to return. The token expires after 24 hours.</p>\",\
      \"min\":1\
    },\
    \"OperationAbortedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Multiple concurrent requests to update the same resource were in conflict.</p>\",\
      \"exception\":true\
    },\
    \"OrderBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LogStreamName\",\
        \"LastEventTime\"\
      ]\
    },\
    \"OutputLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The data contained in the log event.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event was ingested, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log event.</p>\"\
    },\
    \"OutputLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OutputLogEvent\"}\
    },\
    \"Percentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"PolicyDocument\":{\
      \"type\":\"string\",\
      \"max\":5120,\
      \"min\":1\
    },\
    \"PolicyName\":{\"type\":\"string\"},\
    \"PutDataProtectionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupIdentifier\",\
        \"policyDocument\"\
      ],\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the log group name or log group ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"DataProtectionPolicyDocument\",\
          \"documentation\":\"<p>Specify the data protection policy, in JSON.</p> <p>This policy must include two JSON blocks:</p> <ul> <li> <p>The first block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Audit</code> action. The <code>DataIdentifer</code> array lists the types of sensitive data that you want to mask. For more information about the available options, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html\\\">Types of data that you can mask</a>.</p> <p>The <code>Operation</code> property with an <code>Audit</code> action is required to find the sensitive data terms. This <code>Audit</code> action must contain a <code>FindingsDestination</code> object. You can optionally use that <code>FindingsDestination</code> object to list one or more destinations to send audit findings to. If you specify destinations such as log groups, Kinesis Data Firehose streams, and S3 buckets, they must already exist.</p> </li> <li> <p>The second block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Deidentify</code> action. The <code>DataIdentifer</code> array must exactly match the <code>DataIdentifer</code> array in the first block of the policy.</p> <p>The <code>Operation</code> property with the <code>Deidentify</code> action is what actually masks the data, and it must contain the <code> \\\"MaskConfig\\\": {}</code> object. The <code> \\\"MaskConfig\\\": {}</code> object must be empty.</p> </li> </ul> <p>For an example data protection policy, see the <b>Examples</b> section on this page.</p> <important> <p>The contents of two <code>DataIdentifer</code> arrays must match exactly.</p> </important>\"\
        }\
      }\
    },\
    \"PutDataProtectionPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The log group name or ARN that you specified in your request.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"DataProtectionPolicyDocument\",\
          \"documentation\":\"<p>The data protection policy used for this log group.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this policy was most recently updated.</p>\"\
        }\
      }\
    },\
    \"PutDestinationPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationName\",\
        \"accessPolicy\"\
      ],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>A name for an existing destination.</p>\"\
        },\
        \"accessPolicy\":{\
          \"shape\":\"AccessPolicy\",\
          \"documentation\":\"<p>An IAM policy document that authorizes cross-account users to deliver their log events to the associated destination. This can be up to 5120 bytes.</p>\"\
        },\
        \"forceUpdate\":{\
          \"shape\":\"ForceUpdate\",\
          \"documentation\":\"<p>Specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual AWS accounts. Before you update a destination policy this way, you must first update the subscription filters in the accounts that send logs to this destination. If you do not, the subscription filters might stop working. By specifying <code>true</code> for <code>forceUpdate</code>, you are affirming that you have already updated the subscription filters. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Cross-Account-Log_Subscription-Update.html\\\"> Updating an existing cross-account subscription</a> </p> <p>If you omit this parameter, the default of <code>false</code> is used.</p>\"\
        }\
      }\
    },\
    \"PutDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationName\",\
        \"targetArn\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>A name for the destination.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The ARN of an Amazon Kinesis stream to which to deliver matching log events.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants CloudWatch Logs permissions to call the Amazon Kinesis <code>PutRecord</code> operation on the destination stream.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An optional list of key-value pairs to associate with the resource.</p> <p>For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> </p>\"\
        }\
      }\
    },\
    \"PutDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>The destination.</p>\"\
        }\
      }\
    },\
    \"PutLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\",\
        \"logEvents\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"logEvents\":{\
          \"shape\":\"InputLogEvents\",\
          \"documentation\":\"<p>The log events.</p>\"\
        },\
        \"sequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The sequence token obtained from the response of the previous <code>PutLogEvents</code> call.</p> <important> <p>The <code>sequenceToken</code> parameter is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are now accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid.</p> </important>\"\
        }\
      }\
    },\
    \"PutLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextSequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The next sequence token.</p> <important> <p>This field has been deprecated.</p> <p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream and you do not need to wait for the response of a previous <code>PutLogEvents</code> action to obtain the <code>nextSequenceToken</code> value.</p> </important>\"\
        },\
        \"rejectedLogEventsInfo\":{\
          \"shape\":\"RejectedLogEventsInfo\",\
          \"documentation\":\"<p>The rejected events.</p>\"\
        }\
      }\
    },\
    \"PutMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\",\
        \"filterPattern\",\
        \"metricTransformations\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>A name for the metric filter.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>A filter pattern for extracting metric data out of ingested log events.</p>\"\
        },\
        \"metricTransformations\":{\
          \"shape\":\"MetricTransformations\",\
          \"documentation\":\"<p>A collection of information that defines how metric data gets emitted.</p>\"\
        }\
      }\
    },\
    \"PutQueryDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"queryString\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"QueryDefinitionName\",\
          \"documentation\":\"<p>A name for the query definition. If you are saving numerous query definitions, we recommend that you name them. This way, you can find the ones you want by using the first part of the name as a filter in the <code>queryDefinitionNamePrefix</code> parameter of <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html\\\">DescribeQueryDefinitions</a>.</p>\"\
        },\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>If you are updating a query definition, use this parameter to specify the ID of the query definition that you want to update. You can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html\\\">DescribeQueryDefinitions</a> to retrieve the IDs of your saved query definitions.</p> <p>If you are creating a query definition, do not specify this parameter. CloudWatch generates a unique ID for the new query definition and include it in the response to this operation.</p>\"\
        },\
        \"logGroupNames\":{\
          \"shape\":\"LogGroupNames\",\
          \"documentation\":\"<p>Use this parameter to include specific log groups as part of your query definition.</p> <p>If you are updating a query definition and you omit this parameter, then the updated definition will contain no log groups.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryDefinitionString\",\
          \"documentation\":\"<p>The query string to use for this definition. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\"\
        }\
      }\
    },\
    \"PutQueryDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID of the query definition.</p>\"\
        }\
      }\
    },\
    \"PutResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>Name of the new policy. This parameter is required.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>Details of the new policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. This parameter is required.</p> <p>The following example creates a resource policy enabling the Route 53 service to put DNS query logs in to the specified log group. Replace <code>\\\"logArn\\\"</code> with the ARN of your CloudWatch Logs resource, such as a log group or log stream.</p> <p>CloudWatch Logs also supports <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn\\\">aws:SourceArn</a> and <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount\\\">aws:SourceAccount</a> condition context keys.</p> <p>In the example resource policy, you would replace the value of <code>SourceArn</code> with the resource making the call from RouteÂ 53 to CloudWatch Logs. You would also replace the value of <code>SourceAccount</code> with the Amazon Web Services account ID making that call.</p> <p/> <p> <code>{ \\\"Version\\\": \\\"2012-10-17\\\", \\\"Statement\\\": [ { \\\"Sid\\\": \\\"Route53LogsToCloudWatchLogs\\\", \\\"Effect\\\": \\\"Allow\\\", \\\"Principal\\\": { \\\"Service\\\": [ \\\"route53.amazonaws.com\\\" ] }, \\\"Action\\\": \\\"logs:PutLogEvents\\\", \\\"Resource\\\": \\\"logArn\\\", \\\"Condition\\\": { \\\"ArnLike\\\": { \\\"aws:SourceArn\\\": \\\"myRoute53ResourceArn\\\" }, \\\"StringEquals\\\": { \\\"aws:SourceAccount\\\": \\\"myAwsAccountId\\\" } } } ] }</code> </p>\"\
        }\
      }\
    },\
    \"PutResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourcePolicy\":{\
          \"shape\":\"ResourcePolicy\",\
          \"documentation\":\"<p>The new policy.</p>\"\
        }\
      }\
    },\
    \"PutRetentionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"retentionInDays\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"retentionInDays\":{\"shape\":\"Days\"}\
      }\
    },\
    \"PutSubscriptionFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\",\
        \"filterPattern\",\
        \"destinationArn\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>A name for the subscription filter. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. To find the name of the filter currently associated with a log group, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeSubscriptionFilters.html\\\">DescribeSubscriptionFilters</a>.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>A filter pattern for subscribing to a filtered stream of log events.</p>\"\
        },\
        \"destinationArn\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The ARN of the destination to deliver matching log events to. Currently, the supported destinations are:</p> <ul> <li> <p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A logical destination (specified using an ARN) belonging to a different account, for cross-account delivery.</p> <p>If you're setting up a cross-account subscription, the destination must have an IAM policy associated with it. The IAM policy must allow the sender to send logs to the destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html\\\">PutDestinationPolicy</a>.</p> </li> <li> <p>A Kinesis Data Firehose delivery stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A Lambda function belonging to the same account as the subscription filter, for same-account delivery.</p> </li> </ul>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream. You don't need to provide the ARN when you are working with a logical destination for cross-account delivery.</p>\"\
        },\
        \"distribution\":{\
          \"shape\":\"Distribution\",\
          \"documentation\":\"<p>The method used to distribute log data to the destination. By default, log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis data stream. </p>\"\
        }\
      }\
    },\
    \"QueryCharOffset\":{\"type\":\"integer\"},\
    \"QueryCompileError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"location\":{\
          \"shape\":\"QueryCompileErrorLocation\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reserved.</p>\"\
    },\
    \"QueryCompileErrorLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"startCharOffset\":{\
          \"shape\":\"QueryCharOffset\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"endCharOffset\":{\
          \"shape\":\"QueryCharOffset\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reserved.</p>\"\
    },\
    \"QueryDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The unique ID of the query definition.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"QueryDefinitionName\",\
          \"documentation\":\"<p>The name of the query definition.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryDefinitionString\",\
          \"documentation\":\"<p>The query string to use for this definition. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\"\
        },\
        \"lastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the query definition was most recently modified.</p>\"\
        },\
        \"logGroupNames\":{\
          \"shape\":\"LogGroupNames\",\
          \"documentation\":\"<p>If this query definition contains a list of log groups that it is limited to, that list appears here.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains details about a saved CloudWatch Logs Insights query definition.</p>\"\
    },\
    \"QueryDefinitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueryDefinition\"}\
    },\
    \"QueryDefinitionName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"QueryDefinitionString\":{\
      \"type\":\"string\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"QueryId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"QueryInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The unique ID number of this query.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The query string used in this query.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"QueryStatus\",\
          \"documentation\":\"<p>The status of this query. Possible values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, <code>Scheduled</code>, and <code>Unknown</code>.</p>\"\
        },\
        \"createTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this query was created.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group scanned by this query.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about one CloudWatch Logs Insights query that matches the request in a <code>DescribeQueries</code> operation. </p>\"\
    },\
    \"QueryInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueryInfo\"}\
    },\
    \"QueryListMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"QueryResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResultRows\"}\
    },\
    \"QueryStatistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"recordsMatched\":{\
          \"shape\":\"StatsValue\",\
          \"documentation\":\"<p>The number of log events that matched the query string.</p>\"\
        },\
        \"recordsScanned\":{\
          \"shape\":\"StatsValue\",\
          \"documentation\":\"<p>The total number of log events scanned during the query.</p>\"\
        },\
        \"bytesScanned\":{\
          \"shape\":\"StatsValue\",\
          \"documentation\":\"<p>The total number of bytes in the log events scanned during the query.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned.</p>\"\
    },\
    \"QueryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Scheduled\",\
        \"Running\",\
        \"Complete\",\
        \"Failed\",\
        \"Cancelled\",\
        \"Timeout\",\
        \"Unknown\"\
      ]\
    },\
    \"QueryString\":{\
      \"type\":\"string\",\
      \"max\":10000,\
      \"min\":0\
    },\
    \"RejectedLogEventsInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tooNewLogEventStartIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The log events that are too new.</p>\"\
        },\
        \"tooOldLogEventEndIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The log events that are dated too far in the past.</p>\"\
        },\
        \"expiredLogEventEndIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The expired log events.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the rejected events.</p>\"\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource already exists.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource does not exist.</p>\",\
      \"exception\":true\
    },\
    \"ResourcePolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourcePolicy\"}\
    },\
    \"ResourcePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the resource policy.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The details of the policy.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Timestamp showing when this policy was last updated, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A policy enabling one or more entities to put logs to a log group in this account.</p>\"\
    },\
    \"ResultField\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"field\":{\
          \"shape\":\"Field\",\
          \"documentation\":\"<p>The log event field.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The value of this field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains one field from one log event returned by a CloudWatch Logs Insights query, along with the value of that field.</p> <p>For more information about the fields that are generated by CloudWatch logs, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html\\\">Supported Logs and Discovered Fields</a>.</p>\"\
    },\
    \"ResultRows\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResultField\"}\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"SearchedLogStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"searchedCompletely\":{\
          \"shape\":\"LogStreamSearchedCompletely\",\
          \"documentation\":\"<p>Indicates whether all the events in this log stream were searched.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the search status of a log stream.</p>\"\
    },\
    \"SearchedLogStreams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchedLogStream\"}\
    },\
    \"SequenceToken\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The service cannot complete the request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"StandardUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Seconds\",\
        \"Microseconds\",\
        \"Milliseconds\",\
        \"Bytes\",\
        \"Kilobytes\",\
        \"Megabytes\",\
        \"Gigabytes\",\
        \"Terabytes\",\
        \"Bits\",\
        \"Kilobits\",\
        \"Megabits\",\
        \"Gigabits\",\
        \"Terabits\",\
        \"Percent\",\
        \"Count\",\
        \"Bytes/Second\",\
        \"Kilobytes/Second\",\
        \"Megabytes/Second\",\
        \"Gigabytes/Second\",\
        \"Terabytes/Second\",\
        \"Bits/Second\",\
        \"Kilobits/Second\",\
        \"Megabits/Second\",\
        \"Gigabits/Second\",\
        \"Terabits/Second\",\
        \"Count/Second\",\
        \"None\"\
      ]\
    },\
    \"StartFromHead\":{\"type\":\"boolean\"},\
    \"StartQueryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\",\
        \"queryString\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The log group on which to perform the query.</p> <note> <p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code> or <code>logGroupIdentifiers</code>. </p> </note>\"\
        },\
        \"logGroupNames\":{\
          \"shape\":\"LogGroupNames\",\
          \"documentation\":\"<p>The list of log groups to be queried. You can include up to 50 log groups.</p> <note> <p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code> or <code>logGroupIdentifiers</code>. </p> </note>\"\
        },\
        \"logGroupIdentifiers\":{\
          \"shape\":\"LogGroupIdentifiers\",\
          \"documentation\":\"<p>The list of log groups to query. You can include up to 50 log groups.</p> <p>You can specify them by the log group name or ARN. If a log group that you're querying is in a source account and you're using a monitoring account, you must specify the ARN of the log group here. The query definition must also be defined in the monitoring account.</p> <p>If you specify an ARN, the ARN can't end with an asterisk (*).</p> <p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code> or <code>logGroupIdentifiers</code>. </p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The beginning of the time range to query. The range is inclusive, so the specified start time is included in the query. Specified as epoch time, the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range to query. The range is inclusive, so the specified end time is included in the query. Specified as epoch time, the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The query string to use. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of log events to return in the query. If the query string uses the <code>fields</code> command, only the specified fields and their values are returned. The default is 1000.</p>\"\
        }\
      }\
    },\
    \"StartQueryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The unique ID of the query. </p>\"\
        }\
      }\
    },\
    \"StatsValue\":{\"type\":\"double\"},\
    \"StopQueryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryId\"],\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID number of the query to stop. To find this ID number, use <code>DescribeQueries</code>.</p>\"\
        }\
      }\
    },\
    \"StopQueryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"success\":{\
          \"shape\":\"Success\",\
          \"documentation\":\"<p>This is true if the query was stopped by the <code>StopQuery</code> operation.</p>\"\
        }\
      }\
    },\
    \"StoredBytes\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"SubscriptionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the subscription filter.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"destinationArn\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the destination.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p/>\"\
        },\
        \"distribution\":{\"shape\":\"Distribution\"},\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the subscription filter, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a subscription filter.</p>\"\
    },\
    \"SubscriptionFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubscriptionFilter\"}\
    },\
    \"Success\":{\"type\":\"boolean\"},\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]+)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"min\":1\
    },\
    \"TagLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to use for the tags.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model TagResourceRequest\"\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the resource that you're adding tags to.</p> <p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i> </code> </p> <p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i> </code> </p> <p>For more information about ARN format, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html\\\">CloudWatch Logs resources and operations</a>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of key-value pairs to associate with the resource.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"Tags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TargetArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TestEventMessages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventMessage\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TestMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"filterPattern\",\
        \"logEventMessages\"\
      ],\
      \"members\":{\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"logEventMessages\":{\
          \"shape\":\"TestEventMessages\",\
          \"documentation\":\"<p>The log event messages to test.</p>\"\
        }\
      }\
    },\
    \"TestMetricFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"matches\":{\
          \"shape\":\"MetricFilterMatches\",\
          \"documentation\":\"<p>The matched events.</p>\"\
        }\
      }\
    },\
    \"Timestamp\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"Token\":{\"type\":\"string\"},\
    \"TooManyTagsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"Message\"},\
        \"resourceName\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The name of the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A resource can have no more than 50 tags.</p>\",\
      \"exception\":true\
    },\
    \"Unmask\":{\"type\":\"boolean\"},\
    \"UnrecognizedClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The most likely cause is an Amazon Web Services access key ID or secret key that's not valid.</p>\",\
      \"exception\":true\
    },\
    \"UntagLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys. The corresponding tags are removed from the log group.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model UntagResourceRequest\"\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the CloudWatch Logs resource that you're removing tags from.</p> <p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i> </code> </p> <p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i> </code> </p> <p>For more information about ARN format, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html\\\">CloudWatch Logs resources and operations</a>.</p>\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The list of tag keys to remove from the resource.</p>\"\
        }\
      }\
    },\
    \"Value\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<p>You can use Amazon CloudWatch Logs to monitor, store, and access your log files from EC2 instances, CloudTrail, and other sources. You can then retrieve the associated log data from CloudWatch Logs using the CloudWatch console. Alternatively, you can use CloudWatch Logs commands in the Amazon Web Services CLI, CloudWatch Logs API, or CloudWatch Logs SDK.</p> <p>You can use CloudWatch Logs to:</p> <ul> <li> <p> <b>Monitor logs from EC2 instances in real time</b>: You can use CloudWatch Logs to monitor applications and systems using log data. For example, CloudWatch Logs can track the number of errors that occur in your application logs. Then, it can send you a notification whenever the rate of errors exceeds a threshold that you specify. CloudWatch Logs uses your log data for monitoring so no code changes are required. For example, you can monitor application logs for specific literal terms (such as \\\"NullReferenceException\\\"). You can also count the number of occurrences of a literal term at a particular position in log data (such as \\\"404\\\" status codes in an Apache access log). When the term you are searching for is found, CloudWatch Logs reports the data to a CloudWatch metric that you specify.</p> </li> <li> <p> <b>Monitor CloudTrail logged events</b>: You can create alarms in CloudWatch and receive notifications of particular API activity as captured by CloudTrail. You can use the notification to perform troubleshooting.</p> </li> <li> <p> <b>Archive log data</b>: You can use CloudWatch Logs to store your log data in highly durable storage. You can change the log retention setting so that any log events earlier than this setting are automatically deleted. The CloudWatch Logs agent helps to quickly send both rotated and non-rotated log data off of a host and into the log service. You can then access the raw log data when you need it.</p> </li> </ul>\"\
}\
";
}

@end
