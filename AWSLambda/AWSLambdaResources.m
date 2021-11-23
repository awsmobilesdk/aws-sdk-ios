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

#import "AWSLambdaResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLambdaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLambdaResources

+ (instancetype)sharedInstance {
    static AWSLambdaResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLambdaResources new];
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
    \"apiVersion\":\"2015-03-31\",\
    \"endpointPrefix\":\"lambda\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS Lambda\",\
    \"serviceId\":\"Lambda\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"lambda-2015-03-31\"\
  },\
  \"operations\":{\
    \"AddLayerVersionPermission\":{\
      \"name\":\"AddLayerVersionPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"AddLayerVersionPermissionRequest\"},\
      \"output\":{\"shape\":\"AddLayerVersionPermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"PolicyLengthExceededException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Adds permissions to the resource-based policy of a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>. Use this action to grant layer usage permission to other accounts. You can grant permission to a single account, all accounts in an organization, or all Amazon Web Services accounts. </p> <p>To revoke permission, call <a>RemoveLayerVersionPermission</a> with the statement ID that you specified when you added it.</p>\"\
    },\
    \"AddPermission\":{\
      \"name\":\"AddPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"AddPermissionRequest\"},\
      \"output\":{\"shape\":\"AddPermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"PolicyLengthExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Grants an Amazon Web Services service or another account permission to use a function. You can apply the policy at the function level, or specify a qualifier to restrict access to a single version or alias. If you use a qualifier, the invoker must use the full Amazon Resource Name (ARN) of that version or alias to invoke the function. Note: Lambda does not support adding policies to version $LATEST.</p> <p>To grant permission to another account, specify the account ID as the <code>Principal</code>. For Amazon Web Services services, the principal is a domain-style identifier defined by the service, like <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>. For Amazon Web Services services, you can also specify the ARN of the associated resource as the <code>SourceArn</code>. If you grant permission to a service principal without specifying the source, other accounts could potentially configure resources in their account to invoke your Lambda function.</p> <p>This action adds a statement to a resource-based permissions policy for the function. For more information about function policies, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html\\\">Lambda Function Policies</a>. </p>\"\
    },\
    \"CreateAlias\":{\
      \"name\":\"CreateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Creates an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">alias</a> for a Lambda function version. Use aliases to provide clients with a function identifier that you can update to invoke a different version.</p> <p>You can also map an alias to split invocation requests between two versions. Use the <code>RoutingConfig</code> parameter to specify a second version and the percentage of invocation requests that it receives.</p>\"\
    },\
    \"CreateCodeSigningConfig\":{\
      \"name\":\"CreateCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2020-04-22/code-signing-configs/\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"CreateCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Creates a code signing configuration. A <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-trustedcode.html\\\">code signing configuration</a> defines a list of allowed signing profiles and defines the code-signing validation policy (action to be taken if deployment validation checks fail). </p>\"\
    },\
    \"CreateEventSourceMapping\":{\
      \"name\":\"CreateEventSourceMapping\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"CreateEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates a mapping between an event source and an Lambda function. Lambda reads items from the event source and triggers the function.</p> <p>For details about how to configure different event sources, see the following topics. </p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping\\\"> Amazon DynamoDB Streams</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping\\\"> Amazon Kinesis</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource\\\"> Amazon SQS</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping\\\"> Amazon MQ and RabbitMQ</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html\\\"> Amazon MSK</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html\\\"> Apache Kafka</a> </p> </li> </ul> <p>The following error handling options are only available for stream sources (DynamoDB and Kinesis):</p> <ul> <li> <p> <code>BisectBatchOnFunctionError</code> - If the function returns an error, split the batch in two and retry.</p> </li> <li> <p> <code>DestinationConfig</code> - Send discarded records to an Amazon SQS queue or Amazon SNS topic.</p> </li> <li> <p> <code>MaximumRecordAgeInSeconds</code> - Discard records older than the specified age. The default value is infinite (-1). When set to infinite (-1), failed records are retried until the record expires</p> </li> <li> <p> <code>MaximumRetryAttempts</code> - Discard records after the specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed records are retried until the record expires.</p> </li> <li> <p> <code>ParallelizationFactor</code> - Process multiple batches from each shard concurrently.</p> </li> </ul> <p>For information about which configuration parameters apply to each event source, see the following topics.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-ddb-params\\\"> Amazon DynamoDB Streams</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-params\\\"> Amazon Kinesis</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#services-sqs-params\\\"> Amazon SQS</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-params\\\"> Amazon MQ and RabbitMQ</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-parms\\\"> Amazon MSK</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-kafka-parms\\\"> Apache Kafka</a> </p> </li> </ul>\"\
    },\
    \"CreateFunction\":{\
      \"name\":\"CreateFunction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateFunctionRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"},\
        {\"shape\":\"CodeVerificationFailedException\"},\
        {\"shape\":\"InvalidCodeSignatureException\"},\
        {\"shape\":\"CodeSigningConfigNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates a Lambda function. To create a function, you need a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html\\\">deployment package</a> and an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role\\\">execution role</a>. The deployment package is a .zip file archive or container image that contains your function code. The execution role grants the function permission to use Amazon Web Services services, such as Amazon CloudWatch Logs for log streaming and X-Ray for request tracing.</p> <p>You set the package type to <code>Image</code> if the deployment package is a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html\\\">container image</a>. For a container image, the code property must include the URI of a container image in the Amazon ECR registry. You do not need to specify the handler and runtime properties. </p> <p>You set the package type to <code>Zip</code> if the deployment package is a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html#gettingstarted-package-zip\\\">.zip file archive</a>. For a .zip file archive, the code property specifies the location of the .zip file. You must also specify the handler and runtime properties. The code in the deployment package must be compatible with the target instruction set architecture of the function (<code>x86-64</code> or <code>arm64</code>). If you do not specify the architecture, the default value is <code>x86-64</code>.</p> <p>When you create a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute or so. During this time, you can't invoke or modify the function. The <code>State</code>, <code>StateReason</code>, and <code>StateReasonCode</code> fields in the response from <a>GetFunctionConfiguration</a> indicate when the function is ready to invoke. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html\\\">Function States</a>.</p> <p>A function has an unpublished version, and can have published versions and aliases. The unpublished version changes when you update your function's code and configuration. A published version is a snapshot of your function code and configuration that can't be changed. An alias is a named resource that maps to a version, and can be changed to map to a different version. Use the <code>Publish</code> parameter to create version <code>1</code> of your function from its initial configuration.</p> <p>The other parameters let you configure version-specific and function-level settings. You can modify version-specific settings later with <a>UpdateFunctionConfiguration</a>. Function-level settings apply to both the unpublished and published versions of the function, and include tags (<a>TagResource</a>) and per-function concurrency limits (<a>PutFunctionConcurrency</a>).</p> <p>You can use code signing if your deployment package is a .zip file archive. To enable code signing for this function, specify the ARN of a code-signing configuration. When a user attempts to deploy a code package with <a>UpdateFunctionCode</a>, Lambda checks that the code package has a valid signature from a trusted publisher. The code-signing configuration includes set set of signing profiles, which define the trusted publishers for this function.</p> <p>If another account or an Amazon Web Services service invokes your function, use <a>AddPermission</a> to grant permission by creating a resource-based IAM policy. You can grant permissions at the function level, on a version, or on an alias.</p> <p>To invoke your function directly, use <a>Invoke</a>. To invoke your function in response to events in other Amazon Web Services services, create an event source mapping (<a>CreateEventSourceMapping</a>), or configure a function trigger in the other service. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html\\\">Invoking Functions</a>.</p>\"\
    },\
    \"CreateFunctionUrlConfig\":{\
      \"name\":\"CreateFunctionUrlConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2021-10-31/functions/{FunctionName}/url\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateFunctionUrlConfigRequest\"},\
      \"output\":{\"shape\":\"CreateFunctionUrlConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ]\
    },\
    \"DeleteAlias\":{\
      \"name\":\"DeleteAlias\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Lambda function <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">alias</a>.</p>\"\
    },\
    \"DeleteCodeSigningConfig\":{\
      \"name\":\"DeleteCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2020-04-22/code-signing-configs/{CodeSigningConfigArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"DeleteCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes the code signing configuration. You can delete the code signing configuration only if no function is using it. </p>\"\
    },\
    \"DeleteEventSourceMapping\":{\
      \"name\":\"DeleteEventSourceMapping\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"DeleteEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html\\\">event source mapping</a>. You can get the identifier of a mapping from the output of <a>ListEventSourceMappings</a>.</p> <p>When you delete an event source mapping, it enters a <code>Deleting</code> state and might not be completely deleted for several seconds.</p>\"\
    },\
    \"DeleteFunction\":{\
      \"name\":\"DeleteFunction\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes a Lambda function. To delete a specific function version, use the <code>Qualifier</code> parameter. Otherwise, all versions and aliases are deleted.</p> <p>To delete Lambda event source mappings that invoke a function, use <a>DeleteEventSourceMapping</a>. For Amazon Web Services services and resources that invoke your function directly, delete the trigger in the service where you originally configured it.</p>\"\
    },\
    \"DeleteFunctionCodeSigningConfig\":{\
      \"name\":\"DeleteFunctionCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2020-06-30/functions/{FunctionName}/code-signing-config\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionCodeSigningConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"CodeSigningConfigNotFoundException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Removes the code signing configuration from the function.</p>\"\
    },\
    \"DeleteFunctionConcurrency\":{\
      \"name\":\"DeleteFunctionConcurrency\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2017-10-31/functions/{FunctionName}/concurrency\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionConcurrencyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Removes a concurrent execution limit from a function.</p>\"\
    },\
    \"DeleteFunctionEventInvokeConfig\":{\
      \"name\":\"DeleteFunctionEventInvokeConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2019-09-25/functions/{FunctionName}/event-invoke-config\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionEventInvokeConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes the configuration for asynchronous invocation for a function, version, or alias.</p> <p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>\"\
    },\
    \"DeleteFunctionUrlConfig\":{\
      \"name\":\"DeleteFunctionUrlConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2021-10-31/functions/{FunctionName}/url\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionUrlConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ]\
    },\
    \"DeleteLayerVersion\":{\
      \"name\":\"DeleteLayerVersion\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteLayerVersionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Deletes a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>. Deleted versions can no longer be viewed or added to functions. To avoid breaking functions, a copy of the version remains in Lambda until no functions refer to it.</p>\"\
    },\
    \"DeleteProvisionedConcurrencyConfig\":{\
      \"name\":\"DeleteProvisionedConcurrencyConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2019-09-30/functions/{FunctionName}/provisioned-concurrency\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteProvisionedConcurrencyConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes the provisioned concurrency configuration for a function.</p>\"\
    },\
    \"GetAccountSettings\":{\
      \"name\":\"GetAccountSettings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2016-08-19/account-settings/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetAccountSettingsRequest\"},\
      \"output\":{\"shape\":\"GetAccountSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves details about your account's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">limits</a> and usage in an Amazon Web Services Region.</p>\"\
    },\
    \"GetAlias\":{\
      \"name\":\"GetAlias\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns details about a Lambda function <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">alias</a>.</p>\"\
    },\
    \"GetCodeSigningConfig\":{\
      \"name\":\"GetCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2020-04-22/code-signing-configs/{CodeSigningConfigArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"GetCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the specified code signing configuration.</p>\"\
    },\
    \"GetEventSourceMapping\":{\
      \"name\":\"GetEventSourceMapping\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns details about an event source mapping. You can get the identifier of a mapping from the output of <a>ListEventSourceMappings</a>.</p>\"\
    },\
    \"GetFunction\":{\
      \"name\":\"GetFunction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionRequest\"},\
      \"output\":{\"shape\":\"GetFunctionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns information about the function or function version, with a link to download the deployment package that's valid for 10 minutes. If you specify a function version, only details that are specific to that version are returned.</p>\"\
    },\
    \"GetFunctionCodeSigningConfig\":{\
      \"name\":\"GetFunctionCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2020-06-30/functions/{FunctionName}/code-signing-config\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"GetFunctionCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns the code signing configuration for the specified function.</p>\"\
    },\
    \"GetFunctionConcurrency\":{\
      \"name\":\"GetFunctionConcurrency\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2019-09-30/functions/{FunctionName}/concurrency\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionConcurrencyRequest\"},\
      \"output\":{\"shape\":\"GetFunctionConcurrencyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Returns details about the reserved concurrency configuration for a function. To set a concurrency limit for a function, use <a>PutFunctionConcurrency</a>.</p>\"\
    },\
    \"GetFunctionConfiguration\":{\
      \"name\":\"GetFunctionConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionConfigurationRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the version-specific settings of a Lambda function or version. The output includes only options that can vary between versions of a function. To modify these settings, use <a>UpdateFunctionConfiguration</a>.</p> <p>To get all of a function's details, including function-level settings, use <a>GetFunction</a>.</p>\"\
    },\
    \"GetFunctionEventInvokeConfig\":{\
      \"name\":\"GetFunctionEventInvokeConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2019-09-25/functions/{FunctionName}/event-invoke-config\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionEventInvokeConfigRequest\"},\
      \"output\":{\"shape\":\"FunctionEventInvokeConfig\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the configuration for asynchronous invocation for a function, version, or alias.</p> <p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>\"\
    },\
    \"GetFunctionUrlConfig\":{\
      \"name\":\"GetFunctionUrlConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2021-10-31/functions/{FunctionName}/url\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionUrlConfigRequest\"},\
      \"output\":{\"shape\":\"GetFunctionUrlConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ]\
    },\
    \"GetLayerVersion\":{\
      \"name\":\"GetLayerVersion\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetLayerVersionRequest\"},\
      \"output\":{\"shape\":\"GetLayerVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>, with a link to download the layer archive that's valid for 10 minutes.</p>\"\
    },\
    \"GetLayerVersionByArn\":{\
      \"name\":\"GetLayerVersionByArn\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2018-10-31/layers?find=LayerVersion\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetLayerVersionByArnRequest\"},\
      \"output\":{\"shape\":\"GetLayerVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>, with a link to download the layer archive that's valid for 10 minutes.</p>\"\
    },\
    \"GetLayerVersionPolicy\":{\
      \"name\":\"GetLayerVersionPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetLayerVersionPolicyRequest\"},\
      \"output\":{\"shape\":\"GetLayerVersionPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the permission policy for a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>. For more information, see <a>AddLayerVersionPermission</a>.</p>\"\
    },\
    \"GetPolicy\":{\
      \"name\":\"GetPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetPolicyRequest\"},\
      \"output\":{\"shape\":\"GetPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html\\\">resource-based IAM policy</a> for a function, version, or alias.</p>\"\
    },\
    \"GetProvisionedConcurrencyConfig\":{\
      \"name\":\"GetProvisionedConcurrencyConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2019-09-30/functions/{FunctionName}/provisioned-concurrency\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetProvisionedConcurrencyConfigRequest\"},\
      \"output\":{\"shape\":\"GetProvisionedConcurrencyConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ProvisionedConcurrencyConfigNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the provisioned concurrency configuration for a function's alias or version.</p>\"\
    },\
    \"Invoke\":{\
      \"name\":\"Invoke\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/invocations\"\
      },\
      \"input\":{\"shape\":\"InvocationRequest\"},\
      \"output\":{\"shape\":\"InvocationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestContentException\"},\
        {\"shape\":\"RequestTooLargeException\"},\
        {\"shape\":\"UnsupportedMediaTypeException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"EC2UnexpectedException\"},\
        {\"shape\":\"SubnetIPAddressLimitReachedException\"},\
        {\"shape\":\"ENILimitReachedException\"},\
        {\"shape\":\"EFSMountConnectivityException\"},\
        {\"shape\":\"EFSMountFailureException\"},\
        {\"shape\":\"EFSMountTimeoutException\"},\
        {\"shape\":\"EFSIOException\"},\
        {\"shape\":\"EC2ThrottledException\"},\
        {\"shape\":\"EC2AccessDeniedException\"},\
        {\"shape\":\"InvalidSubnetIDException\"},\
        {\"shape\":\"InvalidSecurityGroupIDException\"},\
        {\"shape\":\"InvalidZipFileException\"},\
        {\"shape\":\"KMSDisabledException\"},\
        {\"shape\":\"KMSInvalidStateException\"},\
        {\"shape\":\"KMSAccessDeniedException\"},\
        {\"shape\":\"KMSNotFoundException\"},\
        {\"shape\":\"InvalidRuntimeException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Invokes a Lambda function. You can invoke a function synchronously (and wait for the response), or asynchronously. To invoke a function asynchronously, set <code>InvocationType</code> to <code>Event</code>.</p> <p>For <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html\\\">synchronous invocation</a>, details about the function response, including errors, are included in the response body and headers. For either invocation type, you can find more information in the <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html\\\">execution log</a> and <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html\\\">trace</a>.</p> <p>When an error occurs, your function may be invoked multiple times. Retry behavior varies by error type, client, event source, and invocation type. For example, if you invoke a function asynchronously and it returns an error, Lambda executes the function up to two more times. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/retries-on-errors.html\\\">Retry Behavior</a>.</p> <p>For <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html\\\">asynchronous invocation</a>, Lambda adds events to a queue before sending them to your function. If your function does not have enough capacity to keep up with the queue, events may be lost. Occasionally, your function may receive the same event multiple times, even if no error occurs. To retain events that were not processed, configure your function with a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq\\\">dead-letter queue</a>.</p> <p>The status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your function from executing, such as permissions errors, <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">limit errors</a>, or issues with your function's code and configuration. For example, Lambda returns <code>TooManyRequestsException</code> if executing the function would cause you to exceed a concurrency limit at either the account level (<code>ConcurrentInvocationLimitExceeded</code>) or function level (<code>ReservedFunctionConcurrentInvocationLimitExceeded</code>).</p> <p>For functions with a long timeout, your client might be disconnected during synchronous invocation while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating system to allow for long connections with timeout or keep-alive settings.</p> <p>This operation requires permission for the <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awslambda.html\\\">lambda:InvokeFunction</a> action.</p>\"\
    },\
    \"InvokeAsync\":{\
      \"name\":\"InvokeAsync\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2014-11-13/functions/{FunctionName}/invoke-async/\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"InvokeAsyncRequest\"},\
      \"output\":{\"shape\":\"InvokeAsyncResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestContentException\"},\
        {\"shape\":\"InvalidRuntimeException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<important> <p>For asynchronous function invocation, use <a>Invoke</a>.</p> </important> <p>Invokes a function asynchronously.</p>\",\
      \"deprecated\":true\
    },\
    \"ListAliases\":{\
      \"name\":\"ListAliases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListAliasesRequest\"},\
      \"output\":{\"shape\":\"ListAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">aliases</a> for a Lambda function.</p>\"\
    },\
    \"ListCodeSigningConfigs\":{\
      \"name\":\"ListCodeSigningConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2020-04-22/code-signing-configs/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListCodeSigningConfigsRequest\"},\
      \"output\":{\"shape\":\"ListCodeSigningConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuring-codesigning.html\\\">code signing configurations</a>. A request returns up to 10,000 configurations per call. You can use the <code>MaxItems</code> parameter to return fewer configurations per call. </p>\"\
    },\
    \"ListEventSourceMappings\":{\
      \"name\":\"ListEventSourceMappings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListEventSourceMappingsRequest\"},\
      \"output\":{\"shape\":\"ListEventSourceMappingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Lists event source mappings. Specify an <code>EventSourceArn</code> to only show event source mappings for a single event source.</p>\"\
    },\
    \"ListFunctionEventInvokeConfigs\":{\
      \"name\":\"ListFunctionEventInvokeConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2019-09-25/functions/{FunctionName}/event-invoke-config/list\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListFunctionEventInvokeConfigsRequest\"},\
      \"output\":{\"shape\":\"ListFunctionEventInvokeConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of configurations for asynchronous invocation for a function.</p> <p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>\"\
    },\
    \"ListFunctionUrlConfigs\":{\
      \"name\":\"ListFunctionUrlConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2021-10-31/functions/{FunctionName}/urls\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListFunctionUrlConfigsRequest\"},\
      \"output\":{\"shape\":\"ListFunctionUrlConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ]\
    },\
    \"ListFunctions\":{\
      \"name\":\"ListFunctions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListFunctionsRequest\"},\
      \"output\":{\"shape\":\"ListFunctionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of Lambda functions, with the version-specific configuration of each. Lambda returns up to 50 functions per call.</p> <p>Set <code>FunctionVersion</code> to <code>ALL</code> to include all published versions of each function in addition to the unpublished version. </p> <note> <p>The <code>ListFunctions</code> action returns a subset of the <a>FunctionConfiguration</a> fields. To get the additional fields (State, StateReasonCode, StateReason, LastUpdateStatus, LastUpdateStatusReason, LastUpdateStatusReasonCode) for a function or version, use <a>GetFunction</a>.</p> </note>\"\
    },\
    \"ListFunctionsByCodeSigningConfig\":{\
      \"name\":\"ListFunctionsByCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2020-04-22/code-signing-configs/{CodeSigningConfigArn}/functions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListFunctionsByCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"ListFunctionsByCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>List the functions that use the specified code signing configuration. You can use this method prior to deleting a code signing configuration, to verify that no functions are using it.</p>\"\
    },\
    \"ListLayerVersions\":{\
      \"name\":\"ListLayerVersions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListLayerVersionsRequest\"},\
      \"output\":{\"shape\":\"ListLayerVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Lists the versions of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>. Versions that have been deleted aren't listed. Specify a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html\\\">runtime identifier</a> to list only versions that indicate that they're compatible with that runtime. Specify a compatible architecture to include only layer versions that are compatible with that architecture.</p>\"\
    },\
    \"ListLayers\":{\
      \"name\":\"ListLayers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2018-10-31/layers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListLayersRequest\"},\
      \"output\":{\"shape\":\"ListLayersResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Lists <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-layers.html\\\">Lambda layers</a> and shows information about the latest version of each. Specify a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html\\\">runtime identifier</a> to list only layers that indicate that they're compatible with that runtime. Specify a compatible architecture to include only layers that are compatible with that <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architecture</a>.</p>\"\
    },\
    \"ListProvisionedConcurrencyConfigs\":{\
      \"name\":\"ListProvisionedConcurrencyConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2019-09-30/functions/{FunctionName}/provisioned-concurrency?List=ALL\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListProvisionedConcurrencyConfigsRequest\"},\
      \"output\":{\"shape\":\"ListProvisionedConcurrencyConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of provisioned concurrency configurations for a function.</p>\"\
    },\
    \"ListTags\":{\
      \"name\":\"ListTags\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2017-03-31/tags/{ARN}\"\
      },\
      \"input\":{\"shape\":\"ListTagsRequest\"},\
      \"output\":{\"shape\":\"ListTagsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">tags</a>. You can also view tags with <a>GetFunction</a>.</p>\"\
    },\
    \"ListVersionsByFunction\":{\
      \"name\":\"ListVersionsByFunction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListVersionsByFunctionRequest\"},\
      \"output\":{\"shape\":\"ListVersionsByFunctionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">versions</a>, with the version-specific configuration of each. Lambda returns up to 50 versions per call.</p>\"\
    },\
    \"PublishLayerVersion\":{\
      \"name\":\"PublishLayerVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"PublishLayerVersionRequest\"},\
      \"output\":{\"shape\":\"PublishLayerVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"CodeStorageExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a> from a ZIP archive. Each time you call <code>PublishLayerVersion</code> with the same layer name, a new version is created.</p> <p>Add layers to your function with <a>CreateFunction</a> or <a>UpdateFunctionConfiguration</a>.</p>\"\
    },\
    \"PublishVersion\":{\
      \"name\":\"PublishVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"PublishVersionRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"},\
        {\"shape\":\"PreconditionFailedException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">version</a> from the current code and configuration of a function. Use versions to create a snapshot of your function code and configuration that doesn't change.</p> <p>Lambda doesn't publish a version if the function's configuration and code haven't changed since the last version. Use <a>UpdateFunctionCode</a> or <a>UpdateFunctionConfiguration</a> to update the function before publishing a version.</p> <p>Clients can invoke versions directly or with an alias. To create an alias, use <a>CreateAlias</a>.</p>\"\
    },\
    \"PutFunctionCodeSigningConfig\":{\
      \"name\":\"PutFunctionCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2020-06-30/functions/{FunctionName}/code-signing-config\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutFunctionCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"PutFunctionCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"CodeSigningConfigNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Update the code signing configuration for the function. Changes to the code signing configuration take effect the next time a user tries to deploy a code package to the function. </p>\"\
    },\
    \"PutFunctionConcurrency\":{\
      \"name\":\"PutFunctionConcurrency\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2017-10-31/functions/{FunctionName}/concurrency\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutFunctionConcurrencyRequest\"},\
      \"output\":{\"shape\":\"Concurrency\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Sets the maximum number of simultaneous executions for a function, and reserves capacity for that concurrency level.</p> <p>Concurrency settings apply to the function as a whole, including all published versions and the unpublished version. Reserving concurrency both ensures that your function has capacity to process the specified number of events simultaneously, and prevents it from scaling beyond that level. Use <a>GetFunction</a> to see the current setting for a function.</p> <p>Use <a>GetAccountSettings</a> to see your Regional concurrency limit. You can reserve concurrency for as many functions as you like, as long as you leave at least 100 simultaneous executions unreserved for functions that aren't configured with a per-function limit. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">Managing Concurrency</a>.</p>\"\
    },\
    \"PutFunctionEventInvokeConfig\":{\
      \"name\":\"PutFunctionEventInvokeConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2019-09-25/functions/{FunctionName}/event-invoke-config\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutFunctionEventInvokeConfigRequest\"},\
      \"output\":{\"shape\":\"FunctionEventInvokeConfig\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Configures options for <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html\\\">asynchronous invocation</a> on a function, version, or alias. If a configuration already exists for a function, version, or alias, this operation overwrites it. If you exclude any settings, they are removed. To set one option without affecting existing settings for other options, use <a>UpdateFunctionEventInvokeConfig</a>.</p> <p>By default, Lambda retries an asynchronous invocation twice if the function returns an error. It retains events in a queue for up to six hours. When an event fails all processing attempts or stays in the asynchronous invocation queue for too long, Lambda discards it. To retain discarded events, configure a dead-letter queue with <a>UpdateFunctionConfiguration</a>.</p> <p>To send an invocation record to a queue, topic, function, or event bus, specify a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations\\\">destination</a>. You can configure separate destinations for successful invocations (on-success) and events that fail all processing attempts (on-failure). You can configure destinations in addition to or instead of a dead-letter queue.</p>\"\
    },\
    \"PutProvisionedConcurrencyConfig\":{\
      \"name\":\"PutProvisionedConcurrencyConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2019-09-30/functions/{FunctionName}/provisioned-concurrency\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"PutProvisionedConcurrencyConfigRequest\"},\
      \"output\":{\"shape\":\"PutProvisionedConcurrencyConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ServiceException\"}\
      ],\
      \"documentation\":\"<p>Adds a provisioned concurrency configuration to a function's alias or version.</p>\"\
    },\
    \"RemoveLayerVersionPermission\":{\
      \"name\":\"RemoveLayerVersionPermission\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2018-10-31/layers/{LayerName}/versions/{VersionNumber}/policy/{StatementId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"RemoveLayerVersionPermissionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Removes a statement from the permissions policy for a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>. For more information, see <a>AddLayerVersionPermission</a>.</p>\"\
    },\
    \"RemovePermission\":{\
      \"name\":\"RemovePermission\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy/{StatementId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"RemovePermissionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"}\
      ],\
      \"documentation\":\"<p>Revokes function-use permission from an Amazon Web Services service or another account. You can get the ID of the statement from the output of <a>GetPolicy</a>.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2017-03-31/tags/{ARN}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Adds <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">tags</a> to a function.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2017-03-31/tags/{ARN}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Removes <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">tags</a> from a function.</p>\"\
    },\
    \"UpdateAlias\":{\
      \"name\":\"UpdateAlias\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"PreconditionFailedException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates the configuration of a Lambda function <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">alias</a>.</p>\"\
    },\
    \"UpdateCodeSigningConfig\":{\
      \"name\":\"UpdateCodeSigningConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2020-04-22/code-signing-configs/{CodeSigningConfigArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateCodeSigningConfigRequest\"},\
      \"output\":{\"shape\":\"UpdateCodeSigningConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Update the code signing configuration. Changes to the code signing configuration take effect the next time a user tries to deploy a code package to the function. </p>\"\
    },\
    \"UpdateEventSourceMapping\":{\
      \"name\":\"UpdateEventSourceMapping\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"UpdateEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Updates an event source mapping. You can change the function that Lambda invokes, or pause invocation and resume later from the same location.</p> <p>For details about how to configure different event sources, see the following topics. </p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping\\\"> Amazon DynamoDB Streams</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping\\\"> Amazon Kinesis</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource\\\"> Amazon SQS</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping\\\"> Amazon MQ and RabbitMQ</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html\\\"> Amazon MSK</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html\\\"> Apache Kafka</a> </p> </li> </ul> <p>The following error handling options are only available for stream sources (DynamoDB and Kinesis):</p> <ul> <li> <p> <code>BisectBatchOnFunctionError</code> - If the function returns an error, split the batch in two and retry.</p> </li> <li> <p> <code>DestinationConfig</code> - Send discarded records to an Amazon SQS queue or Amazon SNS topic.</p> </li> <li> <p> <code>MaximumRecordAgeInSeconds</code> - Discard records older than the specified age. The default value is infinite (-1). When set to infinite (-1), failed records are retried until the record expires</p> </li> <li> <p> <code>MaximumRetryAttempts</code> - Discard records after the specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed records are retried until the record expires.</p> </li> <li> <p> <code>ParallelizationFactor</code> - Process multiple batches from each shard concurrently.</p> </li> </ul> <p>For information about which configuration parameters apply to each event source, see the following topics.</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-ddb-params\\\"> Amazon DynamoDB Streams</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-params\\\"> Amazon Kinesis</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#services-sqs-params\\\"> Amazon SQS</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-params\\\"> Amazon MQ and RabbitMQ</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-parms\\\"> Amazon MSK</a> </p> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-kafka-parms\\\"> Apache Kafka</a> </p> </li> </ul>\"\
    },\
    \"UpdateFunctionCode\":{\
      \"name\":\"UpdateFunctionCode\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/code\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionCodeRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"},\
        {\"shape\":\"PreconditionFailedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"CodeVerificationFailedException\"},\
        {\"shape\":\"InvalidCodeSignatureException\"},\
        {\"shape\":\"CodeSigningConfigNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates a Lambda function's code. If code signing is enabled for the function, the code package must be signed by a trusted publisher. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-trustedcode.html\\\">Configuring code signing</a>.</p> <p>The function's code is locked when you publish a version. You can't modify the code of a published version, only the unpublished version.</p> <note> <p>For a function defined as a container image, Lambda resolves the image tag to an image digest. In Amazon ECR, if you update the image tag to a new image, Lambda does not automatically update the function.</p> </note>\"\
    },\
    \"UpdateFunctionConfiguration\":{\
      \"name\":\"UpdateFunctionConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionConfigurationRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"PreconditionFailedException\"},\
        {\"shape\":\"CodeVerificationFailedException\"},\
        {\"shape\":\"InvalidCodeSignatureException\"},\
        {\"shape\":\"CodeSigningConfigNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Modify the version-specific settings of a Lambda function.</p> <p>When you update a function, Lambda provisions an instance of the function and its supporting resources. If your function connects to a VPC, this process can take a minute. During this time, you can't modify the function, but you can still invoke it. The <code>LastUpdateStatus</code>, <code>LastUpdateStatusReason</code>, and <code>LastUpdateStatusReasonCode</code> fields in the response from <a>GetFunctionConfiguration</a> indicate when the update is complete and the function is processing events with the new configuration. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html\\\">Function States</a>.</p> <p>These settings can vary between versions of a function and are locked when you publish a version. You can't modify the configuration of a published version, only the unpublished version.</p> <p>To configure function concurrency, use <a>PutFunctionConcurrency</a>. To grant invoke permissions to an account or Amazon Web Services service, use <a>AddPermission</a>.</p>\"\
    },\
    \"UpdateFunctionEventInvokeConfig\":{\
      \"name\":\"UpdateFunctionEventInvokeConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2019-09-25/functions/{FunctionName}/event-invoke-config\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionEventInvokeConfigRequest\"},\
      \"output\":{\"shape\":\"FunctionEventInvokeConfig\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates the configuration for asynchronous invocation for a function, version, or alias.</p> <p>To configure options for asynchronous invocation, use <a>PutFunctionEventInvokeConfig</a>.</p>\"\
    },\
    \"UpdateFunctionUrlConfig\":{\
      \"name\":\"UpdateFunctionUrlConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2021-10-31/functions/{FunctionName}/url\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionUrlConfigRequest\"},\
      \"output\":{\"shape\":\"UpdateFunctionUrlConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ]\
    }\
  },\
  \"shapes\":{\
    \"AccountLimit\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TotalCodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The amount of storage space that you can use for all deployment packages and layer archives.</p>\"\
        },\
        \"CodeSizeUnzipped\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The maximum size of a function's deployment package and layers when they're extracted.</p>\"\
        },\
        \"CodeSizeZipped\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The maximum size of a deployment package when it's uploaded directly to Lambda. Use Amazon S3 for larger files.</p>\"\
        },\
        \"ConcurrentExecutions\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The maximum number of simultaneous function executions.</p>\"\
        },\
        \"UnreservedConcurrentExecutions\":{\
          \"shape\":\"UnreservedConcurrentExecutions\",\
          \"documentation\":\"<p>The maximum number of simultaneous function executions, minus the capacity that's reserved for individual functions with <a>PutFunctionConcurrency</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Limits that are related to concurrency and storage. All file and storage sizes are in bytes.</p>\"\
    },\
    \"AccountUsage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TotalCodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The amount of storage space, in bytes, that's being used by deployment packages and layer archives.</p>\"\
        },\
        \"FunctionCount\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The number of Lambda functions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The number of functions and amount of storage in use.</p>\"\
    },\
    \"Action\":{\
      \"type\":\"string\",\
      \"pattern\":\"(lambda:[*]|lambda:[a-zA-Z]+|[*])\"\
    },\
    \"AddLayerVersionPermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LayerName\",\
        \"VersionNumber\",\
        \"StatementId\",\
        \"Action\",\
        \"Principal\"\
      ],\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VersionNumber\"\
        },\
        \"StatementId\":{\
          \"shape\":\"StatementId\",\
          \"documentation\":\"<p>An identifier that distinguishes the policy from others on the same layer version.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"LayerPermissionAllowedAction\",\
          \"documentation\":\"<p>The API action that grants access to the layer. For example, <code>lambda:GetLayerVersion</code>.</p>\"\
        },\
        \"Principal\":{\
          \"shape\":\"LayerPermissionAllowedPrincipal\",\
          \"documentation\":\"<p>An account ID, or <code>*</code> to grant layer usage permission to all accounts in an organization, or all Amazon Web Services accounts (if <code>organizationId</code> is not specified). For the last case, make sure that you really do want all Amazon Web Services accounts to have usage permission to this layer. </p>\"\
        },\
        \"OrganizationId\":{\
          \"shape\":\"OrganizationId\",\
          \"documentation\":\"<p>With the principal set to <code>*</code>, grant permission to all accounts in the specified organization.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the policy if the revision ID matches the ID specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RevisionId\"\
        }\
      }\
    },\
    \"AddLayerVersionPermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Statement\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The permission statement.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for the current revision of the policy.</p>\"\
        }\
      }\
    },\
    \"AddPermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"StatementId\",\
        \"Action\",\
        \"Principal\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"StatementId\":{\
          \"shape\":\"StatementId\",\
          \"documentation\":\"<p>A statement identifier that differentiates the statement from others in the same policy.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"Action\",\
          \"documentation\":\"<p>The action that the principal can use on the function. For example, <code>lambda:InvokeFunction</code> or <code>lambda:GetFunction</code>.</p>\"\
        },\
        \"Principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The Amazon Web Services service or account that invokes the function. If you specify a service, use <code>SourceArn</code> or <code>SourceAccount</code> to limit who can invoke the function through that service.</p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>For Amazon Web Services services, the ARN of the Amazon Web Services resource that invokes the function. For example, an Amazon S3 bucket or Amazon SNS topic.</p> <p>Note that Lambda configures the comparison using the <code>StringLike</code> operator.</p>\"\
        },\
        \"SourceAccount\":{\
          \"shape\":\"SourceOwner\",\
          \"documentation\":\"<p>For Amazon S3, the ID of the account that owns the resource. Use this together with <code>SourceArn</code> to ensure that the resource is owned by the specified account. It is possible for an Amazon S3 bucket to be deleted by its owner and recreated by another account.</p>\"\
        },\
        \"EventSourceToken\":{\
          \"shape\":\"EventSourceToken\",\
          \"documentation\":\"<p>For Alexa Smart Home functions, a token that must be supplied by the invoker.</p>\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to add permissions to a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>\"\
        }\
      }\
    },\
    \"AddPermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Statement\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The permission statement that's added to the function policy.</p>\"\
        }\
      }\
    },\
    \"AdditionalVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[0-9]+\"\
    },\
    \"AdditionalVersionWeights\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AdditionalVersion\"},\
      \"value\":{\"shape\":\"Weight\"}\
    },\
    \"Alias\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(?!^[0-9]+$)([a-zA-Z0-9-_]+)\"\
    },\
    \"AliasConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the alias.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The name of the alias.</p>\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The function version that the alias invokes.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the alias.</p>\"\
        },\
        \"RoutingConfig\":{\
          \"shape\":\"AliasRoutingConfiguration\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html\\\">routing configuration</a> of the alias.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier that changes when you update the alias.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration information about a Lambda function <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">alias</a>.</p>\"\
    },\
    \"AliasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasConfiguration\"}\
    },\
    \"AliasRoutingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdditionalVersionWeights\":{\
          \"shape\":\"AdditionalVersionWeights\",\
          \"documentation\":\"<p>The second version, and the percentage of traffic that's routed to it.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html\\\">traffic-shifting</a> configuration of a Lambda function alias.</p>\"\
    },\
    \"AllowCredentials\":{\"type\":\"boolean\"},\
    \"AllowMethodsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Method\"},\
      \"max\":6\
    },\
    \"AllowOriginsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Origin\"},\
      \"max\":100\
    },\
    \"AllowedPublishers\":{\
      \"type\":\"structure\",\
      \"required\":[\"SigningProfileVersionArns\"],\
      \"members\":{\
        \"SigningProfileVersionArns\":{\
          \"shape\":\"SigningProfileVersionArns\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for each of the signing profiles. A signing profile defines a trusted user who can sign a code package. </p>\"\
        }\
      },\
      \"documentation\":\"<p>List of signing profiles that can sign a code package. </p>\"\
    },\
    \"Architecture\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"x86_64\",\
        \"arm64\"\
      ]\
    },\
    \"ArchitecturesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Architecture\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\\\-])+:([a-z]{2}(-gov)?-[a-z]+-\\\\d{1})?:(\\\\d{12})?:(.*)\"\
    },\
    \"AuthorizationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"AWS_IAM\"\
      ]\
    },\
    \"BatchSize\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"BisectBatchOnFunctionError\":{\"type\":\"boolean\"},\
    \"Blob\":{\
      \"type\":\"blob\",\
      \"sensitive\":true\
    },\
    \"BlobStream\":{\
      \"type\":\"blob\",\
      \"streaming\":true\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CodeSigningConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeSigningConfigId\",\
        \"CodeSigningConfigArn\",\
        \"AllowedPublishers\",\
        \"CodeSigningPolicies\",\
        \"LastModified\"\
      ],\
      \"members\":{\
        \"CodeSigningConfigId\":{\
          \"shape\":\"CodeSigningConfigId\",\
          \"documentation\":\"<p>Unique identifer for the Code signing configuration.</p>\"\
        },\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Code signing configuration.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Code signing configuration description.</p>\"\
        },\
        \"AllowedPublishers\":{\
          \"shape\":\"AllowedPublishers\",\
          \"documentation\":\"<p>List of allowed publishers.</p>\"\
        },\
        \"CodeSigningPolicies\":{\
          \"shape\":\"CodeSigningPolicies\",\
          \"documentation\":\"<p>The code signing policy controls the validation failure action for signature mismatch or expiry.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the Code signing configuration was last modified, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD). </p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html\\\">Code signing configuration</a>. </p>\"\
    },\
    \"CodeSigningConfigArn\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}((-gov)|(-iso(b?)))?-[a-z]+-\\\\d{1}:\\\\d{12}:code-signing-config:csc-[a-z0-9]{17}\"\
    },\
    \"CodeSigningConfigId\":{\
      \"type\":\"string\",\
      \"pattern\":\"csc-[a-zA-Z0-9-_\\\\.]{17}\"\
    },\
    \"CodeSigningConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CodeSigningConfig\"}\
    },\
    \"CodeSigningConfigNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified code signing configuration does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"CodeSigningPolicies\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UntrustedArtifactOnDeployment\":{\
          \"shape\":\"CodeSigningPolicy\",\
          \"documentation\":\"<p>Code signing configuration policy for deployment validation failure. If you set the policy to <code>Enforce</code>, Lambda blocks the deployment request if signature validation checks fail. If you set the policy to <code>Warn</code>, Lambda allows the deployment and creates a CloudWatch log. </p> <p>Default value: <code>Warn</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Code signing configuration <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html#config-codesigning-policies\\\">policies</a> specify the validation failure action for signature mismatch or expiry.</p>\"\
    },\
    \"CodeSigningPolicy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Warn\",\
        \"Enforce\"\
      ]\
    },\
    \"CodeStorageExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Learn more</a> </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"CodeVerificationFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The code signature failed one or more of the validation checks for signature mismatch or expiry, and the code signing policy is set to ENFORCE. Lambda blocks the deployment. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"CompatibleArchitectures\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Architecture\"},\
      \"max\":2\
    },\
    \"CompatibleRuntimes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Runtime\"},\
      \"max\":15\
    },\
    \"Concurrency\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedConcurrentExecutions\":{\
          \"shape\":\"ReservedConcurrentExecutions\",\
          \"documentation\":\"<p>The number of concurrent executions that are reserved for this function. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-concurrency.html\\\">Managing Concurrency</a>.</p>\"\
        }\
      }\
    },\
    \"Cors\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowCredentials\":{\"shape\":\"AllowCredentials\"},\
        \"AllowHeaders\":{\"shape\":\"HeadersList\"},\
        \"AllowMethods\":{\"shape\":\"AllowMethodsList\"},\
        \"AllowOrigins\":{\"shape\":\"AllowOriginsList\"},\
        \"ExposeHeaders\":{\"shape\":\"HeadersList\"},\
        \"MaxAge\":{\"shape\":\"MaxAge\"}\
      }\
    },\
    \"CreateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\",\
        \"FunctionVersion\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The name of the alias.</p>\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The function version that the alias invokes.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the alias.</p>\"\
        },\
        \"RoutingConfig\":{\
          \"shape\":\"AliasRoutingConfiguration\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing\\\">routing configuration</a> of the alias.</p>\"\
        }\
      }\
    },\
    \"CreateCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AllowedPublishers\"],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Descriptive name for this code signing configuration.</p>\"\
        },\
        \"AllowedPublishers\":{\
          \"shape\":\"AllowedPublishers\",\
          \"documentation\":\"<p>Signing profiles for this code signing configuration.</p>\"\
        },\
        \"CodeSigningPolicies\":{\
          \"shape\":\"CodeSigningPolicies\",\
          \"documentation\":\"<p>The code signing policies define the actions to take if the validation checks fail. </p>\"\
        }\
      }\
    },\
    \"CreateCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfig\"],\
      \"members\":{\
        \"CodeSigningConfig\":{\
          \"shape\":\"CodeSigningConfig\",\
          \"documentation\":\"<p>The code signing configuration.</p>\"\
        }\
      }\
    },\
    \"CreateEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the event source.</p> <ul> <li> <p> <b>Amazon Kinesis</b> - The ARN of the data stream or a stream consumer.</p> </li> <li> <p> <b>Amazon DynamoDB Streams</b> - The ARN of the stream.</p> </li> <li> <p> <b>Amazon Simple Queue Service</b> - The ARN of the queue.</p> </li> <li> <p> <b>Amazon Managed Streaming for Apache Kafka</b> - The ARN of the cluster.</p> </li> </ul>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>When true, the event source mapping is active. When false, Lambda pauses polling and invocation.</p> <p>Default: True</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to your function. Lambda passes all of the records in the batch to the function in a single call, up to the payload limit for synchronous invocation (6 MB).</p> <ul> <li> <p> <b>Amazon Kinesis</b> - Default 100. Max 10,000.</p> </li> <li> <p> <b>Amazon DynamoDB Streams</b> - Default 100. Max 1,000.</p> </li> <li> <p> <b>Amazon Simple Queue Service</b> - Default 10. For standard queues the max is 10,000. For FIFO queues the max is 10.</p> </li> <li> <p> <b>Amazon Managed Streaming for Apache Kafka</b> - Default 100. Max 10,000.</p> </li> <li> <p> <b>Self-Managed Apache Kafka</b> - Default 100. Max 10,000.</p> </li> <li> <p> <b>Amazon MQ (ActiveMQ and RabbitMQ)</b> - Default 100. Max 10,000.</p> </li> </ul>\"\
        },\
        \"FilterCriteria\":{\
          \"shape\":\"FilterCriteria\",\
          \"documentation\":\"<p>(Streams and Amazon SQS) A object that defines the filter criteria used to determine whether Lambda should process an event. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html\\\">Lambda event filtering</a>.</p>\"\
        },\
        \"MaximumBatchingWindowInSeconds\":{\
          \"shape\":\"MaximumBatchingWindowInSeconds\",\
          \"documentation\":\"<p>(Streams and Amazon SQS standard queues) The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the function.</p> <p>Default: 0</p> <p>Related setting: When you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>\"\
        },\
        \"ParallelizationFactor\":{\
          \"shape\":\"ParallelizationFactor\",\
          \"documentation\":\"<p>(Streams only) The number of batches to process from each shard concurrently.</p>\"\
        },\
        \"StartingPosition\":{\
          \"shape\":\"EventSourcePosition\",\
          \"documentation\":\"<p>The position in a stream from which to start reading. Required for Amazon Kinesis, Amazon DynamoDB, and Amazon MSK Streams sources. <code>AT_TIMESTAMP</code> is only supported for Amazon Kinesis streams.</p>\"\
        },\
        \"StartingPositionTimestamp\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the time from which to start reading.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"DestinationConfig\",\
          \"documentation\":\"<p>(Streams only) An Amazon SQS queue or Amazon SNS topic destination for discarded records.</p>\"\
        },\
        \"MaximumRecordAgeInSeconds\":{\
          \"shape\":\"MaximumRecordAgeInSeconds\",\
          \"documentation\":\"<p>(Streams only) Discard records older than the specified age. The default value is infinite (-1).</p>\"\
        },\
        \"BisectBatchOnFunctionError\":{\
          \"shape\":\"BisectBatchOnFunctionError\",\
          \"documentation\":\"<p>(Streams only) If the function returns an error, split the batch in two and retry.</p>\"\
        },\
        \"MaximumRetryAttempts\":{\
          \"shape\":\"MaximumRetryAttemptsEventSourceMapping\",\
          \"documentation\":\"<p>(Streams only) Discard records after the specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed records will be retried until the record expires.</p>\"\
        },\
        \"TumblingWindowInSeconds\":{\
          \"shape\":\"TumblingWindowInSeconds\",\
          \"documentation\":\"<p>(Streams only) The duration in seconds of a processing window. The range is between 1 second up to 900 seconds.</p>\"\
        },\
        \"Topics\":{\
          \"shape\":\"Topics\",\
          \"documentation\":\"<p>The name of the Kafka topic.</p>\"\
        },\
        \"Queues\":{\
          \"shape\":\"Queues\",\
          \"documentation\":\"<p> (MQ) The name of the Amazon MQ broker destination queue to consume. </p>\"\
        },\
        \"SourceAccessConfigurations\":{\
          \"shape\":\"SourceAccessConfigurations\",\
          \"documentation\":\"<p>An array of authentication protocols or VPC components required to secure your event source.</p>\"\
        },\
        \"SelfManagedEventSource\":{\
          \"shape\":\"SelfManagedEventSource\",\
          \"documentation\":\"<p>The Self-Managed Apache Kafka cluster to send records.</p>\"\
        },\
        \"FunctionResponseTypes\":{\
          \"shape\":\"FunctionResponseTypeList\",\
          \"documentation\":\"<p>(Streams only) A list of current response type enums applied to the event source mapping.</p>\"\
        }\
      }\
    },\
    \"CreateFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Role\",\
        \"Code\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The identifier of the function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html\\\">runtime</a>.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function's execution role.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The name of the method within your code that Lambda calls to execute your function. The format includes the file name. It can also include namespaces and other qualifiers, depending on the runtime. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html\\\">Programming Model</a>.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"FunctionCode\",\
          \"documentation\":\"<p>The code for the function.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the function.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The amount of time (in seconds) that Lambda allows a function to run before stopping it. The default is 3 seconds. The maximum allowed value is 900 seconds. For additional information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html\\\">Lambda execution environment</a>.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html\\\">memory available to the function</a> at runtime. Increasing the function memory also increases its CPU allocation. The default value is 128 MB. The value can be any multiple of 1 MB.</p>\"\
        },\
        \"Publish\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to true to publish the first version of the function during creation.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>For network connectivity to Amazon Web Services resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html\\\">VPC Settings</a>.</p>\"\
        },\
        \"PackageType\":{\
          \"shape\":\"PackageType\",\
          \"documentation\":\"<p>The type of deployment package. Set to <code>Image</code> for container image and set <code>Zip</code> for ZIP archive.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"DeadLetterConfig\",\
          \"documentation\":\"<p>A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq\\\">Dead Letter Queues</a>.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"Environment\",\
          \"documentation\":\"<p>Environment variables that are accessible from function code during execution.</p>\"\
        },\
        \"KMSKeyArn\":{\
          \"shape\":\"KMSKeyArn\",\
          \"documentation\":\"<p>The ARN of the Amazon Web Services Key Management Service (KMS) key that's used to encrypt your function's environment variables. If it's not provided, Lambda uses a default service key.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"TracingConfig\",\
          \"documentation\":\"<p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html\\\">X-Ray</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A list of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">tags</a> to apply to the function.</p>\"\
        },\
        \"Layers\":{\
          \"shape\":\"LayerList\",\
          \"documentation\":\"<p>A list of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">function layers</a> to add to the function's execution environment. Specify each layer by its ARN, including the version.</p>\"\
        },\
        \"FileSystemConfigs\":{\
          \"shape\":\"FileSystemConfigList\",\
          \"documentation\":\"<p>Connection settings for an Amazon EFS file system.</p>\"\
        },\
        \"ImageConfig\":{\
          \"shape\":\"ImageConfig\",\
          \"documentation\":\"<p>Container image <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-images.html#configuration-images-settings\\\">configuration values</a> that override the values in the container image Dockerfile.</p>\"\
        },\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function.</p>\"\
        },\
        \"Architectures\":{\
          \"shape\":\"ArchitecturesList\",\
          \"documentation\":\"<p>The instruction set architecture that the function supports. Enter a string array with one of the valid values (arm64 or x86_64). The default value is <code>x86_64</code>.</p>\"\
        }\
      }\
    },\
    \"CreateFunctionUrlConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"AuthorizationType\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"FunctionUrlQualifier\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"AuthorizationType\":{\"shape\":\"AuthorizationType\"},\
        \"Cors\":{\"shape\":\"Cors\"}\
      }\
    },\
    \"CreateFunctionUrlConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionUrl\",\
        \"FunctionArn\",\
        \"AuthorizationType\",\
        \"CreationTime\"\
      ],\
      \"members\":{\
        \"FunctionUrl\":{\"shape\":\"FunctionUrl\"},\
        \"FunctionArn\":{\"shape\":\"FunctionArn\"},\
        \"AuthorizationType\":{\"shape\":\"AuthorizationType\"},\
        \"Cors\":{\"shape\":\"Cors\"},\
        \"CreationTime\":{\"shape\":\"Timestamp\"}\
      }\
    },\
    \"Date\":{\"type\":\"timestamp\"},\
    \"DeadLetterConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq\\\">dead-letter queue</a> for failed asynchronous invocations.</p>\"\
    },\
    \"DeleteAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The name of the alias.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        }\
      }\
    },\
    \"DeleteCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfigArn\"],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeSigningConfigArn\"\
        }\
      }\
    },\
    \"DeleteCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the event source mapping.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        }\
      }\
    },\
    \"DeleteFunctionCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        }\
      }\
    },\
    \"DeleteFunctionConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        }\
      }\
    },\
    \"DeleteFunctionEventInvokeConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>A version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"DeleteFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function or version.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:1</code> (with version).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version to delete. You can't delete a version that's referenced by an alias.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"DeleteFunctionUrlConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"FunctionUrlQualifier\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"DeleteLayerVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LayerName\",\
        \"VersionNumber\"\
      ],\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VersionNumber\"\
        }\
      }\
    },\
    \"DeleteProvisionedConcurrencyConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Qualifier\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>The version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"DestinationArn\":{\
      \"type\":\"string\",\
      \"max\":350,\
      \"min\":0,\
      \"pattern\":\"^$|arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\\\-])+:([a-z]{2}(-gov)?-[a-z]+-\\\\d{1})?:(\\\\d{12})?:(.*)\"\
    },\
    \"DestinationConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OnSuccess\":{\
          \"shape\":\"OnSuccess\",\
          \"documentation\":\"<p>The destination configuration for successful invocations.</p>\"\
        },\
        \"OnFailure\":{\
          \"shape\":\"OnFailure\",\
          \"documentation\":\"<p>The destination configuration for failed invocations.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A configuration object that specifies the destination of an event after Lambda processes it.</p>\"\
    },\
    \"EC2AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Need additional permissions to configure VPC settings.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EC2ThrottledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was throttled by Amazon EC2 during Lambda function initialization using the execution role provided for the Lambda function.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EC2UnexpectedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"},\
        \"EC2ErrorCode\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda received an unexpected EC2 client exception while setting up for the Lambda function.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EFSIOException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>An error occurred when reading from or writing to a connected file system.</p>\",\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true\
    },\
    \"EFSMountConnectivityException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The function couldn't make a network connection to the configured file system.</p>\",\
      \"error\":{\"httpStatusCode\":408},\
      \"exception\":true\
    },\
    \"EFSMountFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The function couldn't mount the configured file system due to a permission or configuration issue.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"EFSMountTimeoutException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The function was able to make a network connection to the configured file system, but the mount operation timed out.</p>\",\
      \"error\":{\"httpStatusCode\":408},\
      \"exception\":true\
    },\
    \"ENILimitReachedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was not able to create an elastic network interface in the VPC, specified as part of Lambda function configuration, because the limit for network interfaces has been reached.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"Enabled\":{\"type\":\"boolean\"},\
    \"EndPointType\":{\
      \"type\":\"string\",\
      \"enum\":[\"KAFKA_BOOTSTRAP_SERVERS\"]\
    },\
    \"Endpoint\":{\
      \"type\":\"string\",\
      \"max\":300,\
      \"min\":1,\
      \"pattern\":\"^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\\\\-]*[a-zA-Z0-9])\\\\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\\\\-]*[A-Za-z0-9]):[0-9]{1,5}\"\
    },\
    \"EndpointLists\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Endpoint\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"Endpoints\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EndPointType\"},\
      \"value\":{\"shape\":\"EndpointLists\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"Environment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Variables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p>Environment variable key-value pairs. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html\\\">Using Lambda environment variables</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A function's environment variable settings. You can use environment variables to adjust your function's behavior without updating code. An environment variable is a pair of strings that are stored in a function's version-specific configuration. </p>\"\
    },\
    \"EnvironmentError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"SensitiveString\",\
          \"documentation\":\"<p>The error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error messages for environment variables that couldn't be applied.</p>\"\
    },\
    \"EnvironmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Variables\":{\
          \"shape\":\"EnvironmentVariables\",\
          \"documentation\":\"<p>Environment variable key-value pairs.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"EnvironmentError\",\
          \"documentation\":\"<p>Error messages for environment variables that couldn't be applied.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The results of an operation to update or read environment variables. If the operation is successful, the response contains the environment variables. If it failed, the response contains details about the error.</p>\"\
    },\
    \"EnvironmentVariableName\":{\
      \"type\":\"string\",\
      \"pattern\":\"[a-zA-Z]([a-zA-Z0-9_])+\",\
      \"sensitive\":true\
    },\
    \"EnvironmentVariableValue\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"EnvironmentVariables\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"EnvironmentVariableName\"},\
      \"value\":{\"shape\":\"EnvironmentVariableValue\"},\
      \"sensitive\":true\
    },\
    \"EventSourceMappingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the event source mapping.</p>\"\
        },\
        \"StartingPosition\":{\
          \"shape\":\"EventSourcePosition\",\
          \"documentation\":\"<p>The position in a stream from which to start reading. Required for Amazon Kinesis, Amazon DynamoDB, and Amazon MSK stream sources. <code>AT_TIMESTAMP</code> is supported only for Amazon Kinesis streams.</p>\"\
        },\
        \"StartingPositionTimestamp\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the time from which to start reading.</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to your function. Lambda passes all of the records in the batch to the function in a single call, up to the payload limit for synchronous invocation (6 MB).</p> <p>Default value: Varies by service. For Amazon SQS, the default is 10. For all other services, the default is 100.</p> <p>Related setting: When you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>\"\
        },\
        \"MaximumBatchingWindowInSeconds\":{\
          \"shape\":\"MaximumBatchingWindowInSeconds\",\
          \"documentation\":\"<p>(Streams and Amazon SQS standard queues) The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the function.</p> <p>Default: 0</p> <p>Related setting: When you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>\"\
        },\
        \"ParallelizationFactor\":{\
          \"shape\":\"ParallelizationFactor\",\
          \"documentation\":\"<p>(Streams only) The number of batches to process concurrently from each shard. The default value is 1.</p>\"\
        },\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the event source.</p>\"\
        },\
        \"FilterCriteria\":{\
          \"shape\":\"FilterCriteria\",\
          \"documentation\":\"<p>(Streams and Amazon SQS) A object that defines the filter criteria used to determine whether Lambda should process an event. For more information, see Event filtering.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The ARN of the Lambda function.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date that the event source mapping was last updated or that its state changed.</p>\"\
        },\
        \"LastProcessingResult\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The result of the last Lambda invocation of your function.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The state of the event source mapping. It can be one of the following: <code>Creating</code>, <code>Enabling</code>, <code>Enabled</code>, <code>Disabling</code>, <code>Disabled</code>, <code>Updating</code>, or <code>Deleting</code>.</p>\"\
        },\
        \"StateTransitionReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Indicates whether a user or Lambda made the last change to the event source mapping.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"DestinationConfig\",\
          \"documentation\":\"<p>(Streams only) An Amazon SQS queue or Amazon SNS topic destination for discarded records.</p>\"\
        },\
        \"Topics\":{\
          \"shape\":\"Topics\",\
          \"documentation\":\"<p>The name of the Kafka topic.</p>\"\
        },\
        \"Queues\":{\
          \"shape\":\"Queues\",\
          \"documentation\":\"<p> (Amazon MQ) The name of the Amazon MQ broker destination queue to consume.</p>\"\
        },\
        \"SourceAccessConfigurations\":{\
          \"shape\":\"SourceAccessConfigurations\",\
          \"documentation\":\"<p>An array of the authentication protocol, VPC components, or virtual host to secure and define your event source.</p>\"\
        },\
        \"SelfManagedEventSource\":{\
          \"shape\":\"SelfManagedEventSource\",\
          \"documentation\":\"<p>The self-managed Apache Kafka cluster for your event source.</p>\"\
        },\
        \"MaximumRecordAgeInSeconds\":{\
          \"shape\":\"MaximumRecordAgeInSeconds\",\
          \"documentation\":\"<p>(Streams only) Discard records older than the specified age. The default value is -1, which sets the maximum age to infinite. When the value is set to infinite, Lambda never discards old records. </p>\"\
        },\
        \"BisectBatchOnFunctionError\":{\
          \"shape\":\"BisectBatchOnFunctionError\",\
          \"documentation\":\"<p>(Streams only) If the function returns an error, split the batch in two and retry. The default value is false.</p>\"\
        },\
        \"MaximumRetryAttempts\":{\
          \"shape\":\"MaximumRetryAttemptsEventSourceMapping\",\
          \"documentation\":\"<p>(Streams only) Discard records after the specified number of retries. The default value is -1, which sets the maximum number of retries to infinite. When MaximumRetryAttempts is infinite, Lambda retries failed records until the record expires in the event source.</p>\"\
        },\
        \"TumblingWindowInSeconds\":{\
          \"shape\":\"TumblingWindowInSeconds\",\
          \"documentation\":\"<p>(Streams only) The duration in seconds of a processing window. The range is 1â900 seconds.</p>\"\
        },\
        \"FunctionResponseTypes\":{\
          \"shape\":\"FunctionResponseTypeList\",\
          \"documentation\":\"<p>(Streams only) A list of current response type enums applied to the event source mapping.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A mapping between an Amazon Web Services resource and a Lambda function. For details, see <a>CreateEventSourceMapping</a>.</p>\"\
    },\
    \"EventSourceMappingsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventSourceMappingConfiguration\"}\
    },\
    \"EventSourcePosition\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRIM_HORIZON\",\
        \"LATEST\",\
        \"AT_TIMESTAMP\"\
      ]\
    },\
    \"EventSourceToken\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[a-zA-Z0-9._\\\\-]+\"\
    },\
    \"FileSystemArn\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"pattern\":\"arn:aws[a-zA-Z-]*:elasticfilesystem:[a-z]{2}((-gov)|(-iso(b?)))?-[a-z]+-\\\\d{1}:\\\\d{12}:access-point/fsap-[a-f0-9]{17}\"\
    },\
    \"FileSystemConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Arn\",\
        \"LocalMountPath\"\
      ],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"FileSystemArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon EFS access point that provides access to the file system.</p>\"\
        },\
        \"LocalMountPath\":{\
          \"shape\":\"LocalMountPath\",\
          \"documentation\":\"<p>The path where the function can access the file system, starting with <code>/mnt/</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the connection between a Lambda function and an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html\\\">Amazon EFS file system</a>.</p>\"\
    },\
    \"FileSystemConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FileSystemConfig\"},\
      \"max\":1\
    },\
    \"Filter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Pattern\":{\
          \"shape\":\"Pattern\",\
          \"documentation\":\"<p> A filter pattern. For more information on the syntax of a filter pattern, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-syntax\\\"> Filter criteria syntax</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p> An object that specifies a filter criteria. </p>\"\
    },\
    \"FilterCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filters\":{\
          \"shape\":\"FilterList\",\
          \"documentation\":\"<p> A list of filters. </p>\"\
        }\
      },\
      \"documentation\":\"<p> An object that contains the filters on the event source. </p>\"\
    },\
    \"FilterList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Filter\"}\
    },\
    \"FunctionArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"FunctionArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionArn\"}\
    },\
    \"FunctionCode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The base64-encoded contents of the deployment package. Amazon Web Services SDK and Amazon Web Services CLI clients handle the encoding for you.</p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be in a different Amazon Web Services account.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 key of the deployment package.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>For versioned objects, the version of the deployment package object to use.</p>\"\
        },\
        \"ImageUri\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>URI of a <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html\\\">container image</a> in the Amazon ECR registry.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The code for the Lambda function. You can specify either an object in Amazon S3, upload a .zip file archive deployment package directly, or specify the URI of a container image.</p>\"\
    },\
    \"FunctionCodeLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The service that's hosting the file.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A presigned URL that you can use to download the deployment package.</p>\"\
        },\
        \"ImageUri\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>URI of a container image in the Amazon ECR registry.</p>\"\
        },\
        \"ResolvedImageUri\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resolved URI for the image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a function's deployment package.</p>\"\
    },\
    \"FunctionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the function.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"NameSpacedFunctionArn\",\
          \"documentation\":\"<p>The function's Amazon Resource Name (ARN).</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The runtime environment for the Lambda function.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The function's execution role.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The function that Lambda calls to begin executing your function.</p>\"\
        },\
        \"CodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the function's deployment package, in bytes.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The function's description.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The amount of time in seconds that Lambda allows a function to run before stopping it.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of memory available to the function at runtime. </p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the function was last updated, in <a href=\\\"https://www.w3.org/TR/NOTE-datetime\\\">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The SHA256 hash of the function's deployment package.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the Lambda function.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfigResponse\",\
          \"documentation\":\"<p>The function's networking configuration.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"DeadLetterConfig\",\
          \"documentation\":\"<p>The function's dead letter queue.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"EnvironmentResponse\",\
          \"documentation\":\"<p>The function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html\\\">environment variables</a>.</p>\"\
        },\
        \"KMSKeyArn\":{\
          \"shape\":\"KMSKeyArn\",\
          \"documentation\":\"<p>The KMS key that's used to encrypt the function's environment variables. This key is only returned if you've configured a customer managed key.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"TracingConfigResponse\",\
          \"documentation\":\"<p>The function's X-Ray tracing configuration.</p>\"\
        },\
        \"MasterArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>For Lambda@Edge functions, the ARN of the main function.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The latest updated revision of the function or alias.</p>\"\
        },\
        \"Layers\":{\
          \"shape\":\"LayersReferenceList\",\
          \"documentation\":\"<p>The function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\"> layers</a>.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"State\",\
          \"documentation\":\"<p>The current state of the function. When the state is <code>Inactive</code>, you can reactivate the function by invoking it.</p>\"\
        },\
        \"StateReason\":{\
          \"shape\":\"StateReason\",\
          \"documentation\":\"<p>The reason for the function's current state.</p>\"\
        },\
        \"StateReasonCode\":{\
          \"shape\":\"StateReasonCode\",\
          \"documentation\":\"<p>The reason code for the function's current state. When the code is <code>Creating</code>, you can't invoke or modify the function.</p>\"\
        },\
        \"LastUpdateStatus\":{\
          \"shape\":\"LastUpdateStatus\",\
          \"documentation\":\"<p>The status of the last update that was performed on the function. This is first set to <code>Successful</code> after function creation completes.</p>\"\
        },\
        \"LastUpdateStatusReason\":{\
          \"shape\":\"LastUpdateStatusReason\",\
          \"documentation\":\"<p>The reason for the last update that was performed on the function.</p>\"\
        },\
        \"LastUpdateStatusReasonCode\":{\
          \"shape\":\"LastUpdateStatusReasonCode\",\
          \"documentation\":\"<p>The reason code for the last update that was performed on the function.</p>\"\
        },\
        \"FileSystemConfigs\":{\
          \"shape\":\"FileSystemConfigList\",\
          \"documentation\":\"<p>Connection settings for an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html\\\">Amazon EFS file system</a>.</p>\"\
        },\
        \"PackageType\":{\
          \"shape\":\"PackageType\",\
          \"documentation\":\"<p>The type of deployment package. Set to <code>Image</code> for container image and set <code>Zip</code> for .zip file archive.</p>\"\
        },\
        \"ImageConfigResponse\":{\
          \"shape\":\"ImageConfigResponse\",\
          \"documentation\":\"<p>The function's image configuration values.</p>\"\
        },\
        \"SigningProfileVersionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the signing profile version.</p>\"\
        },\
        \"SigningJobArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the signing job.</p>\"\
        },\
        \"Architectures\":{\
          \"shape\":\"ArchitecturesList\",\
          \"documentation\":\"<p>The instruction set architecture that the function supports. Architecture is a string array with one of the valid values. The default architecture value is <code>x86_64</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a function's configuration.</p>\"\
    },\
    \"FunctionEventInvokeConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LastModified\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The date and time that the configuration was last updated.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function.</p>\"\
        },\
        \"MaximumRetryAttempts\":{\
          \"shape\":\"MaximumRetryAttempts\",\
          \"documentation\":\"<p>The maximum number of times to retry when the function returns an error.</p>\"\
        },\
        \"MaximumEventAgeInSeconds\":{\
          \"shape\":\"MaximumEventAgeInSeconds\",\
          \"documentation\":\"<p>The maximum age of a request that Lambda sends to a function for processing.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"DestinationConfig\",\
          \"documentation\":\"<p>A destination for events after they have been sent to a function for processing.</p> <p class=\\\"title\\\"> <b>Destinations</b> </p> <ul> <li> <p> <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.</p> </li> <li> <p> <b>Queue</b> - The ARN of an SQS queue.</p> </li> <li> <p> <b>Topic</b> - The ARN of an SNS topic.</p> </li> <li> <p> <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"FunctionEventInvokeConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionEventInvokeConfig\"}\
    },\
    \"FunctionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionConfiguration\"}\
    },\
    \"FunctionName\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"FunctionResponseType\":{\
      \"type\":\"string\",\
      \"enum\":[\"ReportBatchItemFailures\"]\
    },\
    \"FunctionResponseTypeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionResponseType\"},\
      \"max\":1,\
      \"min\":0\
    },\
    \"FunctionUrl\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":40\
    },\
    \"FunctionUrlConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionUrl\",\
        \"FunctionArn\",\
        \"CreationTime\",\
        \"LastModifiedTime\",\
        \"AuthorizationType\"\
      ],\
      \"members\":{\
        \"FunctionUrl\":{\"shape\":\"FunctionUrl\"},\
        \"FunctionArn\":{\"shape\":\"FunctionArn\"},\
        \"CreationTime\":{\"shape\":\"Timestamp\"},\
        \"LastModifiedTime\":{\"shape\":\"Timestamp\"},\
        \"Cors\":{\"shape\":\"Cors\"},\
        \"AuthorizationType\":{\"shape\":\"AuthorizationType\"}\
      }\
    },\
    \"FunctionUrlConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionUrlConfig\"}\
    },\
    \"FunctionUrlQualifier\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(^\\\\$LATEST$)|((?!^[0-9]+$)([a-zA-Z0-9-_]+))\"\
    },\
    \"FunctionVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\"ALL\"]\
    },\
    \"GetAccountSettingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"GetAccountSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccountLimit\":{\
          \"shape\":\"AccountLimit\",\
          \"documentation\":\"<p>Limits that are related to concurrency and code storage.</p>\"\
        },\
        \"AccountUsage\":{\
          \"shape\":\"AccountUsage\",\
          \"documentation\":\"<p>The number of functions and amount of storage in use.</p>\"\
        }\
      }\
    },\
    \"GetAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The name of the alias.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        }\
      }\
    },\
    \"GetCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfigArn\"],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeSigningConfigArn\"\
        }\
      }\
    },\
    \"GetCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfig\"],\
      \"members\":{\
        \"CodeSigningConfig\":{\
          \"shape\":\"CodeSigningConfig\",\
          \"documentation\":\"<p>The code signing configuration</p>\"\
        }\
      }\
    },\
    \"GetEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the event source mapping.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        }\
      }\
    },\
    \"GetFunctionCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        }\
      }\
    },\
    \"GetFunctionCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeSigningConfigArn\",\
        \"FunctionName\"\
      ],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\"\
        }\
      }\
    },\
    \"GetFunctionConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        }\
      }\
    },\
    \"GetFunctionConcurrencyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReservedConcurrentExecutions\":{\
          \"shape\":\"ReservedConcurrentExecutions\",\
          \"documentation\":\"<p>The number of simultaneous executions that are reserved for the function.</p>\"\
        }\
      }\
    },\
    \"GetFunctionConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to get details about a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionEventInvokeConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>A version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to get details about a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Configuration\":{\
          \"shape\":\"FunctionConfiguration\",\
          \"documentation\":\"<p>The configuration of the function or version.</p>\"\
        },\
        \"Code\":{\
          \"shape\":\"FunctionCodeLocation\",\
          \"documentation\":\"<p>The deployment package of the function or version.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/tagging.html\\\">tags</a>.</p>\"\
        },\
        \"Concurrency\":{\
          \"shape\":\"Concurrency\",\
          \"documentation\":\"<p>The function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html\\\">reserved concurrency</a>.</p>\"\
        }\
      }\
    },\
    \"GetFunctionUrlConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"FunctionUrlQualifier\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionUrlConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionUrl\",\
        \"FunctionArn\",\
        \"AuthorizationType\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"FunctionUrl\":{\"shape\":\"FunctionUrl\"},\
        \"FunctionArn\":{\"shape\":\"FunctionArn\"},\
        \"AuthorizationType\":{\"shape\":\"AuthorizationType\"},\
        \"Cors\":{\"shape\":\"Cors\"},\
        \"CreationTime\":{\"shape\":\"Timestamp\"},\
        \"LastModifiedTime\":{\"shape\":\"Timestamp\"}\
      }\
    },\
    \"GetLayerVersionByArnRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Arn\"],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"LayerVersionArn\",\
          \"documentation\":\"<p>The ARN of the layer version.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Arn\"\
        }\
      }\
    },\
    \"GetLayerVersionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LayerName\",\
        \"VersionNumber\"\
      ],\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VersionNumber\"\
        }\
      }\
    },\
    \"GetLayerVersionPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The policy document.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for the current revision of the policy.</p>\"\
        }\
      }\
    },\
    \"GetLayerVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LayerName\",\
        \"VersionNumber\"\
      ],\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VersionNumber\"\
        }\
      }\
    },\
    \"GetLayerVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Content\":{\
          \"shape\":\"LayerVersionContentOutput\",\
          \"documentation\":\"<p>Details about the layer version.</p>\"\
        },\
        \"LayerArn\":{\
          \"shape\":\"LayerArn\",\
          \"documentation\":\"<p>The ARN of the layer.</p>\"\
        },\
        \"LayerVersionArn\":{\
          \"shape\":\"LayerVersionArn\",\
          \"documentation\":\"<p>The ARN of the layer version.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the version.</p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the layer version was created, in <a href=\\\"https://www.w3.org/TR/NOTE-datetime\\\">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\"\
        },\
        \"CompatibleRuntimes\":{\
          \"shape\":\"CompatibleRuntimes\",\
          \"documentation\":\"<p>The layer's compatible runtimes.</p>\"\
        },\
        \"LicenseInfo\":{\
          \"shape\":\"LicenseInfo\",\
          \"documentation\":\"<p>The layer's software license.</p>\"\
        },\
        \"CompatibleArchitectures\":{\
          \"shape\":\"CompatibleArchitectures\",\
          \"documentation\":\"<p>A list of compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architectures</a>.</p>\"\
        }\
      }\
    },\
    \"GetPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to get the policy for that resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource-based policy.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A unique identifier for the current revision of the policy.</p>\"\
        }\
      }\
    },\
    \"GetProvisionedConcurrencyConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Qualifier\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>The version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetProvisionedConcurrencyConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestedProvisionedConcurrentExecutions\":{\
          \"shape\":\"PositiveInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency requested.</p>\"\
        },\
        \"AvailableProvisionedConcurrentExecutions\":{\
          \"shape\":\"NonNegativeInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency available.</p>\"\
        },\
        \"AllocatedProvisionedConcurrentExecutions\":{\
          \"shape\":\"NonNegativeInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency allocated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ProvisionedConcurrencyStatusEnum\",\
          \"documentation\":\"<p>The status of the allocation process.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>For failed allocations, the reason that provisioned concurrency could not be allocated.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that a user last updated the configuration, in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601 format</a>.</p>\"\
        }\
      }\
    },\
    \"Handler\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[^\\\\s]+\"\
    },\
    \"Header\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\".*\"\
    },\
    \"HeadersList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Header\"},\
      \"max\":100\
    },\
    \"HttpStatus\":{\"type\":\"integer\"},\
    \"ImageConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntryPoint\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>Specifies the entry point to their application, which is typically the location of the runtime executable.</p>\"\
        },\
        \"Command\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>Specifies parameters that you want to pass in with ENTRYPOINT. </p>\"\
        },\
        \"WorkingDirectory\":{\
          \"shape\":\"WorkingDirectory\",\
          \"documentation\":\"<p>Specifies the working directory.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration values that override the container image Dockerfile settings. See <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms\\\">Container settings</a>. </p>\"\
    },\
    \"ImageConfigError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ErrorCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Error code.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"SensitiveString\",\
          \"documentation\":\"<p>Error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Error response to GetFunctionConfiguration.</p>\"\
    },\
    \"ImageConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ImageConfig\":{\
          \"shape\":\"ImageConfig\",\
          \"documentation\":\"<p>Configuration values that override the container image Dockerfile.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"ImageConfigError\",\
          \"documentation\":\"<p>Error response to GetFunctionConfiguration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Response to GetFunctionConfiguration request.</p>\"\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InvalidCodeSignatureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The code signature failed the integrity check. Lambda always blocks deployment if the integrity check fails, even if code signing policy is set to WARN.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One of the parameters in the request is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRequestContentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRuntimeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The runtime or runtime version specified is not supported.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidSecurityGroupIDException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Security Group ID provided in the Lambda function VPC configuration is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidSubnetIDException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Subnet ID provided in the Lambda function VPC configuration is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidZipFileException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda could not unzip the deployment package.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvocationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"InvocationType\":{\
          \"shape\":\"InvocationType\",\
          \"documentation\":\"<p>Choose from the following options.</p> <ul> <li> <p> <code>RequestResponse</code> (default) - Invoke the function synchronously. Keep the connection open until the function returns a response or times out. The API response includes the function response and additional data.</p> </li> <li> <p> <code>Event</code> - Invoke the function asynchronously. Send events that fail multiple times to the function's dead-letter queue (if it's configured). The API response only includes a status code.</p> </li> <li> <p> <code>DryRun</code> - Validate parameter values and verify that the user or role has permission to invoke the function.</p> </li> </ul>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Invocation-Type\"\
        },\
        \"LogType\":{\
          \"shape\":\"LogType\",\
          \"documentation\":\"<p>Set to <code>Tail</code> to include the execution log in the response. Applies to synchronously invoked functions only.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Log-Type\"\
        },\
        \"ClientContext\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Up to 3583 bytes of base64-encoded data about the invoking client to pass to the function in the context object.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Client-Context\"\
        },\
        \"Payload\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The JSON that you want to provide to your Lambda function as input.</p> <p>You can enter the JSON directly. For example, <code>--payload '{ \\\"key\\\": \\\"value\\\" }'</code>. You can also specify a file path. For example, <code>--payload file://payload.json</code>. </p>\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to invoke a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      },\
      \"payload\":\"Payload\"\
    },\
    \"InvocationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The HTTP status code is in the 200 range for a successful request. For the <code>RequestResponse</code> invocation type, this status code is 200. For the <code>Event</code> invocation type, this status code is 202. For the <code>DryRun</code> invocation type, the status code is 204.</p>\",\
          \"location\":\"statusCode\"\
        },\
        \"FunctionError\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If present, indicates that an error occurred during function execution. Details about the error are included in the response payload.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Function-Error\"\
        },\
        \"LogResult\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The last 4 KB of the execution log, which is base64 encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Log-Result\"\
        },\
        \"Payload\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The response from the function, or an error object.</p>\"\
        },\
        \"ExecutedVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the function that executed. When you invoke a function with an alias, this indicates which version the alias resolved to.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Executed-Version\"\
        }\
      },\
      \"payload\":\"Payload\"\
    },\
    \"InvocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Event\",\
        \"RequestResponse\",\
        \"DryRun\"\
      ]\
    },\
    \"InvokeAsyncRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"InvokeArgs\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"InvokeArgs\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p>The JSON that you want to provide to your Lambda function as input.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"payload\":\"InvokeArgs\"\
    },\
    \"InvokeAsyncResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"HttpStatus\",\
          \"documentation\":\"<p>The status code.</p>\",\
          \"location\":\"statusCode\"\
        }\
      },\
      \"documentation\":\"<p>A success response (<code>202 Accepted</code>) indicates that the request is queued for invocation. </p>\",\
      \"deprecated\":true\
    },\
    \"KMSAccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because KMS access was denied. Check the Lambda function's KMS permissions.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"KMSDisabledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because the KMS key used is disabled. Check the Lambda function's KMS key settings.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"KMSInvalidStateException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because the KMS key used is in an invalid state for Decrypt. Check the function's KMS key settings.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"KMSKeyArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()\"\
    },\
    \"KMSNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was unable to decrypt the environment variables because the KMS key was not found. Check the function's KMS key settings. </p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"LastUpdateStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Successful\",\
        \"Failed\",\
        \"InProgress\"\
      ]\
    },\
    \"LastUpdateStatusReason\":{\"type\":\"string\"},\
    \"LastUpdateStatusReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EniLimitExceeded\",\
        \"InsufficientRolePermissions\",\
        \"InvalidConfiguration\",\
        \"InternalError\",\
        \"SubnetOutOfIPAddresses\",\
        \"InvalidSubnet\",\
        \"InvalidSecurityGroup\",\
        \"ImageDeleted\",\
        \"ImageAccessDenied\",\
        \"InvalidImage\"\
      ]\
    },\
    \"Layer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"LayerVersionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function layer.</p>\"\
        },\
        \"CodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the layer archive in bytes.</p>\"\
        },\
        \"SigningProfileVersionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for a signing profile version.</p>\"\
        },\
        \"SigningJobArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a signing job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>.</p>\"\
    },\
    \"LayerArn\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\\\\d{12}:layer:[a-zA-Z0-9-_]+\"\
    },\
    \"LayerList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LayerVersionArn\"}\
    },\
    \"LayerName\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\\\\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+\"\
    },\
    \"LayerPermissionAllowedAction\":{\
      \"type\":\"string\",\
      \"max\":22,\
      \"pattern\":\"lambda:GetLayerVersion\"\
    },\
    \"LayerPermissionAllowedPrincipal\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d{12}|\\\\*|arn:(aws[a-zA-Z-]*):iam::\\\\d{12}:root\"\
    },\
    \"LayerVersionArn\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\\\\d{12}:layer:[a-zA-Z0-9-_]+:[0-9]+\"\
    },\
    \"LayerVersionContentInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The Amazon S3 bucket of the layer archive.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 key of the layer archive.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>For versioned objects, the version of the layer archive object to use.</p>\"\
        },\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The base64-encoded contents of the layer archive. Amazon Web Services SDK and Amazon Web Services CLI clients handle the encoding for you.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A ZIP archive that contains the contents of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>. You can specify either an Amazon S3 location, or upload a layer archive directly.</p>\"\
    },\
    \"LayerVersionContentOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A link to the layer archive in Amazon S3 that is valid for 10 minutes.</p>\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The SHA-256 hash of the layer archive.</p>\"\
        },\
        \"CodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size of the layer archive in bytes.</p>\"\
        },\
        \"SigningProfileVersionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for a signing profile version.</p>\"\
        },\
        \"SigningJobArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a signing job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>.</p>\"\
    },\
    \"LayerVersionNumber\":{\"type\":\"long\"},\
    \"LayerVersionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LayerVersionsListItem\"}\
    },\
    \"LayerVersionsListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LayerVersionArn\":{\
          \"shape\":\"LayerVersionArn\",\
          \"documentation\":\"<p>The ARN of the layer version.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the version.</p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the version was created, in ISO 8601 format. For example, <code>2018-11-27T15:10:45.123+0000</code>.</p>\"\
        },\
        \"CompatibleRuntimes\":{\
          \"shape\":\"CompatibleRuntimes\",\
          \"documentation\":\"<p>The layer's compatible runtimes.</p>\"\
        },\
        \"LicenseInfo\":{\
          \"shape\":\"LicenseInfo\",\
          \"documentation\":\"<p>The layer's open-source license.</p>\"\
        },\
        \"CompatibleArchitectures\":{\
          \"shape\":\"CompatibleArchitectures\",\
          \"documentation\":\"<p>A list of compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architectures</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a version of an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>.</p>\"\
    },\
    \"LayersList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LayersListItem\"}\
    },\
    \"LayersListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name of the layer.</p>\"\
        },\
        \"LayerArn\":{\
          \"shape\":\"LayerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function layer.</p>\"\
        },\
        \"LatestMatchingVersion\":{\
          \"shape\":\"LayerVersionsListItem\",\
          \"documentation\":\"<p>The newest version of the layer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">Lambda layer</a>.</p>\"\
    },\
    \"LayersReferenceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Layer\"}\
    },\
    \"LicenseInfo\":{\
      \"type\":\"string\",\
      \"max\":512\
    },\
    \"ListAliasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Specify a function version to only list aliases that invoke that version.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionVersion\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Limit the number of aliases returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        },\
        \"Aliases\":{\
          \"shape\":\"AliasList\",\
          \"documentation\":\"<p>A list of aliases.</p>\"\
        }\
      }\
    },\
    \"ListCodeSigningConfigsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Maximum number of items to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListCodeSigningConfigsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        },\
        \"CodeSigningConfigs\":{\
          \"shape\":\"CodeSigningConfigList\",\
          \"documentation\":\"<p>The code signing configurations</p>\"\
        }\
      }\
    },\
    \"ListEventSourceMappingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the event source.</p> <ul> <li> <p> <b>Amazon Kinesis</b> - The ARN of the data stream or a stream consumer.</p> </li> <li> <p> <b>Amazon DynamoDB Streams</b> - The ARN of the stream.</p> </li> <li> <p> <b>Amazon Simple Queue Service</b> - The ARN of the queue.</p> </li> <li> <p> <b>Amazon Managed Streaming for Apache Kafka</b> - The ARN of the cluster.</p> </li> </ul>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"EventSourceArn\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token returned by a previous call.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>The maximum number of event source mappings to return. Note that ListEventSourceMappings returns a maximum of 100 items in each response, even if you set the number higher.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListEventSourceMappingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token that's returned when the response doesn't contain all event source mappings.</p>\"\
        },\
        \"EventSourceMappings\":{\
          \"shape\":\"EventSourceMappingsList\",\
          \"documentation\":\"<p>A list of event source mappings.</p>\"\
        }\
      }\
    },\
    \"ListFunctionEventInvokeConfigsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxFunctionEventInvokeConfigListItems\",\
          \"documentation\":\"<p>The maximum number of configurations to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListFunctionEventInvokeConfigsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FunctionEventInvokeConfigs\":{\
          \"shape\":\"FunctionEventInvokeConfigList\",\
          \"documentation\":\"<p>A list of configurations.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        }\
      }\
    },\
    \"ListFunctionUrlConfigsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxItems\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListFunctionUrlConfigsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionUrlConfigs\"],\
      \"members\":{\
        \"FunctionUrlConfigs\":{\"shape\":\"FunctionUrlConfigList\"},\
        \"NextMarker\":{\"shape\":\"String\"}\
      }\
    },\
    \"ListFunctionsByCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfigArn\"],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeSigningConfigArn\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Maximum number of items to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListFunctionsByCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        },\
        \"FunctionArns\":{\
          \"shape\":\"FunctionArnList\",\
          \"documentation\":\"<p>The function ARNs. </p>\"\
        }\
      }\
    },\
    \"ListFunctionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MasterRegion\":{\
          \"shape\":\"MasterRegion\",\
          \"documentation\":\"<p>For Lambda@Edge functions, the Amazon Web Services Region of the master function. For example, <code>us-east-1</code> filters the list of functions to only include Lambda@Edge functions replicated from a master function in US East (N. Virginia). If specified, you must set <code>FunctionVersion</code> to <code>ALL</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MasterRegion\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"FunctionVersion\",\
          \"documentation\":\"<p>Set to <code>ALL</code> to include entries for all published versions of each function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionVersion\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>The maximum number of functions to return in the response. Note that <code>ListFunctions</code> returns a maximum of 50 items in each response, even if you set the number higher.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListFunctionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        },\
        \"Functions\":{\
          \"shape\":\"FunctionList\",\
          \"documentation\":\"<p>A list of Lambda functions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A list of Lambda functions.</p>\"\
    },\
    \"ListLayerVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"LayerName\"],\
      \"members\":{\
        \"CompatibleRuntime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>A runtime identifier. For example, <code>go1.x</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"CompatibleRuntime\"\
        },\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token returned by a previous call.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxLayerListItems\",\
          \"documentation\":\"<p>The maximum number of versions to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        },\
        \"CompatibleArchitecture\":{\
          \"shape\":\"Architecture\",\
          \"documentation\":\"<p>The compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architecture</a>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"CompatibleArchitecture\"\
        }\
      }\
    },\
    \"ListLayerVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token returned when the response doesn't contain all versions.</p>\"\
        },\
        \"LayerVersions\":{\
          \"shape\":\"LayerVersionsList\",\
          \"documentation\":\"<p>A list of versions.</p>\"\
        }\
      }\
    },\
    \"ListLayersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CompatibleRuntime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>A runtime identifier. For example, <code>go1.x</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"CompatibleRuntime\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token returned by a previous call.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxLayerListItems\",\
          \"documentation\":\"<p>The maximum number of layers to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        },\
        \"CompatibleArchitecture\":{\
          \"shape\":\"Architecture\",\
          \"documentation\":\"<p>The compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architecture</a>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"CompatibleArchitecture\"\
        }\
      }\
    },\
    \"ListLayersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A pagination token returned when the response doesn't contain all layers.</p>\"\
        },\
        \"Layers\":{\
          \"shape\":\"LayersList\",\
          \"documentation\":\"<p>A list of function layers.</p>\"\
        }\
      }\
    },\
    \"ListProvisionedConcurrencyConfigsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxProvisionedConcurrencyConfigListItems\",\
          \"documentation\":\"<p>Specify a number to limit the number of configurations returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListProvisionedConcurrencyConfigsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProvisionedConcurrencyConfigs\":{\
          \"shape\":\"ProvisionedConcurrencyConfigList\",\
          \"documentation\":\"<p>A list of provisioned concurrency configurations.</p>\"\
        },\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        }\
      }\
    },\
    \"ListTagsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Resource\"],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The function's Amazon Resource Name (ARN). Note: Lambda does not support adding tags to aliases or versions.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ARN\"\
        }\
      }\
    },\
    \"ListTagsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The function's tags.</p>\"\
        }\
      }\
    },\
    \"ListVersionsByFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"NamespacedFunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specify the pagination token that's returned by a previous request to retrieve the next page of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>The maximum number of versions to return. Note that <code>ListVersionsByFunction</code> returns a maximum of 50 items in each response, even if you set the number higher.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListVersionsByFunctionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The pagination token that's included if more results are available.</p>\"\
        },\
        \"Versions\":{\
          \"shape\":\"FunctionList\",\
          \"documentation\":\"<p>A list of Lambda function versions.</p>\"\
        }\
      }\
    },\
    \"LocalMountPath\":{\
      \"type\":\"string\",\
      \"max\":160,\
      \"pattern\":\"^/mnt/[a-zA-Z0-9-_.]+$\"\
    },\
    \"LogType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Tail\"\
      ]\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MasterRegion\":{\
      \"type\":\"string\",\
      \"pattern\":\"ALL|[a-z]{2}(-gov)?-[a-z]+-\\\\d{1}\"\
    },\
    \"MaxAge\":{\
      \"type\":\"integer\",\
      \"max\":86400,\
      \"min\":0\
    },\
    \"MaxFunctionEventInvokeConfigListItems\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"MaxItems\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"MaxLayerListItems\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"MaxListItems\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"MaxProvisionedConcurrencyConfigListItems\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"MaximumBatchingWindowInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":300,\
      \"min\":0\
    },\
    \"MaximumEventAgeInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":21600,\
      \"min\":60\
    },\
    \"MaximumRecordAgeInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":604800,\
      \"min\":-1\
    },\
    \"MaximumRetryAttempts\":{\
      \"type\":\"integer\",\
      \"max\":2,\
      \"min\":0\
    },\
    \"MaximumRetryAttemptsEventSourceMapping\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":-1\
    },\
    \"MemorySize\":{\
      \"type\":\"integer\",\
      \"max\":10240,\
      \"min\":128\
    },\
    \"Method\":{\
      \"type\":\"string\",\
      \"max\":6,\
      \"pattern\":\".*\"\
    },\
    \"NameSpacedFunctionArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_\\\\.]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"NamespacedFunctionName\":{\
      \"type\":\"string\",\
      \"max\":170,\
      \"min\":1,\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_\\\\.]+)(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"NamespacedStatementId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"([a-zA-Z0-9-_.]+)\"\
    },\
    \"NonNegativeInteger\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"OnFailure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Destination\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the destination resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A destination for events that failed processing.</p>\"\
    },\
    \"OnSuccess\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Destination\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the destination resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A destination for events that were processed successfully.</p>\"\
    },\
    \"OrganizationId\":{\
      \"type\":\"string\",\
      \"max\":34,\
      \"pattern\":\"o-[a-z0-9]{10,32}\"\
    },\
    \"Origin\":{\
      \"type\":\"string\",\
      \"max\":253,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"PackageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Zip\",\
        \"Image\"\
      ]\
    },\
    \"ParallelizationFactor\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"Pattern\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0,\
      \"pattern\":\".*\"\
    },\
    \"PolicyLengthExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The permissions policy for the resource is too large. <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Learn more</a> </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"PositiveInteger\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"PreconditionFailedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The RevisionId provided does not match the latest RevisionId for the Lambda function or alias. Call the <code>GetFunction</code> or the <code>GetAlias</code> API to retrieve the latest RevisionId for your resource.</p>\",\
      \"error\":{\"httpStatusCode\":412},\
      \"exception\":true\
    },\
    \"Principal\":{\
      \"type\":\"string\",\
      \"pattern\":\"[^\\\\s]+\"\
    },\
    \"ProvisionedConcurrencyConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProvisionedConcurrencyConfigListItem\"}\
    },\
    \"ProvisionedConcurrencyConfigListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the alias or version.</p>\"\
        },\
        \"RequestedProvisionedConcurrentExecutions\":{\
          \"shape\":\"PositiveInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency requested.</p>\"\
        },\
        \"AvailableProvisionedConcurrentExecutions\":{\
          \"shape\":\"NonNegativeInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency available.</p>\"\
        },\
        \"AllocatedProvisionedConcurrentExecutions\":{\
          \"shape\":\"NonNegativeInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency allocated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ProvisionedConcurrencyStatusEnum\",\
          \"documentation\":\"<p>The status of the allocation process.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>For failed allocations, the reason that provisioned concurrency could not be allocated.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that a user last updated the configuration, in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601 format</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about the provisioned concurrency configuration for a function alias or version.</p>\"\
    },\
    \"ProvisionedConcurrencyConfigNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified configuration does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ProvisionedConcurrencyStatusEnum\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    },\
    \"PublishLayerVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LayerName\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the version.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"LayerVersionContentInput\",\
          \"documentation\":\"<p>The function layer archive.</p>\"\
        },\
        \"CompatibleRuntimes\":{\
          \"shape\":\"CompatibleRuntimes\",\
          \"documentation\":\"<p>A list of compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html\\\">function runtimes</a>. Used for filtering with <a>ListLayers</a> and <a>ListLayerVersions</a>.</p>\"\
        },\
        \"LicenseInfo\":{\
          \"shape\":\"LicenseInfo\",\
          \"documentation\":\"<p>The layer's software license. It can be any of the following:</p> <ul> <li> <p>An <a href=\\\"https://spdx.org/licenses/\\\">SPDX license identifier</a>. For example, <code>MIT</code>.</p> </li> <li> <p>The URL of a license hosted on the internet. For example, <code>https://opensource.org/licenses/MIT</code>.</p> </li> <li> <p>The full text of the license.</p> </li> </ul>\"\
        },\
        \"CompatibleArchitectures\":{\
          \"shape\":\"CompatibleArchitectures\",\
          \"documentation\":\"<p>A list of compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architectures</a>.</p>\"\
        }\
      }\
    },\
    \"PublishLayerVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Content\":{\
          \"shape\":\"LayerVersionContentOutput\",\
          \"documentation\":\"<p>Details about the layer version.</p>\"\
        },\
        \"LayerArn\":{\
          \"shape\":\"LayerArn\",\
          \"documentation\":\"<p>The ARN of the layer.</p>\"\
        },\
        \"LayerVersionArn\":{\
          \"shape\":\"LayerVersionArn\",\
          \"documentation\":\"<p>The ARN of the layer version.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the version.</p>\"\
        },\
        \"CreatedDate\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the layer version was created, in <a href=\\\"https://www.w3.org/TR/NOTE-datetime\\\">ISO-8601 format</a> (YYYY-MM-DDThh:mm:ss.sTZD).</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\"\
        },\
        \"CompatibleRuntimes\":{\
          \"shape\":\"CompatibleRuntimes\",\
          \"documentation\":\"<p>The layer's compatible runtimes.</p>\"\
        },\
        \"LicenseInfo\":{\
          \"shape\":\"LicenseInfo\",\
          \"documentation\":\"<p>The layer's software license.</p>\"\
        },\
        \"CompatibleArchitectures\":{\
          \"shape\":\"CompatibleArchitectures\",\
          \"documentation\":\"<p>A list of compatible <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html\\\">instruction set architectures</a>.</p>\"\
        }\
      }\
    },\
    \"PublishVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only publish a version if the hash value matches the value that's specified. Use this option to avoid publishing a version if the function code has changed since you last updated it. You can get the hash for the version that you uploaded from the output of <a>UpdateFunctionCode</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description for the version to override the description in the function configuration.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the function if the revision ID matches the ID that's specified. Use this option to avoid publishing a version if the function configuration has changed since you last updated it.</p>\"\
        }\
      }\
    },\
    \"PutFunctionCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeSigningConfigArn\",\
        \"FunctionName\"\
      ],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        }\
      }\
    },\
    \"PutFunctionCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CodeSigningConfigArn\",\
        \"FunctionName\"\
      ],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\"\
        }\
      }\
    },\
    \"PutFunctionConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"ReservedConcurrentExecutions\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"ReservedConcurrentExecutions\":{\
          \"shape\":\"ReservedConcurrentExecutions\",\
          \"documentation\":\"<p>The number of simultaneous executions to reserve for the function.</p>\"\
        }\
      }\
    },\
    \"PutFunctionEventInvokeConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>A version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"MaximumRetryAttempts\":{\
          \"shape\":\"MaximumRetryAttempts\",\
          \"documentation\":\"<p>The maximum number of times to retry when the function returns an error.</p>\"\
        },\
        \"MaximumEventAgeInSeconds\":{\
          \"shape\":\"MaximumEventAgeInSeconds\",\
          \"documentation\":\"<p>The maximum age of a request that Lambda sends to a function for processing.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"DestinationConfig\",\
          \"documentation\":\"<p>A destination for events after they have been sent to a function for processing.</p> <p class=\\\"title\\\"> <b>Destinations</b> </p> <ul> <li> <p> <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.</p> </li> <li> <p> <b>Queue</b> - The ARN of an SQS queue.</p> </li> <li> <p> <b>Topic</b> - The ARN of an SNS topic.</p> </li> <li> <p> <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"PutProvisionedConcurrencyConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Qualifier\",\
        \"ProvisionedConcurrentExecutions\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>The version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"ProvisionedConcurrentExecutions\":{\
          \"shape\":\"PositiveInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency to allocate for the version or alias.</p>\"\
        }\
      }\
    },\
    \"PutProvisionedConcurrencyConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RequestedProvisionedConcurrentExecutions\":{\
          \"shape\":\"PositiveInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency requested.</p>\"\
        },\
        \"AvailableProvisionedConcurrentExecutions\":{\
          \"shape\":\"NonNegativeInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency available.</p>\"\
        },\
        \"AllocatedProvisionedConcurrentExecutions\":{\
          \"shape\":\"NonNegativeInteger\",\
          \"documentation\":\"<p>The amount of provisioned concurrency allocated.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ProvisionedConcurrencyStatusEnum\",\
          \"documentation\":\"<p>The status of the allocation process.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>For failed allocations, the reason that provisioned concurrency could not be allocated.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that a user last updated the configuration, in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601 format</a>.</p>\"\
        }\
      }\
    },\
    \"Qualifier\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(|[a-zA-Z0-9$_-]+)\"\
    },\
    \"Queue\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1,\
      \"pattern\":\"[\\\\s\\\\S]*\"\
    },\
    \"Queues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Queue\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"RemoveLayerVersionPermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LayerName\",\
        \"VersionNumber\",\
        \"StatementId\"\
      ],\
      \"members\":{\
        \"LayerName\":{\
          \"shape\":\"LayerName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the layer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LayerName\"\
        },\
        \"VersionNumber\":{\
          \"shape\":\"LayerVersionNumber\",\
          \"documentation\":\"<p>The version number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VersionNumber\"\
        },\
        \"StatementId\":{\
          \"shape\":\"StatementId\",\
          \"documentation\":\"<p>The identifier that was specified when the statement was added.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"StatementId\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the policy if the revision ID matches the ID specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RevisionId\"\
        }\
      }\
    },\
    \"RemovePermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"StatementId\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"StatementId\":{\
          \"shape\":\"NamespacedStatementId\",\
          \"documentation\":\"<p>Statement ID of the permission to remove.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"StatementId\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Specify a version or alias to remove permissions from a published version of the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid modifying a policy that has changed since you last read it.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"RevisionId\"\
        }\
      }\
    },\
    \"RequestTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request payload exceeded the <code>Invoke</code> request body JSON input limit. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a>. </p>\",\
      \"error\":{\"httpStatusCode\":413},\
      \"exception\":true\
    },\
    \"ReservedConcurrentExecutions\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()\"\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The resource already exists, or another operation is in progress.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The operation conflicts with the resource's availability. For example, you attempted to update an EventSource Mapping in CREATING, or tried to delete a EventSource mapping currently in the UPDATING state.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The resource specified in the request does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceNotReadyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception type.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The exception message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The function is inactive and its VPC connection is no longer available. Wait for the VPC connection to reestablish and try again.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:(aws[a-zA-Z-]*)?:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\"\
    },\
    \"Runtime\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"nodejs\",\
        \"nodejs4.3\",\
        \"nodejs6.10\",\
        \"nodejs8.10\",\
        \"nodejs10.x\",\
        \"nodejs12.x\",\
        \"nodejs14.x\",\
        \"java8\",\
        \"java8.al2\",\
        \"java11\",\
        \"python2.7\",\
        \"python3.6\",\
        \"python3.7\",\
        \"python3.8\",\
        \"python3.9\",\
        \"dotnetcore1.0\",\
        \"dotnetcore2.0\",\
        \"dotnetcore2.1\",\
        \"dotnetcore3.1\",\
        \"nodejs4.3-edge\",\
        \"go1.x\",\
        \"ruby2.5\",\
        \"ruby2.7\",\
        \"provided\",\
        \"provided.al2\"\
      ]\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":3,\
      \"pattern\":\"^[0-9A-Za-z\\\\.\\\\-_]*(?<!\\\\.)$\"\
    },\
    \"S3Key\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5\
    },\
    \"SelfManagedEventSource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Endpoints\":{\
          \"shape\":\"Endpoints\",\
          \"documentation\":\"<p>The list of bootstrap servers for your Kafka brokers in the following format: <code>\\\"KAFKA_BOOTSTRAP_SERVERS\\\": [\\\"abc.xyz.com:xxxx\\\",\\\"abc2.xyz.com:xxxx\\\"]</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The self-managed Apache Kafka cluster for your event source.</p>\"\
    },\
    \"SensitiveString\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"ServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Lambda service encountered an internal error.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"SigningProfileVersionArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Arn\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"SourceAccessConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"SourceAccessType\",\
          \"documentation\":\"<p>The type of authentication protocol, VPC components, or virtual host for your event source. For example: <code>\\\"Type\\\":\\\"SASL_SCRAM_512_AUTH\\\"</code>.</p> <ul> <li> <p> <code>BASIC_AUTH</code> - (Amazon MQ) The Secrets Manager secret that stores your broker credentials.</p> </li> <li> <p> <code>BASIC_AUTH</code> - (Self-managed Apache Kafka) The Secrets Manager ARN of your secret key used for SASL/PLAIN authentication of your Apache Kafka brokers.</p> </li> <li> <p> <code>VPC_SUBNET</code> - The subnets associated with your VPC. Lambda connects to these subnets to fetch data from your self-managed Apache Kafka cluster.</p> </li> <li> <p> <code>VPC_SECURITY_GROUP</code> - The VPC security group used to manage access to your self-managed Apache Kafka brokers.</p> </li> <li> <p> <code>SASL_SCRAM_256_AUTH</code> - The Secrets Manager ARN of your secret key used for SASL SCRAM-256 authentication of your self-managed Apache Kafka brokers.</p> </li> <li> <p> <code>SASL_SCRAM_512_AUTH</code> - The Secrets Manager ARN of your secret key used for SASL SCRAM-512 authentication of your self-managed Apache Kafka brokers.</p> </li> <li> <p> <code>VIRTUAL_HOST</code> - (Amazon MQ) The name of the virtual host in your RabbitMQ broker. Lambda uses this RabbitMQ host as the event source. This property cannot be specified in an UpdateEventSourceMapping API call.</p> </li> </ul>\"\
        },\
        \"URI\":{\
          \"shape\":\"URI\",\
          \"documentation\":\"<p>The value for your chosen configuration in <code>Type</code>. For example: <code>\\\"URI\\\": \\\"arn:aws:secretsmanager:us-east-1:01234567890:secret:MyBrokerSecretName\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>To secure and define access to your event source, you can specify the authentication protocol, VPC components, or virtual host.</p>\"\
    },\
    \"SourceAccessConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SourceAccessConfiguration\"},\
      \"max\":22,\
      \"min\":0\
    },\
    \"SourceAccessType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BASIC_AUTH\",\
        \"VPC_SUBNET\",\
        \"VPC_SECURITY_GROUP\",\
        \"SASL_SCRAM_512_AUTH\",\
        \"SASL_SCRAM_256_AUTH\",\
        \"VIRTUAL_HOST\",\
        \"CLIENT_CERTIFICATE_TLS_AUTH\",\
        \"SERVER_ROOT_CA_CERTIFICATE\"\
      ]\
    },\
    \"SourceOwner\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"pattern\":\"\\\\d{12}\"\
    },\
    \"State\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Active\",\
        \"Inactive\",\
        \"Failed\"\
      ]\
    },\
    \"StateReason\":{\"type\":\"string\"},\
    \"StateReasonCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Idle\",\
        \"Creating\",\
        \"Restoring\",\
        \"EniLimitExceeded\",\
        \"InsufficientRolePermissions\",\
        \"InvalidConfiguration\",\
        \"InternalError\",\
        \"SubnetOutOfIPAddresses\",\
        \"InvalidSubnet\",\
        \"InvalidSecurityGroup\",\
        \"ImageDeleted\",\
        \"ImageAccessDenied\",\
        \"InvalidImage\"\
      ]\
    },\
    \"StatementId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"([a-zA-Z0-9-_]+)\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":1500\
    },\
    \"SubnetIPAddressLimitReachedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda was not able to set up VPC access for the Lambda function because one or more configured subnets has no available IP addresses.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16\
    },\
    \"TagKey\":{\"type\":\"string\"},\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Resource\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The function's Amazon Resource Name (ARN).</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ARN\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>A list of tags to apply to the function.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\"type\":\"string\"},\
    \"Tags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"}\
    },\
    \"ThrottleReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ConcurrentInvocationLimitExceeded\",\
        \"FunctionInvocationRateLimitExceeded\",\
        \"ReservedFunctionConcurrentInvocationLimitExceeded\",\
        \"ReservedFunctionInvocationRateLimitExceeded\",\
        \"CallerRateLimitExceeded\"\
      ]\
    },\
    \"Timeout\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Timestamp\":{\"type\":\"string\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"retryAfterSeconds\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The number of seconds the caller should wait before retrying.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Retry-After\"\
        },\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"},\
        \"Reason\":{\"shape\":\"ThrottleReason\"}\
      },\
      \"documentation\":\"<p>The request throughput limit was exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Topic\":{\
      \"type\":\"string\",\
      \"max\":249,\
      \"min\":1,\
      \"pattern\":\"^[^.]([a-zA-Z0-9\\\\-_.]+)\"\
    },\
    \"Topics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Topic\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"TracingConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"TracingMode\",\
          \"documentation\":\"<p>The tracing mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html\\\">X-Ray</a> tracing configuration. To sample and record incoming requests, set <code>Mode</code> to <code>Active</code>.</p>\"\
    },\
    \"TracingConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Mode\":{\
          \"shape\":\"TracingMode\",\
          \"documentation\":\"<p>The tracing mode.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The function's X-Ray tracing configuration.</p>\"\
    },\
    \"TracingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Active\",\
        \"PassThrough\"\
      ]\
    },\
    \"TumblingWindowInSeconds\":{\
      \"type\":\"integer\",\
      \"max\":900,\
      \"min\":0\
    },\
    \"URI\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9-\\\\/*:_+=.@-]*\"\
    },\
    \"UnreservedConcurrentExecutions\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"UnsupportedMediaTypeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The content type of the <code>Invoke</code> request body is not JSON.</p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Resource\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"Resource\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The function's Amazon Resource Name (ARN).</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ARN\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of tag keys to remove from the function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UpdateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The name of the alias.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The function version that the alias invokes.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the alias.</p>\"\
        },\
        \"RoutingConfig\":{\
          \"shape\":\"AliasRoutingConfiguration\",\
          \"documentation\":\"<p>The <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing\\\">routing configuration</a> of the alias.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the alias if the revision ID matches the ID that's specified. Use this option to avoid modifying an alias that has changed since you last read it.</p>\"\
        }\
      }\
    },\
    \"UpdateCodeSigningConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfigArn\"],\
      \"members\":{\
        \"CodeSigningConfigArn\":{\
          \"shape\":\"CodeSigningConfigArn\",\
          \"documentation\":\"<p>The The Amazon Resource Name (ARN) of the code signing configuration.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CodeSigningConfigArn\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Descriptive name for this code signing configuration.</p>\"\
        },\
        \"AllowedPublishers\":{\
          \"shape\":\"AllowedPublishers\",\
          \"documentation\":\"<p>Signing profiles for this code signing configuration.</p>\"\
        },\
        \"CodeSigningPolicies\":{\
          \"shape\":\"CodeSigningPolicies\",\
          \"documentation\":\"<p>The code signing policy.</p>\"\
        }\
      }\
    },\
    \"UpdateCodeSigningConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"CodeSigningConfig\"],\
      \"members\":{\
        \"CodeSigningConfig\":{\
          \"shape\":\"CodeSigningConfig\",\
          \"documentation\":\"<p>The code signing configuration</p>\"\
        }\
      }\
    },\
    \"UpdateEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The identifier of the event source mapping.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>MyFunction</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.</p> </li> <li> <p> <b>Version or Alias ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it's limited to 64 characters in length.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>When true, the event source mapping is active. When false, Lambda pauses polling and invocation.</p> <p>Default: True</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The maximum number of records in each batch that Lambda pulls from your stream or queue and sends to your function. Lambda passes all of the records in the batch to the function in a single call, up to the payload limit for synchronous invocation (6 MB).</p> <ul> <li> <p> <b>Amazon Kinesis</b> - Default 100. Max 10,000.</p> </li> <li> <p> <b>Amazon DynamoDB Streams</b> - Default 100. Max 1,000.</p> </li> <li> <p> <b>Amazon Simple Queue Service</b> - Default 10. For standard queues the max is 10,000. For FIFO queues the max is 10.</p> </li> <li> <p> <b>Amazon Managed Streaming for Apache Kafka</b> - Default 100. Max 10,000.</p> </li> <li> <p> <b>Self-Managed Apache Kafka</b> - Default 100. Max 10,000.</p> </li> <li> <p> <b>Amazon MQ (ActiveMQ and RabbitMQ)</b> - Default 100. Max 10,000.</p> </li> </ul>\"\
        },\
        \"FilterCriteria\":{\
          \"shape\":\"FilterCriteria\",\
          \"documentation\":\"<p>(Streams and Amazon SQS) A object that defines the filter criteria used to determine whether Lambda should process an event. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html\\\">Lambda event filtering</a>.</p>\"\
        },\
        \"MaximumBatchingWindowInSeconds\":{\
          \"shape\":\"MaximumBatchingWindowInSeconds\",\
          \"documentation\":\"<p>(Streams and Amazon SQS standard queues) The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the function.</p> <p>Default: 0</p> <p>Related setting: When you set <code>BatchSize</code> to a value greater than 10, you must set <code>MaximumBatchingWindowInSeconds</code> to at least 1.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"DestinationConfig\",\
          \"documentation\":\"<p>(Streams only) An Amazon SQS queue or Amazon SNS topic destination for discarded records.</p>\"\
        },\
        \"MaximumRecordAgeInSeconds\":{\
          \"shape\":\"MaximumRecordAgeInSeconds\",\
          \"documentation\":\"<p>(Streams only) Discard records older than the specified age. The default value is infinite (-1).</p>\"\
        },\
        \"BisectBatchOnFunctionError\":{\
          \"shape\":\"BisectBatchOnFunctionError\",\
          \"documentation\":\"<p>(Streams only) If the function returns an error, split the batch in two and retry.</p>\"\
        },\
        \"MaximumRetryAttempts\":{\
          \"shape\":\"MaximumRetryAttemptsEventSourceMapping\",\
          \"documentation\":\"<p>(Streams only) Discard records after the specified number of retries. The default value is infinite (-1). When set to infinite (-1), failed records will be retried until the record expires.</p>\"\
        },\
        \"ParallelizationFactor\":{\
          \"shape\":\"ParallelizationFactor\",\
          \"documentation\":\"<p>(Streams only) The number of batches to process from each shard concurrently.</p>\"\
        },\
        \"SourceAccessConfigurations\":{\
          \"shape\":\"SourceAccessConfigurations\",\
          \"documentation\":\"<p>An array of authentication protocols or VPC components required to secure your event source.</p>\"\
        },\
        \"TumblingWindowInSeconds\":{\
          \"shape\":\"TumblingWindowInSeconds\",\
          \"documentation\":\"<p>(Streams only) The duration in seconds of a processing window. The range is between 1 second up to 900 seconds.</p>\"\
        },\
        \"FunctionResponseTypes\":{\
          \"shape\":\"FunctionResponseTypeList\",\
          \"documentation\":\"<p>(Streams only) A list of current response type enums applied to the event source mapping.</p>\"\
        }\
      }\
    },\
    \"UpdateFunctionCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The base64-encoded contents of the deployment package. Amazon Web Services SDK and Amazon Web Services CLI clients handle the encoding for you.</p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>An Amazon S3 bucket in the same Amazon Web Services Region as your function. The bucket can be in a different Amazon Web Services account.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 key of the deployment package.</p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>For versioned objects, the version of the deployment package object to use.</p>\"\
        },\
        \"ImageUri\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>URI of a container image in the Amazon ECR registry.</p>\"\
        },\
        \"Publish\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to true to publish a new version of the function after updating the code. This has the same effect as calling <a>PublishVersion</a> separately.</p>\"\
        },\
        \"DryRun\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to true to validate the request parameters and access permissions without modifying the function code.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the function if the revision ID matches the ID that's specified. Use this option to avoid modifying a function that has changed since you last read it.</p>\"\
        },\
        \"Architectures\":{\
          \"shape\":\"ArchitecturesList\",\
          \"documentation\":\"<p>The instruction set architecture that the function supports. Enter a string array with one of the valid values (arm64 or x86_64). The default value is <code>x86_64</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateFunctionConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code>.</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the function's execution role.</p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The name of the method within your code that Lambda calls to execute your function. The format includes the file name. It can also include namespaces and other qualifiers, depending on the runtime. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html\\\">Programming Model</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the function.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The amount of time (in seconds) that Lambda allows a function to run before stopping it. The default is 3 seconds. The maximum allowed value is 900 seconds. For additional information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html\\\">Lambda execution environment</a>.</p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html\\\">memory available to the function</a> at runtime. Increasing the function memory also increases its CPU allocation. The default value is 128 MB. The value can be any multiple of 1 MB.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>For network connectivity to Amazon Web Services resources in a VPC, specify a list of security groups and subnets in the VPC. When you connect a function to a VPC, it can only access resources and the internet through that VPC. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html\\\">VPC Settings</a>.</p>\"\
        },\
        \"Environment\":{\
          \"shape\":\"Environment\",\
          \"documentation\":\"<p>Environment variables that are accessible from function code during execution.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The identifier of the function's <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html\\\">runtime</a>.</p>\"\
        },\
        \"DeadLetterConfig\":{\
          \"shape\":\"DeadLetterConfig\",\
          \"documentation\":\"<p>A dead letter queue configuration that specifies the queue or topic where Lambda sends asynchronous events when they fail processing. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq\\\">Dead Letter Queues</a>.</p>\"\
        },\
        \"KMSKeyArn\":{\
          \"shape\":\"KMSKeyArn\",\
          \"documentation\":\"<p>The ARN of the Amazon Web Services Key Management Service (KMS) key that's used to encrypt your function's environment variables. If it's not provided, Lambda uses a default service key.</p>\"\
        },\
        \"TracingConfig\":{\
          \"shape\":\"TracingConfig\",\
          \"documentation\":\"<p>Set <code>Mode</code> to <code>Active</code> to sample and trace a subset of incoming requests with <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html\\\">X-Ray</a>.</p>\"\
        },\
        \"RevisionId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Only update the function if the revision ID matches the ID that's specified. Use this option to avoid modifying a function that has changed since you last read it.</p>\"\
        },\
        \"Layers\":{\
          \"shape\":\"LayerList\",\
          \"documentation\":\"<p>A list of <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html\\\">function layers</a> to add to the function's execution environment. Specify each layer by its ARN, including the version.</p>\"\
        },\
        \"FileSystemConfigs\":{\
          \"shape\":\"FileSystemConfigList\",\
          \"documentation\":\"<p>Connection settings for an Amazon EFS file system.</p>\"\
        },\
        \"ImageConfig\":{\
          \"shape\":\"ImageConfig\",\
          \"documentation\":\"<p> <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/images-parms.html\\\">Container image configuration values</a> that override the values in the container image Docker file.</p>\"\
        }\
      }\
    },\
    \"UpdateFunctionEventInvokeConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function, version, or alias.</p> <p class=\\\"title\\\"> <b>Name formats</b> </p> <ul> <li> <p> <b>Function name</b> - <code>my-function</code> (name-only), <code>my-function:v1</code> (with alias).</p> </li> <li> <p> <b>Function ARN</b> - <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.</p> </li> <li> <p> <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.</p> </li> </ul> <p>You can append a version number or alias to any of the formats. The length constraint applies only to the full ARN. If you specify only the function name, it is limited to 64 characters in length.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>A version number or alias name.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"MaximumRetryAttempts\":{\
          \"shape\":\"MaximumRetryAttempts\",\
          \"documentation\":\"<p>The maximum number of times to retry when the function returns an error.</p>\"\
        },\
        \"MaximumEventAgeInSeconds\":{\
          \"shape\":\"MaximumEventAgeInSeconds\",\
          \"documentation\":\"<p>The maximum age of a request that Lambda sends to a function for processing.</p>\"\
        },\
        \"DestinationConfig\":{\
          \"shape\":\"DestinationConfig\",\
          \"documentation\":\"<p>A destination for events after they have been sent to a function for processing.</p> <p class=\\\"title\\\"> <b>Destinations</b> </p> <ul> <li> <p> <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.</p> </li> <li> <p> <b>Queue</b> - The ARN of an SQS queue.</p> </li> <li> <p> <b>Topic</b> - The ARN of an SNS topic.</p> </li> <li> <p> <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"UpdateFunctionUrlConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"FunctionUrlQualifier\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        },\
        \"AuthorizationType\":{\"shape\":\"AuthorizationType\"},\
        \"Cors\":{\"shape\":\"Cors\"}\
      }\
    },\
    \"UpdateFunctionUrlConfigResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionUrl\",\
        \"FunctionArn\",\
        \"AuthorizationType\",\
        \"CreationTime\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"FunctionUrl\":{\"shape\":\"FunctionUrl\"},\
        \"FunctionArn\":{\"shape\":\"FunctionArn\"},\
        \"AuthorizationType\":{\"shape\":\"AuthorizationType\"},\
        \"Cors\":{\"shape\":\"Cors\"},\
        \"CreationTime\":{\"shape\":\"Timestamp\"},\
        \"LastModifiedTime\":{\"shape\":\"Timestamp\"}\
      }\
    },\
    \"Version\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"(\\\\$LATEST|[0-9]+)\"\
    },\
    \"VpcConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>A list of VPC subnet IDs.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of VPC security groups IDs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC security groups and subnets that are attached to a Lambda function. For more information, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html\\\">VPC Settings</a>.</p>\"\
    },\
    \"VpcConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>A list of VPC subnet IDs.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of VPC security groups IDs.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The ID of the VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The VPC security groups and subnets that are attached to a Lambda function.</p>\"\
    },\
    \"VpcId\":{\"type\":\"string\"},\
    \"Weight\":{\
      \"type\":\"double\",\
      \"max\":1.0,\
      \"min\":0.0\
    },\
    \"WorkingDirectory\":{\
      \"type\":\"string\",\
      \"max\":1000\
    }\
  },\
  \"documentation\":\"<fullname>Lambda</fullname> <p> <b>Overview</b> </p> <p>Lambda is a compute service that lets you run code without provisioning or managing servers. Lambda runs your code on a high-availability compute infrastructure and performs all of the administration of the compute resources, including server and operating system maintenance, capacity provisioning and automatic scaling, code monitoring and logging. With Lambda, you can run code for virtually any type of application or backend service. For more information about the Lambda service, see <a href=\\\"https://docs.aws.amazon.com/lambda/latest/dg/welcome.html\\\">What is Lambda</a> in the <b>Lambda Developer Guide</b>.</p> <p>The <i>Lambda API Reference</i> provides information about each of the API methods, including details about the parameters in each API request and response. </p> <p/> <p>You can use Software Development Kits (SDKs), Integrated Development Environment (IDE) Toolkits, and command line tools to access the API. For installation instructions, see <a href=\\\"http://aws.amazon.com/tools/\\\">Tools for Amazon Web Services</a>. </p> <p>For a list of Region-specific endpoints that Lambda supports, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/lambda-service.html/\\\">Lambda endpoints and quotas </a> in the <i>Amazon Web Services General Reference.</i>. </p> <p>When making the API calls, you will need to authenticate your request by providing a signature. Lambda supports signature version 4. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html\\\">Signature Version 4 signing process</a> in the <i>Amazon Web Services General Reference.</i>. </p> <p> <b>CA certificates</b> </p> <p>Because Amazon Web Services SDKs use the CA certificates from your computer, changes to the certificates on the Amazon Web Services servers can cause connection failures when you attempt to use an SDK. You can prevent these failures by keeping your computer's CA certificates and operating system up-to-date. If you encounter this issue in a corporate environment and do not manage your own computer, you might need to ask an administrator to assist with the update process. The following list shows minimum operating system and Java versions:</p> <ul> <li> <p>Microsoft Windows versions that have updates from January 2005 or later installed contain at least one of the required CAs in their trust list. </p> </li> <li> <p>Mac OS X 10.4 with Java for Mac OS X 10.4 Release 5 (February 2007), Mac OS X 10.5 (October 2007), and later versions contain at least one of the required CAs in their trust list. </p> </li> <li> <p>Red Hat Enterprise Linux 5 (March 2007), 6, and 7 and CentOS 5, 6, and 7 all contain at least one of the required CAs in their default trusted CA list. </p> </li> <li> <p>Java 1.4.2_12 (May 2006), 5 Update 2 (March 2005), and all later versions, including Java 6 (December 2006), 7, and 8, contain at least one of the required CAs in their default trusted CA list. </p> </li> </ul> <p>When accessing the Lambda management console or Lambda API endpoints, whether through browsers or programmatically, you will need to ensure your client machines support any of the following CAs: </p> <ul> <li> <p>Amazon Root CA 1</p> </li> <li> <p>Starfield Services Root Certificate Authority - G2</p> </li> <li> <p>Starfield Class 2 Certification Authority</p> </li> </ul> <p>Root certificates from the first two authorities are available from <a href=\\\"https://www.amazontrust.com/repository/\\\">Amazon trust services</a>, but keeping your computer up-to-date is the more straightforward solution. To learn more about ACM-provided certificates, see <a href=\\\"http://aws.amazon.com/certificate-manager/faqs/#certificates\\\">Amazon Web Services Certificate Manager FAQs.</a> </p>\"\
}\
";
}

@end
