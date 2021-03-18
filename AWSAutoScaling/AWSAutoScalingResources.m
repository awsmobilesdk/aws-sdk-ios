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

#import "AWSAutoScalingResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSAutoScalingResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSAutoScalingResources

+ (instancetype)sharedInstance {
    static AWSAutoScalingResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSAutoScalingResources new];
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
    \"apiVersion\":\"2011-01-01\",\
    \"endpointPrefix\":\"autoscaling\",\
    \"protocol\":\"query\",\
    \"serviceFullName\":\"Auto Scaling\",\
    \"serviceId\":\"Auto Scaling\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"autoscaling-2011-01-01\",\
    \"xmlNamespace\":\"http://autoscaling.amazonaws.com/doc/2011-01-01/\"\
  },\
  \"operations\":{\
    \"AttachInstances\":{\
      \"name\":\"AttachInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachInstancesQuery\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Attaches one or more EC2 instances to the specified Auto Scaling group.</p> <p>When you attach instances, Amazon EC2 Auto Scaling increases the desired capacity of the group by the number of instances being attached. If the number of instances being attached plus the desired capacity of the group exceeds the maximum size of the group, the operation fails.</p> <p>If there is a Classic Load Balancer attached to your Auto Scaling group, the instances are also registered with the load balancer. If there are target groups attached to your Auto Scaling group, the instances are also registered with the target groups.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/attach-instance-asg.html\\\">Attach EC2 instances to your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"AttachLoadBalancerTargetGroups\":{\
      \"name\":\"AttachLoadBalancerTargetGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachLoadBalancerTargetGroupsType\"},\
      \"output\":{\
        \"shape\":\"AttachLoadBalancerTargetGroupsResultType\",\
        \"resultWrapper\":\"AttachLoadBalancerTargetGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Attaches one or more target groups to the specified Auto Scaling group.</p> <p>This operation is used with the following load balancer types: </p> <ul> <li> <p> Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS. </p> </li> <li> <p> Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP. </p> </li> <li> <p> Gateway Load Balancer - Operates at the network layer (layer 3).</p> </li> </ul> <p>To describe the target groups for an Auto Scaling group, call the <a>DescribeLoadBalancerTargetGroups</a> API. To detach the target group from the Auto Scaling group, call the <a>DetachLoadBalancerTargetGroups</a> API.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Elastic Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
    },\
    \"AttachLoadBalancers\":{\
      \"name\":\"AttachLoadBalancers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachLoadBalancersType\"},\
      \"output\":{\
        \"shape\":\"AttachLoadBalancersResultType\",\
        \"resultWrapper\":\"AttachLoadBalancersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<note> <p>To attach an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer, use the <a>AttachLoadBalancerTargetGroups</a> API operation instead.</p> </note> <p>Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 Auto Scaling registers the running instances with these Classic Load Balancers.</p> <p>To describe the load balancers for an Auto Scaling group, call the <a>DescribeLoadBalancers</a> API. To detach the load balancer from the Auto Scaling group, call the <a>DetachLoadBalancers</a> API.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Elastic Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
    },\
    \"BatchDeleteScheduledAction\":{\
      \"name\":\"BatchDeleteScheduledAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDeleteScheduledActionType\"},\
      \"output\":{\
        \"shape\":\"BatchDeleteScheduledActionAnswer\",\
        \"resultWrapper\":\"BatchDeleteScheduledActionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Deletes one or more scheduled actions for the specified Auto Scaling group.</p>\"\
    },\
    \"BatchPutScheduledUpdateGroupAction\":{\
      \"name\":\"BatchPutScheduledUpdateGroupAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchPutScheduledUpdateGroupActionType\"},\
      \"output\":{\
        \"shape\":\"BatchPutScheduledUpdateGroupActionAnswer\",\
        \"resultWrapper\":\"BatchPutScheduledUpdateGroupActionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsFault\"},\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Creates or updates one or more scheduled scaling actions for an Auto Scaling group.</p>\"\
    },\
    \"CancelInstanceRefresh\":{\
      \"name\":\"CancelInstanceRefresh\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelInstanceRefreshType\"},\
      \"output\":{\
        \"shape\":\"CancelInstanceRefreshAnswer\",\
        \"resultWrapper\":\"CancelInstanceRefreshResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ActiveInstanceRefreshNotFoundFault\"}\
      ],\
      \"documentation\":\"<p>Cancels an instance refresh operation in progress. Cancellation does not roll back any replacements that have already been completed, but it prevents new replacements from being started. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">Replacing Auto Scaling instances based on an instance refresh</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"CompleteLifecycleAction\":{\
      \"name\":\"CompleteLifecycleAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CompleteLifecycleActionType\"},\
      \"output\":{\
        \"shape\":\"CompleteLifecycleActionAnswer\",\
        \"resultWrapper\":\"CompleteLifecycleActionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Completes the lifecycle action for the specified token or instance with the specified result.</p> <p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p> </li> <li> <p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</p> </li> <li> <p> <b>If you finish before the timeout period ends, complete the lifecycle action.</b> </p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"CreateAutoScalingGroup\":{\
      \"name\":\"CreateAutoScalingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateAutoScalingGroupType\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsFault\"},\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p> <b>We strongly recommend using a launch template when calling this operation to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b> </p> <p>Creates an Auto Scaling group with the specified name and attributes. </p> <p>If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html\\\">Amazon EC2 Auto Scaling service quotas</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>For introductory exercises for creating an Auto Scaling group, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html\\\">Getting started with Amazon EC2 Auto Scaling</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html\\\">Tutorial: Set up a scaled and load-balanced application</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html\\\">Auto Scaling groups</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Every Auto Scaling group has three size parameters (<code>DesiredCapacity</code>, <code>MaxSize</code>, and <code>MinSize</code>). Usually, you set these sizes based on a specific number of instances. However, if you configure a mixed instances policy that defines weights for the instance types, you must specify these sizes with the same units that you use for weighting instances.</p>\"\
    },\
    \"CreateLaunchConfiguration\":{\
      \"name\":\"CreateLaunchConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLaunchConfigurationType\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsFault\"},\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Creates a launch configuration.</p> <p>If you exceed your maximum limit of launch configurations, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html\\\">Amazon EC2 Auto Scaling service quotas</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html\\\">Launch configurations</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"CreateOrUpdateTags\":{\
      \"name\":\"CreateOrUpdateTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateOrUpdateTagsType\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"AlreadyExistsFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ResourceInUseFault\"}\
      ],\
      \"documentation\":\"<p>Creates or updates tags for the specified Auto Scaling group.</p> <p>When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html\\\">Tagging Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DeleteAutoScalingGroup\":{\
      \"name\":\"DeleteAutoScalingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAutoScalingGroupType\"},\
      \"errors\":[\
        {\"shape\":\"ScalingActivityInProgressFault\"},\
        {\"shape\":\"ResourceInUseFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Auto Scaling group.</p> <p>If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed.</p> <p>If the group has policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action.</p> <p>To remove instances from the Auto Scaling group before deleting it, call the <a>DetachInstances</a> API with the list of instances and the option to decrement the desired capacity. This ensures that Amazon EC2 Auto Scaling does not launch replacement instances.</p> <p>To terminate all instances before deleting the Auto Scaling group, call the <a>UpdateAutoScalingGroup</a> API and set the minimum size and desired capacity of the Auto Scaling group to zero.</p>\"\
    },\
    \"DeleteLaunchConfiguration\":{\
      \"name\":\"DeleteLaunchConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"LaunchConfigurationNameType\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified launch configuration.</p> <p>The launch configuration must not be attached to an Auto Scaling group. When this call completes, the launch configuration is no longer available for use.</p>\"\
    },\
    \"DeleteLifecycleHook\":{\
      \"name\":\"DeleteLifecycleHook\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLifecycleHookType\"},\
      \"output\":{\
        \"shape\":\"DeleteLifecycleHookAnswer\",\
        \"resultWrapper\":\"DeleteLifecycleHookResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified lifecycle hook.</p> <p>If there are any outstanding lifecycle actions, they are completed first (<code>ABANDON</code> for launching instances, <code>CONTINUE</code> for terminating instances).</p>\"\
    },\
    \"DeleteNotificationConfiguration\":{\
      \"name\":\"DeleteNotificationConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteNotificationConfigurationType\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified notification.</p>\"\
    },\
    \"DeletePolicy\":{\
      \"name\":\"DeletePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeletePolicyType\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified scaling policy.</p> <p>Deleting either a step scaling policy or a simple scaling policy deletes the underlying alarm action, but does not delete the alarm, even if it no longer has an associated action.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html\\\">Deleting a scaling policy</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DeleteScheduledAction\":{\
      \"name\":\"DeleteScheduledAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteScheduledActionType\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified scheduled action.</p>\"\
    },\
    \"DeleteTags\":{\
      \"name\":\"DeleteTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTagsType\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ResourceInUseFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified tags.</p>\"\
    },\
    \"DescribeAccountLimits\":{\
      \"name\":\"DescribeAccountLimits\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeAccountLimitsAnswer\",\
        \"resultWrapper\":\"DescribeAccountLimitsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the current Amazon EC2 Auto Scaling resource quotas for your AWS account.</p> <p>For information about requesting an increase, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-account-limits.html\\\">Amazon EC2 Auto Scaling service quotas</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DescribeAdjustmentTypes\":{\
      \"name\":\"DescribeAdjustmentTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeAdjustmentTypesAnswer\",\
        \"resultWrapper\":\"DescribeAdjustmentTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the available adjustment types for Amazon EC2 Auto Scaling scaling policies. These settings apply to step scaling policies and simple scaling policies; they do not apply to target tracking scaling policies.</p> <p>The following adjustment types are supported:</p> <ul> <li> <p>ChangeInCapacity</p> </li> <li> <p>ExactCapacity</p> </li> <li> <p>PercentChangeInCapacity</p> </li> </ul>\"\
    },\
    \"DescribeAutoScalingGroups\":{\
      \"name\":\"DescribeAutoScalingGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AutoScalingGroupNamesType\"},\
      \"output\":{\
        \"shape\":\"AutoScalingGroupsType\",\
        \"resultWrapper\":\"DescribeAutoScalingGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes one or more Auto Scaling groups.</p>\"\
    },\
    \"DescribeAutoScalingInstances\":{\
      \"name\":\"DescribeAutoScalingInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAutoScalingInstancesType\"},\
      \"output\":{\
        \"shape\":\"AutoScalingInstancesType\",\
        \"resultWrapper\":\"DescribeAutoScalingInstancesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes one or more Auto Scaling instances.</p>\"\
    },\
    \"DescribeAutoScalingNotificationTypes\":{\
      \"name\":\"DescribeAutoScalingNotificationTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeAutoScalingNotificationTypesAnswer\",\
        \"resultWrapper\":\"DescribeAutoScalingNotificationTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the notification types that are supported by Amazon EC2 Auto Scaling.</p>\"\
    },\
    \"DescribeInstanceRefreshes\":{\
      \"name\":\"DescribeInstanceRefreshes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceRefreshesType\"},\
      \"output\":{\
        \"shape\":\"DescribeInstanceRefreshesAnswer\",\
        \"resultWrapper\":\"DescribeInstanceRefreshesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes one or more instance refreshes.</p> <p>You can determine the status of a request by looking at the <code>Status</code> parameter. The following are the possible statuses: </p> <ul> <li> <p> <code>Pending</code> - The request was created, but the operation has not started.</p> </li> <li> <p> <code>InProgress</code> - The operation is in progress.</p> </li> <li> <p> <code>Successful</code> - The operation completed successfully.</p> </li> <li> <p> <code>Failed</code> - The operation failed to complete. You can troubleshoot using the status reason and the scaling activities. </p> </li> <li> <p> <code>Cancelling</code> - An ongoing operation is being cancelled. Cancellation does not roll back any replacements that have already been completed, but it prevents new replacements from being started. </p> </li> <li> <p> <code>Cancelled</code> - The operation is cancelled. </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">Replacing Auto Scaling instances based on an instance refresh</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DescribeLaunchConfigurations\":{\
      \"name\":\"DescribeLaunchConfigurations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"LaunchConfigurationNamesType\"},\
      \"output\":{\
        \"shape\":\"LaunchConfigurationsType\",\
        \"resultWrapper\":\"DescribeLaunchConfigurationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes one or more launch configurations.</p>\"\
    },\
    \"DescribeLifecycleHookTypes\":{\
      \"name\":\"DescribeLifecycleHookTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeLifecycleHookTypesAnswer\",\
        \"resultWrapper\":\"DescribeLifecycleHookTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the available types of lifecycle hooks.</p> <p>The following hook types are supported:</p> <ul> <li> <p>autoscaling:EC2_INSTANCE_LAUNCHING</p> </li> <li> <p>autoscaling:EC2_INSTANCE_TERMINATING</p> </li> </ul>\"\
    },\
    \"DescribeLifecycleHooks\":{\
      \"name\":\"DescribeLifecycleHooks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLifecycleHooksType\"},\
      \"output\":{\
        \"shape\":\"DescribeLifecycleHooksAnswer\",\
        \"resultWrapper\":\"DescribeLifecycleHooksResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the lifecycle hooks for the specified Auto Scaling group.</p>\"\
    },\
    \"DescribeLoadBalancerTargetGroups\":{\
      \"name\":\"DescribeLoadBalancerTargetGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancerTargetGroupsRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancerTargetGroupsResponse\",\
        \"resultWrapper\":\"DescribeLoadBalancerTargetGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the target groups for the specified Auto Scaling group.</p>\"\
    },\
    \"DescribeLoadBalancers\":{\
      \"name\":\"DescribeLoadBalancers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLoadBalancersRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeLoadBalancersResponse\",\
        \"resultWrapper\":\"DescribeLoadBalancersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the load balancers for the specified Auto Scaling group.</p> <p>This operation describes only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DescribeLoadBalancerTargetGroups</a> API instead.</p>\"\
    },\
    \"DescribeMetricCollectionTypes\":{\
      \"name\":\"DescribeMetricCollectionTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeMetricCollectionTypesAnswer\",\
        \"resultWrapper\":\"DescribeMetricCollectionTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.</p> <p>The <code>GroupStandbyInstances</code> metric is not returned by default. You must explicitly request this metric when calling the <a>EnableMetricsCollection</a> API.</p>\"\
    },\
    \"DescribeNotificationConfigurations\":{\
      \"name\":\"DescribeNotificationConfigurations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeNotificationConfigurationsType\"},\
      \"output\":{\
        \"shape\":\"DescribeNotificationConfigurationsAnswer\",\
        \"resultWrapper\":\"DescribeNotificationConfigurationsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the notification actions associated with the specified Auto Scaling group.</p>\"\
    },\
    \"DescribePolicies\":{\
      \"name\":\"DescribePolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribePoliciesType\"},\
      \"output\":{\
        \"shape\":\"PoliciesType\",\
        \"resultWrapper\":\"DescribePoliciesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Describes the policies for the specified Auto Scaling group.</p>\"\
    },\
    \"DescribeScalingActivities\":{\
      \"name\":\"DescribeScalingActivities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScalingActivitiesType\"},\
      \"output\":{\
        \"shape\":\"ActivitiesType\",\
        \"resultWrapper\":\"DescribeScalingActivitiesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes one or more scaling activities for the specified Auto Scaling group.</p> <p>To view the scaling activities from the Amazon EC2 Auto Scaling console, choose the <b>Activity</b> tab of the Auto Scaling group. When scaling events occur, you see scaling activity messages in the <b>Activity history</b>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html\\\">Verifying a scaling activity for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DescribeScalingProcessTypes\":{\
      \"name\":\"DescribeScalingProcessTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"ProcessesType\",\
        \"resultWrapper\":\"DescribeScalingProcessTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the scaling process types for use with the <a>ResumeProcesses</a> and <a>SuspendProcesses</a> APIs.</p>\"\
    },\
    \"DescribeScheduledActions\":{\
      \"name\":\"DescribeScheduledActions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeScheduledActionsType\"},\
      \"output\":{\
        \"shape\":\"ScheduledActionsType\",\
        \"resultWrapper\":\"DescribeScheduledActionsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the actions scheduled for your Auto Scaling group that haven't run or that have not reached their end time. To describe the actions that have already run, call the <a>DescribeScalingActivities</a> API.</p>\"\
    },\
    \"DescribeTags\":{\
      \"name\":\"DescribeTags\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTagsType\"},\
      \"output\":{\
        \"shape\":\"TagsType\",\
        \"resultWrapper\":\"DescribeTagsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the specified tags.</p> <p>You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results.</p> <p>You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html\\\">Tagging Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DescribeTerminationPolicyTypes\":{\
      \"name\":\"DescribeTerminationPolicyTypes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"output\":{\
        \"shape\":\"DescribeTerminationPolicyTypesAnswer\",\
        \"resultWrapper\":\"DescribeTerminationPolicyTypesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Describes the termination policies supported by Amazon EC2 Auto Scaling.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html\\\">Controlling which Auto Scaling instances terminate during scale in</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DetachInstances\":{\
      \"name\":\"DetachInstances\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachInstancesQuery\"},\
      \"output\":{\
        \"shape\":\"DetachInstancesAnswer\",\
        \"resultWrapper\":\"DetachInstancesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Removes one or more instances from the specified Auto Scaling group.</p> <p>After the instances are detached, you can manage them independent of the Auto Scaling group.</p> <p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are detached.</p> <p>If there is a Classic Load Balancer attached to the Auto Scaling group, the instances are deregistered from the load balancer. If there are target groups attached to the Auto Scaling group, the instances are deregistered from the target groups.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/detach-instance-asg.html\\\">Detach EC2 instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DetachLoadBalancerTargetGroups\":{\
      \"name\":\"DetachLoadBalancerTargetGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachLoadBalancerTargetGroupsType\"},\
      \"output\":{\
        \"shape\":\"DetachLoadBalancerTargetGroupsResultType\",\
        \"resultWrapper\":\"DetachLoadBalancerTargetGroupsResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Detaches one or more target groups from the specified Auto Scaling group.</p>\"\
    },\
    \"DetachLoadBalancers\":{\
      \"name\":\"DetachLoadBalancers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachLoadBalancersType\"},\
      \"output\":{\
        \"shape\":\"DetachLoadBalancersResultType\",\
        \"resultWrapper\":\"DetachLoadBalancersResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Detaches one or more Classic Load Balancers from the specified Auto Scaling group.</p> <p>This operation detaches only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DetachLoadBalancerTargetGroups</a> API instead.</p> <p>When you detach a load balancer, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using the <a>DescribeLoadBalancers</a> API call. The instances remain running.</p>\"\
    },\
    \"DisableMetricsCollection\":{\
      \"name\":\"DisableMetricsCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisableMetricsCollectionQuery\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Disables group metrics for the specified Auto Scaling group.</p>\"\
    },\
    \"EnableMetricsCollection\":{\
      \"name\":\"EnableMetricsCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnableMetricsCollectionQuery\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Enables group metrics for the specified Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-monitoring.html\\\">Monitoring CloudWatch metrics for your Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"EnterStandby\":{\
      \"name\":\"EnterStandby\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"EnterStandbyQuery\"},\
      \"output\":{\
        \"shape\":\"EnterStandbyAnswer\",\
        \"resultWrapper\":\"EnterStandbyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Moves the specified instances into the standby state.</p> <p>If you choose to decrement the desired capacity of the Auto Scaling group, the instances can enter standby as long as the desired capacity of the Auto Scaling group after the instances are placed into standby is equal to or greater than the minimum capacity of the group.</p> <p>If you choose not to decrement the desired capacity of the Auto Scaling group, the Auto Scaling group launches new instances to replace the instances on standby.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html\\\">Temporarily removing instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"ExecutePolicy\":{\
      \"name\":\"ExecutePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ExecutePolicyType\"},\
      \"errors\":[\
        {\"shape\":\"ScalingActivityInProgressFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Executes the specified policy. This can be useful for testing the design of your scaling policy.</p>\"\
    },\
    \"ExitStandby\":{\
      \"name\":\"ExitStandby\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ExitStandbyQuery\"},\
      \"output\":{\
        \"shape\":\"ExitStandbyAnswer\",\
        \"resultWrapper\":\"ExitStandbyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Moves the specified instances out of the standby state.</p> <p>After you put the instances back in service, the desired capacity is incremented.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html\\\">Temporarily removing instances from your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"PutLifecycleHook\":{\
      \"name\":\"PutLifecycleHook\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutLifecycleHookType\"},\
      \"output\":{\
        \"shape\":\"PutLifecycleHookAnswer\",\
        \"resultWrapper\":\"PutLifecycleHookResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a lifecycle hook for the specified Auto Scaling group.</p> <p>A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an instance when the instance launches (before it is put into service) or as the instance terminates (before it is fully terminated).</p> <p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p> <b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b> </p> </li> <li> <p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state using the <a>RecordLifecycleActionHeartbeat</a> API call.</p> </li> <li> <p>If you finish before the timeout period ends, complete the lifecycle action using the <a>CompleteLifecycleAction</a> API call.</p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails.</p> <p>You can view the lifecycle hooks for an Auto Scaling group using the <a>DescribeLifecycleHooks</a> API call. If you are no longer using a lifecycle hook, you can delete it by calling the <a>DeleteLifecycleHook</a> API.</p>\"\
    },\
    \"PutNotificationConfiguration\":{\
      \"name\":\"PutNotificationConfiguration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutNotificationConfigurationType\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Configures an Auto Scaling group to send notifications when specified events take place. Subscribers to the specified topic can have messages delivered to an endpoint such as a web server or an email address.</p> <p>This configuration overwrites any existing configuration.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ASGettingNotifications.html\\\">Getting Amazon SNS notifications when your Auto Scaling group scales</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call fails.</p>\"\
    },\
    \"PutScalingPolicy\":{\
      \"name\":\"PutScalingPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutScalingPolicyType\"},\
      \"output\":{\
        \"shape\":\"PolicyARNType\",\
        \"resultWrapper\":\"PutScalingPolicyResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a scaling policy for an Auto Scaling group.</p> <p>For more information about using scaling policies to scale your Auto Scaling group, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html\\\">Target tracking scaling policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html\\\">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"PutScheduledUpdateGroupAction\":{\
      \"name\":\"PutScheduledUpdateGroupAction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutScheduledUpdateGroupActionType\"},\
      \"errors\":[\
        {\"shape\":\"AlreadyExistsFault\"},\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a scheduled scaling action for an Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html\\\">Scheduled scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"RecordLifecycleActionHeartbeat\":{\
      \"name\":\"RecordLifecycleActionHeartbeat\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RecordLifecycleActionHeartbeatType\"},\
      \"output\":{\
        \"shape\":\"RecordLifecycleActionHeartbeatAnswer\",\
        \"resultWrapper\":\"RecordLifecycleActionHeartbeatResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using the <a>PutLifecycleHook</a> API call.</p> <p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p> </li> <li> <p> <b>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</b> </p> </li> <li> <p>If you finish before the timeout period ends, complete the lifecycle action.</p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html\\\">Auto Scaling lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"ResumeProcesses\":{\
      \"name\":\"ResumeProcesses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ScalingProcessQuery\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Resumes the specified suspended auto scaling processes, or all suspended process, for the specified Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html\\\">Suspending and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"SetDesiredCapacity\":{\
      \"name\":\"SetDesiredCapacity\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetDesiredCapacityType\"},\
      \"errors\":[\
        {\"shape\":\"ScalingActivityInProgressFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Sets the size of the specified Auto Scaling group.</p> <p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-manual-scaling.html\\\">Manual scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"SetInstanceHealth\":{\
      \"name\":\"SetInstanceHealth\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetInstanceHealthQuery\"},\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Sets the health status of the specified instance.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html\\\">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"SetInstanceProtection\":{\
      \"name\":\"SetInstanceProtection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SetInstanceProtectionQuery\"},\
      \"output\":{\
        \"shape\":\"SetInstanceProtectionAnswer\",\
        \"resultWrapper\":\"SetInstanceProtectionResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Updates the instance protection settings of the specified instances.</p> <p>For more information about preventing instances that are part of an Auto Scaling group from terminating on scale in, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection\\\">Instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the call fails.</p>\"\
    },\
    \"StartInstanceRefresh\":{\
      \"name\":\"StartInstanceRefresh\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartInstanceRefreshType\"},\
      \"output\":{\
        \"shape\":\"StartInstanceRefreshAnswer\",\
        \"resultWrapper\":\"StartInstanceRefreshResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"InstanceRefreshInProgressFault\"}\
      ],\
      \"documentation\":\"<p>Starts a new instance refresh operation, which triggers a rolling replacement of all previously launched instances in the Auto Scaling group with a new group of instances.</p> <p>If successful, this call creates a new instance refresh request with a unique ID that you can use to track its progress. To query its status, call the <a>DescribeInstanceRefreshes</a> API. To describe the instance refreshes that have already run, call the <a>DescribeInstanceRefreshes</a> API. To cancel an instance refresh operation in progress, use the <a>CancelInstanceRefresh</a> API. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">Replacing Auto Scaling instances based on an instance refresh</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"SuspendProcesses\":{\
      \"name\":\"SuspendProcesses\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ScalingProcessQuery\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling group.</p> <p>If you suspend either the <code>Launch</code> or <code>Terminate</code> process types, it can prevent other process types from functioning properly. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html\\\">Suspending and resuming scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>To resume processes that have been suspended, call the <a>ResumeProcesses</a> API.</p>\"\
    },\
    \"TerminateInstanceInAutoScalingGroup\":{\
      \"name\":\"TerminateInstanceInAutoScalingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TerminateInstanceInAutoScalingGroupType\"},\
      \"output\":{\
        \"shape\":\"ActivityType\",\
        \"resultWrapper\":\"TerminateInstanceInAutoScalingGroupResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ScalingActivityInProgressFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Terminates the specified instance and optionally adjusts the desired group size. </p> <p>This call simply makes a termination request. The instance is not terminated immediately. When an instance is terminated, the instance status changes to <code>terminated</code>. You can't connect to or start an instance after you've terminated it.</p> <p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are terminated. </p> <p>By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you decrement the desired capacity, your Auto Scaling group can become unbalanced between Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might terminate instances in other zones. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html#AutoScalingBehavior.InstanceUsage\\\">Rebalancing activities</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"UpdateAutoScalingGroup\":{\
      \"name\":\"UpdateAutoScalingGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateAutoScalingGroupType\"},\
      \"errors\":[\
        {\"shape\":\"ScalingActivityInProgressFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p> <b>We strongly recommend that all Auto Scaling groups use launch templates to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b> </p> <p>Updates the configuration for the specified Auto Scaling group.</p> <p>To update an Auto Scaling group, specify the name of the group and the parameter that you want to change. Any parameters that you don't specify are not changed by this update request. The new settings take effect on any scaling activities after this call returns. </p> <p>If you associate a new launch configuration or template with an Auto Scaling group, all new instances will get the updated configuration. Existing instances continue to run with the configuration that they were originally launched with. When you update a group to specify a mixed instances policy instead of a launch configuration or template, existing instances may be replaced to match the new purchasing options that you specified in the policy. For example, if the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, this means that half of your instances will be gradually terminated and relaunched as Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before terminating the old ones, so that updating your group does not compromise the performance or availability of your application.</p> <p>Note the following about changing <code>DesiredCapacity</code>, <code>MaxSize</code>, or <code>MinSize</code>:</p> <ul> <li> <p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate.</p> </li> <li> <p>If you specify a new value for <code>MinSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MinSize</code> is larger than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MinSize</code> value.</p> </li> <li> <p>If you specify a new value for <code>MaxSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code> is smaller than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MaxSize</code> value.</p> </li> </ul> <p>To see which parameters have been set, call the <a>DescribeAutoScalingGroups</a> API. To view the scaling policies for an Auto Scaling group, call the <a>DescribePolicies</a> API. If the group has scaling policies, you can update them by calling the <a>PutScalingPolicy</a> API.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ActiveInstanceRefreshNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"XmlStringMaxLen255\"}\
      },\
      \"documentation\":\"<p>The request failed because an active instance refresh for the specified Auto Scaling group was not found. </p>\",\
      \"error\":{\
        \"code\":\"ActiveInstanceRefreshNotFound\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Activities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Activity\"}\
    },\
    \"ActivitiesType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Activities\"],\
      \"members\":{\
        \"Activities\":{\
          \"shape\":\"Activities\",\
          \"documentation\":\"<p>The scaling activities. Activities are sorted by start time. Activities still in progress are described first.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"Activity\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ActivityId\",\
        \"AutoScalingGroupName\",\
        \"Cause\",\
        \"StartTime\",\
        \"StatusCode\"\
      ],\
      \"members\":{\
        \"ActivityId\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The ID of the activity.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A friendly, more verbose description of the activity.</p>\"\
        },\
        \"Cause\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>The reason the activity began.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The start time of the activity.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The end time of the activity.</p>\"\
        },\
        \"StatusCode\":{\
          \"shape\":\"ScalingActivityStatusCode\",\
          \"documentation\":\"<p>The current status of the activity.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>A friendly, more verbose description of the activity status.</p>\"\
        },\
        \"Progress\":{\
          \"shape\":\"Progress\",\
          \"documentation\":\"<p>A value between 0 and 100 that indicates the progress of the activity.</p>\"\
        },\
        \"Details\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The details about the activity.</p>\"\
        },\
        \"AutoScalingGroupState\":{\
          \"shape\":\"AutoScalingGroupState\",\
          \"documentation\":\"<p>The state of the Auto Scaling group, which is either <code>InService</code> or <code>Deleted</code>.</p>\"\
        },\
        \"AutoScalingGroupARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Auto Scaling group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes scaling activity, which is a long-running process that represents a change to your Auto Scaling group, such as changing its size or replacing an instance.</p>\"\
    },\
    \"ActivityIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlString\"}\
    },\
    \"ActivityType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Activity\":{\
          \"shape\":\"Activity\",\
          \"documentation\":\"<p>A scaling activity.</p>\"\
        }\
      }\
    },\
    \"AdjustmentType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdjustmentType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The policy adjustment type. The valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a policy adjustment type.</p>\"\
    },\
    \"AdjustmentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AdjustmentType\"}\
    },\
    \"Alarm\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AlarmName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the alarm.</p>\"\
        },\
        \"AlarmARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the alarm.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an alarm.</p>\"\
    },\
    \"Alarms\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Alarm\"}\
    },\
    \"AlreadyExistsFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>You already have an Auto Scaling group or launch configuration with this name.</p>\",\
      \"error\":{\
        \"code\":\"AlreadyExists\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"AsciiStringMaxLen255\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[A-Za-z0-9\\\\-_\\\\/]+\"\
    },\
    \"AssociatePublicIpAddress\":{\"type\":\"boolean\"},\
    \"AttachInstancesQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIds\",\
          \"documentation\":\"<p>The IDs of the instances. You can specify up to 20 instances.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"AttachLoadBalancerTargetGroupsResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AttachLoadBalancerTargetGroupsType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"TargetGroupARNs\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TargetGroupARNs\":{\
          \"shape\":\"TargetGroupARNs\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the target groups. You can specify up to 10 target groups. To get the ARN of a target group, use the Elastic Load Balancing <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
        }\
      }\
    },\
    \"AttachLoadBalancersResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AttachLoadBalancersType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"LoadBalancerNames\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>The names of the load balancers. You can specify up to 10 load balancers.</p>\"\
        }\
      }\
    },\
    \"AutoScalingGroup\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"MinSize\",\
        \"MaxSize\",\
        \"DesiredCapacity\",\
        \"DefaultCooldown\",\
        \"AvailabilityZones\",\
        \"HealthCheckType\",\
        \"CreatedTime\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"AutoScalingGroupARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Auto Scaling group.</p>\"\
        },\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the associated launch configuration.</p>\"\
        },\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>The launch template for the group.</p>\"\
        },\
        \"MixedInstancesPolicy\":{\
          \"shape\":\"MixedInstancesPolicy\",\
          \"documentation\":\"<p>The mixed instances policy for the group.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"AutoScalingGroupMinSize\",\
          \"documentation\":\"<p>The minimum size of the group.</p>\"\
        },\
        \"MaxSize\":{\
          \"shape\":\"AutoScalingGroupMaxSize\",\
          \"documentation\":\"<p>The maximum size of the group.</p>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired size of the group.</p>\"\
        },\
        \"DefaultCooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The duration of the default cooldown period, in seconds.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>One or more Availability Zones for the group.</p>\"\
        },\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>One or more load balancers associated with the group.</p>\"\
        },\
        \"TargetGroupARNs\":{\
          \"shape\":\"TargetGroupARNs\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the target groups for your load balancer.</p>\"\
        },\
        \"HealthCheckType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>. If you configure an Auto Scaling group to use ELB health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the load balancer health checks.</p>\"\
        },\
        \"HealthCheckGracePeriod\":{\
          \"shape\":\"HealthCheckGracePeriod\",\
          \"documentation\":\"<p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The EC2 instances associated with the group.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time the group was created.</p>\"\
        },\
        \"SuspendedProcesses\":{\
          \"shape\":\"SuspendedProcesses\",\
          \"documentation\":\"<p>The suspended processes associated with the group.</p>\"\
        },\
        \"PlacementGroup\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the placement group into which to launch your instances, if any.</p>\"\
        },\
        \"VPCZoneIdentifier\":{\
          \"shape\":\"XmlStringMaxLen2047\",\
          \"documentation\":\"<p>One or more subnet IDs, if applicable, separated by commas.</p>\"\
        },\
        \"EnabledMetrics\":{\
          \"shape\":\"EnabledMetrics\",\
          \"documentation\":\"<p>The metrics enabled for the group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The current state of the group when the <a>DeleteAutoScalingGroup</a> operation is in progress.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagDescriptionList\",\
          \"documentation\":\"<p>The tags for the group.</p>\"\
        },\
        \"TerminationPolicies\":{\
          \"shape\":\"TerminationPolicies\",\
          \"documentation\":\"<p>The termination policies for the group.</p>\"\
        },\
        \"NewInstancesProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>\"\
        },\
        \"ServiceLinkedRoleARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other AWS services on your behalf.</p>\"\
        },\
        \"MaxInstanceLifetime\":{\
          \"shape\":\"MaxInstanceLifetime\",\
          \"documentation\":\"<p>The maximum amount of time, in seconds, that an instance can be in service.</p> <p>Valid Range: Minimum value of 0.</p>\"\
        },\
        \"CapacityRebalance\":{\
          \"shape\":\"CapacityRebalanceEnabled\",\
          \"documentation\":\"<p>Indicates whether Capacity Rebalancing is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an Auto Scaling group.</p>\"\
    },\
    \"AutoScalingGroupDesiredCapacity\":{\"type\":\"integer\"},\
    \"AutoScalingGroupMaxSize\":{\"type\":\"integer\"},\
    \"AutoScalingGroupMinSize\":{\"type\":\"integer\"},\
    \"AutoScalingGroupNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"AutoScalingGroupNamesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupNames\":{\
          \"shape\":\"AutoScalingGroupNames\",\
          \"documentation\":\"<p>The names of the Auto Scaling groups. By default, you can only specify up to 50 names. You can optionally increase this limit using the <code>MaxRecords</code> parameter.</p> <p>If you omit this parameter, all Auto Scaling groups are described.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"AutoScalingGroupState\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1\
    },\
    \"AutoScalingGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoScalingGroup\"}\
    },\
    \"AutoScalingGroupsType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroups\"],\
      \"members\":{\
        \"AutoScalingGroups\":{\
          \"shape\":\"AutoScalingGroups\",\
          \"documentation\":\"<p>The groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"AutoScalingInstanceDetails\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AutoScalingGroupName\",\
        \"AvailabilityZone\",\
        \"LifecycleState\",\
        \"HealthStatus\",\
        \"ProtectedFromScaleIn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance type of the EC2 instance.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group for the instance.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The Availability Zone for the instance.</p>\"\
        },\
        \"LifecycleState\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The lifecycle state for the instance. The <code>Quarantined</code> state is not used. For information about lifecycle states, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html\\\">Instance lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p> <p>Valid Values: <code>Pending</code> | <code>Pending:Wait</code> | <code>Pending:Proceed</code> | <code>Quarantined</code> | <code>InService</code> | <code>Terminating</code> | <code>Terminating:Wait</code> | <code>Terminating:Proceed</code> | <code>Terminated</code> | <code>Detaching</code> | <code>Detached</code> | <code>EnteringStandby</code> | <code>Standby</code> </p>\"\
        },\
        \"HealthStatus\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The last reported health status of this instance. \\\"Healthy\\\" means that the instance is healthy and should remain in service. \\\"Unhealthy\\\" means that the instance is unhealthy and Amazon EC2 Auto Scaling should terminate and replace it.</p>\"\
        },\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The launch configuration used to launch the instance. This value is not available if you attached the instance to the Auto Scaling group.</p>\"\
        },\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>The launch template for the instance.</p>\"\
        },\
        \"ProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The number of capacity units contributed by the instance based on its instance type.</p> <p>Valid Range: Minimum value of 1. Maximum value of 999.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an EC2 instance associated with an Auto Scaling group.</p>\"\
    },\
    \"AutoScalingInstances\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AutoScalingInstanceDetails\"}\
    },\
    \"AutoScalingInstancesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingInstances\":{\
          \"shape\":\"AutoScalingInstances\",\
          \"documentation\":\"<p>The instances.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"AutoScalingNotificationTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"AvailabilityZones\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"BatchDeleteScheduledActionAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FailedScheduledActions\":{\
          \"shape\":\"FailedScheduledUpdateGroupActionRequests\",\
          \"documentation\":\"<p>The names of the scheduled actions that could not be deleted, including an error message.</p>\"\
        }\
      }\
    },\
    \"BatchDeleteScheduledActionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"ScheduledActionNames\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScheduledActionNames\":{\
          \"shape\":\"ScheduledActionNames\",\
          \"documentation\":\"<p>The names of the scheduled actions to delete. The maximum number allowed is 50. </p>\"\
        }\
      }\
    },\
    \"BatchPutScheduledUpdateGroupActionAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FailedScheduledUpdateGroupActions\":{\
          \"shape\":\"FailedScheduledUpdateGroupActionRequests\",\
          \"documentation\":\"<p>The names of the scheduled actions that could not be created or updated, including an error message.</p>\"\
        }\
      }\
    },\
    \"BatchPutScheduledUpdateGroupActionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"ScheduledUpdateGroupActions\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScheduledUpdateGroupActions\":{\
          \"shape\":\"ScheduledUpdateGroupActionRequests\",\
          \"documentation\":\"<p>One or more scheduled actions. The maximum number allowed is 50.</p>\"\
        }\
      }\
    },\
    \"BlockDeviceEbsDeleteOnTermination\":{\"type\":\"boolean\"},\
    \"BlockDeviceEbsEncrypted\":{\"type\":\"boolean\"},\
    \"BlockDeviceEbsIops\":{\
      \"type\":\"integer\",\
      \"max\":20000,\
      \"min\":100\
    },\
    \"BlockDeviceEbsVolumeSize\":{\
      \"type\":\"integer\",\
      \"max\":16384,\
      \"min\":1\
    },\
    \"BlockDeviceEbsVolumeType\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"BlockDeviceMapping\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeviceName\"],\
      \"members\":{\
        \"VirtualName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the virtual device (for example, <code>ephemeral0</code>).</p> <p>You can specify either <code>VirtualName</code> or <code>Ebs</code>, but not both.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The device name exposed to the EC2 instance (for example, <code>/dev/sdh</code> or <code>xvdh</code>). For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html\\\">Device Naming on Linux Instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"Ebs\":{\
          \"shape\":\"Ebs\",\
          \"documentation\":\"<p>Parameters used to automatically set up EBS volumes when an instance is launched.</p> <p>You can specify either <code>VirtualName</code> or <code>Ebs</code>, but not both.</p>\"\
        },\
        \"NoDevice\":{\
          \"shape\":\"NoDevice\",\
          \"documentation\":\"<p>Setting this value to <code>true</code> suppresses the specified device included in the block device mapping of the AMI.</p> <p>If <code>NoDevice</code> is <code>true</code> for the root device, instances might fail the EC2 health check. In that case, Amazon EC2 Auto Scaling launches replacement instances.</p> <p>If you specify <code>NoDevice</code>, you cannot specify <code>Ebs</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device mapping.</p>\"\
    },\
    \"BlockDeviceMappings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BlockDeviceMapping\"}\
    },\
    \"CancelInstanceRefreshAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance refresh ID.</p>\"\
        }\
      }\
    },\
    \"CancelInstanceRefreshType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"CapacityRebalanceEnabled\":{\"type\":\"boolean\"},\
    \"CheckpointDelay\":{\
      \"type\":\"integer\",\
      \"max\":172800,\
      \"min\":0\
    },\
    \"CheckpointPercentages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonZeroIntPercent\"}\
    },\
    \"ClassicLinkVPCSecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"CompleteLifecycleActionAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"CompleteLifecycleActionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LifecycleHookName\",\
        \"AutoScalingGroupName\",\
        \"LifecycleActionResult\"\
      ],\
      \"members\":{\
        \"LifecycleHookName\":{\
          \"shape\":\"AsciiStringMaxLen255\",\
          \"documentation\":\"<p>The name of the lifecycle hook.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LifecycleActionToken\":{\
          \"shape\":\"LifecycleActionToken\",\
          \"documentation\":\"<p>A universally unique identifier (UUID) that identifies a specific lifecycle action associated with an instance. Amazon EC2 Auto Scaling sends this token to the notification target you specified when you created the lifecycle hook.</p>\"\
        },\
        \"LifecycleActionResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>The action for the group to take. This parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        }\
      }\
    },\
    \"Cooldown\":{\"type\":\"integer\"},\
    \"CreateAutoScalingGroupType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"MinSize\",\
        \"MaxSize\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group. This name must be unique per Region per account.</p>\"\
        },\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the launch configuration to use to launch instances. </p> <p>Conditional: You must specify either a launch template (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a launch configuration (<code>LaunchConfigurationName</code> or <code>InstanceId</code>).</p>\"\
        },\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>Parameters used to specify the launch template and version to use to launch instances. </p> <p>Conditional: You must specify either a launch template (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a launch configuration (<code>LaunchConfigurationName</code> or <code>InstanceId</code>).</p> <note> <p>The launch template that is specified must be configured for use with an Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html\\\">Creating a launch template for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> </note>\"\
        },\
        \"MixedInstancesPolicy\":{\
          \"shape\":\"MixedInstancesPolicy\",\
          \"documentation\":\"<p>An embedded object that specifies a mixed instances policy. The required properties must be specified. If optional properties are unspecified, their default values are used.</p> <p>The policy includes properties that not only define the distribution of On-Demand Instances and Spot Instances, the maximum price to pay for Spot Instances, and how the Auto Scaling group allocates instance types to fulfill On-Demand and Spot capacities, but also the properties that specify the instance configuration informationâthe launch template and instance types. The policy can also include a weight for each instance type and different launch templates for individual instance types. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance used to base the launch configuration on. If specified, Amazon EC2 Auto Scaling uses the configuration values from the specified instance to create a new launch configuration. To get the instance ID, use the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html\\\">DescribeInstances</a> API operation. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-from-instance.html\\\">Creating an Auto Scaling group using an EC2 instance</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"AutoScalingGroupMinSize\",\
          \"documentation\":\"<p>The minimum size of the group.</p>\"\
        },\
        \"MaxSize\":{\
          \"shape\":\"AutoScalingGroupMaxSize\",\
          \"documentation\":\"<p>The maximum size of the group.</p> <note> <p>With a mixed instances policy that uses instance weighting, Amazon EC2 Auto Scaling may need to go above <code>MaxSize</code> to meet your capacity requirements. In this event, Amazon EC2 Auto Scaling will never go above <code>MaxSize</code> by more than your largest instance weight (weights that define how many units each instance contributes to the desired capacity of the group).</p> </note>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group at the time of its creation and the capacity it attempts to maintain. It can scale beyond this capacity if you configure auto scaling. This number must be greater than or equal to the minimum size of the group and less than or equal to the maximum size of the group. If you do not specify a desired capacity, the default is the minimum size of the group.</p>\"\
        },\
        \"DefaultCooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. The default value is <code>300</code>. This setting applies when using simple scaling policies, but not when using other scaling policies or scheduled scaling. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>A list of Availability Zones where instances in the Auto Scaling group can be created. This parameter is optional if you specify one or more subnets for <code>VPCZoneIdentifier</code>.</p> <p>Conditional: If your account supports EC2-Classic and VPC, this parameter is required to launch instances into EC2-Classic.</p>\"\
        },\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>A list of Classic Load Balancers associated with this Auto Scaling group. For Application Load Balancers, Network Load Balancers, and Gateway Load Balancers, specify the <code>TargetGroupARNs</code> property instead.</p>\"\
        },\
        \"TargetGroupARNs\":{\
          \"shape\":\"TargetGroupARNs\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the target groups to associate with the Auto Scaling group. Instances are registered as targets in a target group, and traffic is routed to the target group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Elastic Load Balancing and Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"HealthCheckType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The service to use for the health checks. The valid values are <code>EC2</code> (default) and <code>ELB</code>. If you configure an Auto Scaling group to use load balancer (ELB) health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the load balancer health checks. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html\\\">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"HealthCheckGracePeriod\":{\
          \"shape\":\"HealthCheckGracePeriod\",\
          \"documentation\":\"<p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service. During this time, any health check failures for the instance are ignored. The default value is <code>0</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period\\\">Health check grace period</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Conditional: Required if you are adding an <code>ELB</code> health check.</p>\"\
        },\
        \"PlacementGroup\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of an existing placement group into which to launch your instances, if any. A placement group is a logical grouping of instances within a single Availability Zone. You cannot specify multiple Availability Zones and a placement group. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html\\\">Placement Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"VPCZoneIdentifier\":{\
          \"shape\":\"XmlStringMaxLen2047\",\
          \"documentation\":\"<p>A comma-separated list of subnet IDs for a virtual private cloud (VPC) where instances in the Auto Scaling group can be created. If you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the subnets that you specify for this parameter must reside in those Availability Zones.</p> <p>Conditional: If your account supports EC2-Classic and VPC, this parameter is required to launch instances into a VPC.</p>\"\
        },\
        \"TerminationPolicies\":{\
          \"shape\":\"TerminationPolicies\",\
          \"documentation\":\"<p>A policy or a list of policies that are used to select the instance to terminate. These policies are executed in the order that you list them. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html\\\">Controlling which Auto Scaling instances terminate during scale in</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"NewInstancesProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in. For more information about preventing instances from terminating on scale in, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection\\\">Instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CapacityRebalance\":{\
          \"shape\":\"CapacityRebalanceEnabled\",\
          \"documentation\":\"<p>Indicates whether Capacity Rebalancing is enabled. Otherwise, Capacity Rebalancing is disabled. When you turn on Capacity Rebalancing, Amazon EC2 Auto Scaling attempts to launch a Spot Instance whenever Amazon EC2 notifies that a Spot Instance is at an elevated risk of interruption. After launching a new instance, it then terminates an old instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/capacity-rebalance.html\\\">Amazon EC2 Auto Scaling Capacity Rebalancing</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"LifecycleHookSpecificationList\":{\
          \"shape\":\"LifecycleHookSpecifications\",\
          \"documentation\":\"<p>One or more lifecycle hooks for the group, which specify actions to perform when Amazon EC2 Auto Scaling launches or terminates instances.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>One or more tags. You can tag your Auto Scaling group and propagate the tags to the Amazon EC2 instances it launches. Tags are not propagated to Amazon EBS volumes. To add tags to Amazon EBS volumes, specify the tags in a launch template but use caution. If the launch template specifies an instance tag with a key that is also specified for the Auto Scaling group, Amazon EC2 Auto Scaling overrides the value of that instance tag with the value specified by the Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html\\\">Tagging Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ServiceLinkedRoleARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other AWS services on your behalf. By default, Amazon EC2 Auto Scaling uses a service-linked role named AWSServiceRoleForAutoScaling, which it creates if it does not exist. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html\\\">Service-linked roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MaxInstanceLifetime\":{\
          \"shape\":\"MaxInstanceLifetime\",\
          \"documentation\":\"<p>The maximum amount of time, in seconds, that an instance can be in service. The default is null. If specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day). For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html\\\">Replacing Auto Scaling instances based on maximum instance lifetime</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateLaunchConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\"LaunchConfigurationName\"],\
      \"members\":{\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the launch configuration. This name must be unique per Region per account.</p>\"\
        },\
        \"ImageId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI) that was assigned during registration. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html\\\">Finding an AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>If you do not specify <code>InstanceId</code>, you must specify <code>ImageId</code>.</p>\"\
        },\
        \"KeyName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the key pair. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Amazon EC2 Key Pairs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>A list that contains the security groups to assign to the instances in the Auto Scaling group.</p> <p>[EC2-VPC] Specify the security group IDs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html\\\">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p> <p>[EC2-Classic] Specify either the security group names or the security group IDs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-network-security.html\\\">Amazon EC2 Security Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"ClassicLinkVPCId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink\\\">Linking EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>This parameter can only be used if you are launching EC2-Classic instances.</p>\"\
        },\
        \"ClassicLinkVPCSecurityGroups\":{\
          \"shape\":\"ClassicLinkVPCSecurityGroups\",\
          \"documentation\":\"<p>The IDs of one or more security groups for the specified ClassicLink-enabled VPC. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink\\\">Linking EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you specify the <code>ClassicLinkVPCId</code> parameter, you must specify this parameter.</p>\"\
        },\
        \"UserData\":{\
          \"shape\":\"XmlStringUserData\",\
          \"documentation\":\"<p>The user data to make available to the launched EC2 instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Linux) and <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Windows). If you are using a command line tool, base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance to use to create the launch configuration. The new launch configuration derives attributes from the instance, except for the block device mapping.</p> <p>To create a launch configuration with a block device mapping or override any other instance attributes, specify them as part of the same request.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-lc-with-instanceID.html\\\">Creating a launch configuration using an EC2 instance</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you do not specify <code>InstanceId</code>, you must specify both <code>ImageId</code> and <code>InstanceType</code>.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies the instance type of the EC2 instance.</p> <p>For information about available instance types, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes\\\">Available Instance Types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>If you do not specify <code>InstanceId</code>, you must specify <code>InstanceType</code>.</p>\"\
        },\
        \"KernelId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the kernel associated with the AMI.</p>\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the RAM disk to select.</p>\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappings\",\
          \"documentation\":\"<p>A block device mapping, which specifies the block devices for the instance. You can specify virtual devices and EBS volumes. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html\\\">Block Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"InstanceMonitoring\":{\
          \"shape\":\"InstanceMonitoring\",\
          \"documentation\":\"<p>Controls whether instances in this group are launched with detailed (<code>true</code>) or basic (<code>false</code>) monitoring.</p> <p>The default value is <code>true</code> (enabled).</p> <important> <p>When detailed monitoring is enabled, Amazon CloudWatch generates metrics every minute and your account is charged a fee. When you disable detailed monitoring, CloudWatch generates metrics every 5 minutes. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html\\\">Configure Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> </important>\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"SpotPrice\",\
          \"documentation\":\"<p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot price. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html\\\">Requesting Spot Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <note> <p>When you change your maximum price by creating a new launch configuration, running instances will continue to run as long as the maximum price for those running instances is higher than the current Spot price.</p> </note>\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"XmlStringMaxLen1600\",\
          \"documentation\":\"<p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance. The instance profile contains the IAM role.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html\\\">IAM role for applications that run on Amazon EC2 instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"EbsOptimized\",\
          \"documentation\":\"<p>Specifies whether the launch configuration is optimized for EBS I/O (<code>true</code>) or not (<code>false</code>). The optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization is not available with all instance types. Additional fees are incurred when you enable EBS optimization for an instance type that is not EBS-optimized by default. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html\\\">Amazon EBS-Optimized Instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>The default value is <code>false</code>.</p>\"\
        },\
        \"AssociatePublicIpAddress\":{\
          \"shape\":\"AssociatePublicIpAddress\",\
          \"documentation\":\"<p>For Auto Scaling groups that are running in a virtual private cloud (VPC), specifies whether to assign a public IP address to the group's instances. If you specify <code>true</code>, each instance in the Auto Scaling group receives a unique public IP address. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html\\\">Launching Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you specify this parameter, you must specify at least one subnet for <code>VPCZoneIdentifier</code> when you create your group.</p> <note> <p>If the instance is launched into a default subnet, the default is to assign a public IP address, unless you disabled the option to assign a public IP address on the subnet. If the instance is launched into a nondefault subnet, the default is not to assign a public IP address, unless you enabled the option to assign a public IP address on the subnet.</p> </note>\"\
        },\
        \"PlacementTenancy\":{\
          \"shape\":\"XmlStringMaxLen64\",\
          \"documentation\":\"<p>The tenancy of the instance. An instance with <code>dedicated</code> tenancy runs on isolated, single-tenant hardware and can only be launched into a VPC.</p> <p>To launch dedicated instances into a shared tenancy VPC (a VPC with the instance placement tenancy attribute set to <code>default</code>), you must set the value of this parameter to <code>dedicated</code>.</p> <p>If you specify <code>PlacementTenancy</code>, you must specify at least one subnet for <code>VPCZoneIdentifier</code> when you create your group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html\\\">Configuring instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Valid Values: <code>default</code> | <code>dedicated</code> </p>\"\
        },\
        \"MetadataOptions\":{\
          \"shape\":\"InstanceMetadataOptions\",\
          \"documentation\":\"<p>The metadata options for the instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds\\\">Configuring the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"CreateOrUpdateTagsType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Tags\"],\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      }\
    },\
    \"CustomizedMetricSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MetricName\",\
        \"Namespace\",\
        \"Statistic\"\
      ],\
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Namespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>The namespace of the metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"MetricDimensions\",\
          \"documentation\":\"<p>The dimensions of the metric.</p> <p>Conditional: If you published your metric with dimensions, you must specify the same dimensions in your scaling policy.</p>\"\
        },\
        \"Statistic\":{\
          \"shape\":\"MetricStatistic\",\
          \"documentation\":\"<p>The statistic of the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit of the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with Amazon EC2 Auto Scaling.</p> <p>To create your customized metric specification:</p> <ul> <li> <p>Add values for each required parameter from CloudWatch. You can use an existing metric, or a new metric that you create. To use your own metric, you must first publish the metric to CloudWatch. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html\\\">Publish Custom Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> </li> <li> <p>Choose a metric that changes proportionally with capacity. The value of the metric should increase or decrease in inverse proportion to the number of capacity units. That is, the value of the metric should decrease when capacity increases.</p> </li> </ul> <p>For more information about CloudWatch, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html\\\">Amazon CloudWatch Concepts</a>.</p>\"\
    },\
    \"DeleteAutoScalingGroupType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ForceDelete\":{\
          \"shape\":\"ForceDelete\",\
          \"documentation\":\"<p>Specifies that the group is to be deleted along with all instances associated with the group, without waiting for all instances to be terminated. This parameter also deletes any lifecycle actions associated with the group.</p>\"\
        }\
      }\
    },\
    \"DeleteLifecycleHookAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteLifecycleHookType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LifecycleHookName\",\
        \"AutoScalingGroupName\"\
      ],\
      \"members\":{\
        \"LifecycleHookName\":{\
          \"shape\":\"AsciiStringMaxLen255\",\
          \"documentation\":\"<p>The name of the lifecycle hook.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"DeleteNotificationConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"TopicARN\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TopicARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (Amazon SNS) topic.</p>\"\
        }\
      }\
    },\
    \"DeletePolicyType\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name or Amazon Resource Name (ARN) of the policy.</p>\"\
        }\
      }\
    },\
    \"DeleteScheduledActionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"ScheduledActionName\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScheduledActionName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the action to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteTagsType\":{\
      \"type\":\"structure\",\
      \"required\":[\"Tags\"],\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      }\
    },\
    \"DescribeAccountLimitsAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxNumberOfAutoScalingGroups\":{\
          \"shape\":\"MaxNumberOfAutoScalingGroups\",\
          \"documentation\":\"<p>The maximum number of groups allowed for your AWS account. The default is 200 groups per AWS Region.</p>\"\
        },\
        \"MaxNumberOfLaunchConfigurations\":{\
          \"shape\":\"MaxNumberOfLaunchConfigurations\",\
          \"documentation\":\"<p>The maximum number of launch configurations allowed for your AWS account. The default is 200 launch configurations per AWS Region.</p>\"\
        },\
        \"NumberOfAutoScalingGroups\":{\
          \"shape\":\"NumberOfAutoScalingGroups\",\
          \"documentation\":\"<p>The current number of groups for your AWS account.</p>\"\
        },\
        \"NumberOfLaunchConfigurations\":{\
          \"shape\":\"NumberOfLaunchConfigurations\",\
          \"documentation\":\"<p>The current number of launch configurations for your AWS account.</p>\"\
        }\
      }\
    },\
    \"DescribeAdjustmentTypesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AdjustmentTypes\":{\
          \"shape\":\"AdjustmentTypes\",\
          \"documentation\":\"<p>The policy adjustment types.</p>\"\
        }\
      }\
    },\
    \"DescribeAutoScalingInstancesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIds\",\
          \"documentation\":\"<p>The IDs of the instances. You can specify up to <code>MaxRecords</code> IDs. If you omit this parameter, all Auto Scaling instances are described. If you specify an ID that does not exist, it is ignored with no error.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>50</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        }\
      }\
    },\
    \"DescribeAutoScalingNotificationTypesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingNotificationTypes\":{\
          \"shape\":\"AutoScalingNotificationTypes\",\
          \"documentation\":\"<p>The notification types.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceRefreshesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshes\":{\
          \"shape\":\"InstanceRefreshes\",\
          \"documentation\":\"<p>The instance refreshes for the specified group.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceRefreshesType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"InstanceRefreshIds\":{\
          \"shape\":\"InstanceRefreshIds\",\
          \"documentation\":\"<p>One or more instance refresh IDs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeLifecycleHookTypesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LifecycleHookTypes\":{\
          \"shape\":\"AutoScalingNotificationTypes\",\
          \"documentation\":\"<p>The lifecycle hook types.</p>\"\
        }\
      }\
    },\
    \"DescribeLifecycleHooksAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LifecycleHooks\":{\
          \"shape\":\"LifecycleHooks\",\
          \"documentation\":\"<p>The lifecycle hooks for the specified group.</p>\"\
        }\
      }\
    },\
    \"DescribeLifecycleHooksType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LifecycleHookNames\":{\
          \"shape\":\"LifecycleHookNames\",\
          \"documentation\":\"<p>The names of one or more lifecycle hooks. If you omit this parameter, all lifecycle hooks are described.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancerTargetGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>100</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancerTargetGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerTargetGroups\":{\
          \"shape\":\"LoadBalancerTargetGroupStates\",\
          \"documentation\":\"<p>Information about the target groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>100</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeLoadBalancersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancers\":{\
          \"shape\":\"LoadBalancerStates\",\
          \"documentation\":\"<p>The load balancers.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"DescribeMetricCollectionTypesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metrics\":{\
          \"shape\":\"MetricCollectionTypes\",\
          \"documentation\":\"<p>One or more metrics.</p>\"\
        },\
        \"Granularities\":{\
          \"shape\":\"MetricGranularityTypes\",\
          \"documentation\":\"<p>The granularities for the metrics.</p>\"\
        }\
      }\
    },\
    \"DescribeNotificationConfigurationsAnswer\":{\
      \"type\":\"structure\",\
      \"required\":[\"NotificationConfigurations\"],\
      \"members\":{\
        \"NotificationConfigurations\":{\
          \"shape\":\"NotificationConfigurations\",\
          \"documentation\":\"<p>The notification configurations.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"DescribeNotificationConfigurationsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupNames\":{\
          \"shape\":\"AutoScalingGroupNames\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribePoliciesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"PolicyNames\":{\
          \"shape\":\"PolicyNames\",\
          \"documentation\":\"<p>The names of one or more policies. If you omit this parameter, all policies are described. If a group name is provided, the results are limited to that group. This list is limited to 50 items. If you specify an unknown policy name, it is ignored with no error.</p>\"\
        },\
        \"PolicyTypes\":{\
          \"shape\":\"PolicyTypes\",\
          \"documentation\":\"<p>One or more policy types. The valid values are <code>SimpleScaling</code>, <code>StepScaling</code>, and <code>TargetTrackingScaling</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to be returned with each call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeScalingActivitiesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ActivityIds\":{\
          \"shape\":\"ActivityIds\",\
          \"documentation\":\"<p>The activity IDs of the desired scaling activities. You can specify up to 50 IDs. If you omit this parameter, all activities for the past six weeks are described. If unknown activities are requested, they are ignored with no error. If you specify an Auto Scaling group, the results are limited to that group.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"IncludeDeletedGroups\":{\
          \"shape\":\"IncludeDeletedGroups\",\
          \"documentation\":\"<p>Indicates whether to include scaling activity from deleted Auto Scaling groups.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>100</code> and the maximum value is <code>100</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        }\
      }\
    },\
    \"DescribeScheduledActionsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScheduledActionNames\":{\
          \"shape\":\"ScheduledActionNames\",\
          \"documentation\":\"<p>The names of one or more scheduled actions. You can specify up to 50 actions. If you omit this parameter, all scheduled actions are described. If you specify an unknown scheduled action, it is ignored with no error.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The earliest scheduled start time to return. If scheduled action names are provided, this parameter is ignored.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The latest scheduled start time to return. If scheduled action names are provided, this parameter is ignored.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeTagsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>One or more filters to scope the tags to return. The maximum number of filters per filter type (for example, <code>auto-scaling-group</code>) is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeTerminationPolicyTypesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TerminationPolicyTypes\":{\
          \"shape\":\"TerminationPolicies\",\
          \"documentation\":\"<p>The termination policies supported by Amazon EC2 Auto Scaling: <code>OldestInstance</code>, <code>OldestLaunchConfiguration</code>, <code>NewestInstance</code>, <code>ClosestToNextInstanceHour</code>, <code>Default</code>, <code>OldestLaunchTemplate</code>, and <code>AllocationStrategy</code>.</p>\"\
        }\
      }\
    },\
    \"DetachInstancesAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Activities\":{\
          \"shape\":\"Activities\",\
          \"documentation\":\"<p>The activities related to detaching the instances from the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"DetachInstancesQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"ShouldDecrementDesiredCapacity\"\
      ],\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIds\",\
          \"documentation\":\"<p>The IDs of the instances. You can specify up to 20 instances.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ShouldDecrementDesiredCapacity\":{\
          \"shape\":\"ShouldDecrementDesiredCapacity\",\
          \"documentation\":\"<p>Indicates whether the Auto Scaling group decrements the desired capacity value by the number of instances detached.</p>\"\
        }\
      }\
    },\
    \"DetachLoadBalancerTargetGroupsResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DetachLoadBalancerTargetGroupsType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"TargetGroupARNs\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TargetGroupARNs\":{\
          \"shape\":\"TargetGroupARNs\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the target groups. You can specify up to 10 target groups.</p>\"\
        }\
      }\
    },\
    \"DetachLoadBalancersResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DetachLoadBalancersType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"LoadBalancerNames\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>The names of the load balancers. You can specify up to 10 load balancers.</p>\"\
        }\
      }\
    },\
    \"DisableMetricsCollectionQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"Metrics\",\
          \"documentation\":\"<p>Specifies one or more of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> </ul> <p>If you omit this parameter, all metrics are disabled. </p>\"\
        }\
      }\
    },\
    \"DisableScaleIn\":{\"type\":\"boolean\"},\
    \"Ebs\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SnapshotId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The snapshot ID of the volume to use.</p> <p>You must specify either a <code>VolumeSize</code> or a <code>SnapshotId</code>.</p>\"\
        },\
        \"VolumeSize\":{\
          \"shape\":\"BlockDeviceEbsVolumeSize\",\
          \"documentation\":\"<p>The volume size, in Gibibytes (GiB).</p> <p>This can be a number from 1-1,024 for <code>standard</code>, 4-16,384 for <code>io1</code>, 1-16,384 for <code>gp2</code>, and 500-16,384 for <code>st1</code> and <code>sc1</code>. If you specify a snapshot, the volume size must be equal to or larger than the snapshot size.</p> <p>Default: If you create a volume from a snapshot and you don't specify a volume size, the default is the snapshot size.</p> <p>You must specify either a <code>VolumeSize</code> or a <code>SnapshotId</code>. If you specify both <code>SnapshotId</code> and <code>VolumeSize</code>, the volume size must be equal or greater than the size of the snapshot.</p>\"\
        },\
        \"VolumeType\":{\
          \"shape\":\"BlockDeviceEbsVolumeType\",\
          \"documentation\":\"<p>The volume type, which can be <code>standard</code> for Magnetic, <code>io1</code> for Provisioned IOPS SSD, <code>gp2</code> for General Purpose SSD, <code>st1</code> for Throughput Optimized HDD, or <code>sc1</code> for Cold HDD. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html\\\">Amazon EBS Volume Types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>Valid Values: <code>standard</code> | <code>io1</code> | <code>gp2</code> | <code>st1</code> | <code>sc1</code> </p>\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"BlockDeviceEbsDeleteOnTermination\",\
          \"documentation\":\"<p>Indicates whether the volume is deleted on instance termination. For Amazon EC2 Auto Scaling, the default value is <code>true</code>.</p>\"\
        },\
        \"Iops\":{\
          \"shape\":\"BlockDeviceEbsIops\",\
          \"documentation\":\"<p>The number of I/O operations per second (IOPS) to provision for the volume. The maximum ratio of IOPS to volume size (in GiB) is 50:1. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html\\\">Amazon EBS Volume Types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>Required when the volume type is <code>io1</code>. (Not used with <code>standard</code>, <code>gp2</code>, <code>st1</code>, or <code>sc1</code> volumes.) </p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"BlockDeviceEbsEncrypted\",\
          \"documentation\":\"<p>Specifies whether the volume should be encrypted. Encrypted EBS volumes can only be attached to instances that support Amazon EBS encryption. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances\\\">Supported Instance Types</a>. If your AMI uses encrypted volumes, you can also only launch it on supported instance types.</p> <note> <p>If you are creating a volume from a snapshot, you cannot specify an encryption value. Volumes that are created from encrypted snapshots are automatically encrypted, and volumes that are created from unencrypted snapshots are automatically unencrypted. By default, encrypted snapshots use the AWS managed CMK that is used for EBS encryption, but you can specify a custom CMK when you create the snapshot. The ability to encrypt a snapshot during copying also allows you to apply a new CMK to an already-encrypted snapshot. Volumes restored from the resulting copy are only accessible using the new CMK.</p> <p>Enabling <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#encryption-by-default\\\">encryption by default</a> results in all EBS volumes being encrypted with the AWS managed CMK or a customer managed CMK, whether or not the snapshot was encrypted.</p> </note> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIEncryption.html\\\">Using Encryption with EBS-Backed AMIs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/key-policy-requirements-EBS-encryption.html\\\">Required CMK key policy for use with encrypted volumes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used to set up an Amazon EBS volume specified in a block device mapping.</p>\"\
    },\
    \"EbsOptimized\":{\"type\":\"boolean\"},\
    \"EnableMetricsCollectionQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"Granularity\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"Metrics\",\
          \"documentation\":\"<p>Specifies which group-level metrics to start collecting. You can specify one or more of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> </ul> <p>The instance weighting feature supports the following additional metrics: </p> <ul> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> </ul> <p>If you omit this parameter, all metrics are enabled. </p>\"\
        },\
        \"Granularity\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The granularity to associate with the metrics to collect. The only valid value is <code>1Minute</code>.</p>\"\
        }\
      }\
    },\
    \"EnabledMetric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> </ul>\"\
        },\
        \"Granularity\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The granularity of the metric. The only valid value is <code>1Minute</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an enabled metric.</p>\"\
    },\
    \"EnabledMetrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EnabledMetric\"}\
    },\
    \"EnterStandbyAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Activities\":{\
          \"shape\":\"Activities\",\
          \"documentation\":\"<p>The activities related to moving instances into <code>Standby</code> mode.</p>\"\
        }\
      }\
    },\
    \"EnterStandbyQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"ShouldDecrementDesiredCapacity\"\
      ],\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIds\",\
          \"documentation\":\"<p>The IDs of the instances. You can specify up to 20 instances.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ShouldDecrementDesiredCapacity\":{\
          \"shape\":\"ShouldDecrementDesiredCapacity\",\
          \"documentation\":\"<p>Indicates whether to decrement the desired capacity of the Auto Scaling group by the number of instances moved to <code>Standby</code> mode.</p>\"\
        }\
      }\
    },\
    \"EstimatedInstanceWarmup\":{\"type\":\"integer\"},\
    \"ExecutePolicyType\":{\
      \"type\":\"structure\",\
      \"required\":[\"PolicyName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name or ARN of the policy.</p>\"\
        },\
        \"HonorCooldown\":{\
          \"shape\":\"HonorCooldown\",\
          \"documentation\":\"<p>Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete before executing the policy.</p> <p>Valid only if the policy type is <code>SimpleScaling</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MetricValue\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The metric value to compare to <code>BreachThreshold</code>. This enables you to execute a policy of type <code>StepScaling</code> and determine which step adjustment to use. For example, if the breach threshold is 50 and you want to use a step adjustment with a lower bound of 0 and an upper bound of 10, you can set the metric value to 59.</p> <p>If you specify a metric value that doesn't correspond to a step adjustment for the policy, the call returns an error.</p> <p>Required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>\"\
        },\
        \"BreachThreshold\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The breach threshold for the alarm.</p> <p>Required if the policy type is <code>StepScaling</code> and not supported otherwise.</p>\"\
        }\
      }\
    },\
    \"ExitStandbyAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Activities\":{\
          \"shape\":\"Activities\",\
          \"documentation\":\"<p>The activities related to moving instances out of <code>Standby</code> mode.</p>\"\
        }\
      }\
    },\
    \"ExitStandbyQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIds\",\
          \"documentation\":\"<p>The IDs of the instances. You can specify up to 20 instances.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"FailedScheduledUpdateGroupActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ScheduledActionName\"],\
      \"members\":{\
        \"ScheduledActionName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the scheduled action.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"XmlStringMaxLen64\",\
          \"documentation\":\"<p>The error code.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The error message accompanying the error code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a scheduled action that could not be created, updated, or deleted.</p>\"\
    },\
    \"FailedScheduledUpdateGroupActionRequests\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FailedScheduledUpdateGroupActionRequest\"}\
    },\
    \"Filter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the filter. The valid values are: <code>auto-scaling-group</code>, <code>key</code>, <code>value</code>, and <code>propagate-at-launch</code>.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"Values\",\
          \"documentation\":\"<p>One or more filter values. Filter values are case-sensitive.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a filter that is used to return a more specific list of results when describing tags.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-tagging.html\\\">Tagging Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"Filters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Filter\"}\
    },\
    \"ForceDelete\":{\"type\":\"boolean\"},\
    \"GlobalTimeout\":{\"type\":\"integer\"},\
    \"HealthCheckGracePeriod\":{\"type\":\"integer\"},\
    \"HeartbeatTimeout\":{\"type\":\"integer\"},\
    \"HonorCooldown\":{\"type\":\"boolean\"},\
    \"IncludeDeletedGroups\":{\"type\":\"boolean\"},\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AvailabilityZone\",\
        \"LifecycleState\",\
        \"HealthStatus\",\
        \"ProtectedFromScaleIn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance type of the EC2 instance.</p>\"\
        },\
        \"AvailabilityZone\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The Availability Zone in which the instance is running.</p>\"\
        },\
        \"LifecycleState\":{\
          \"shape\":\"LifecycleState\",\
          \"documentation\":\"<p>A description of the current lifecycle state. The <code>Quarantined</code> state is not used. For information about lifecycle states, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html\\\">Instance lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
        },\
        \"HealthStatus\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The last reported health status of the instance. \\\"Healthy\\\" means that the instance is healthy and should remain in service. \\\"Unhealthy\\\" means that the instance is unhealthy and that Amazon EC2 Auto Scaling should terminate and replace it.</p>\"\
        },\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The launch configuration associated with the instance.</p>\"\
        },\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>The launch template for the instance.</p>\"\
        },\
        \"ProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The number of capacity units contributed by the instance based on its instance type.</p> <p>Valid Range: Minimum value of 1. Maximum value of 999.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an EC2 instance.</p>\"\
    },\
    \"InstanceIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen19\"}\
    },\
    \"InstanceMetadataEndpointState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"disabled\",\
        \"enabled\"\
      ]\
    },\
    \"InstanceMetadataHttpPutResponseHopLimit\":{\
      \"type\":\"integer\",\
      \"max\":64,\
      \"min\":1\
    },\
    \"InstanceMetadataHttpTokensState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"optional\",\
        \"required\"\
      ]\
    },\
    \"InstanceMetadataOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HttpTokens\":{\
          \"shape\":\"InstanceMetadataHttpTokensState\",\
          \"documentation\":\"<p>The state of token usage for your instance metadata requests. If the parameter is not specified in the request, the default state is <code>optional</code>.</p> <p>If the state is <code>optional</code>, you can choose to retrieve instance metadata with or without a signed token header on your request. If you retrieve the IAM role credentials without a token, the version 1.0 role credentials are returned. If you retrieve the IAM role credentials using a valid signed token, the version 2.0 role credentials are returned.</p> <p>If the state is <code>required</code>, you must send a signed token header with any instance metadata retrieval requests. In this state, retrieving the IAM role credentials always returns the version 2.0 credentials; the version 1.0 credentials are not available.</p>\"\
        },\
        \"HttpPutResponseHopLimit\":{\
          \"shape\":\"InstanceMetadataHttpPutResponseHopLimit\",\
          \"documentation\":\"<p>The desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel.</p> <p>Default: 1</p>\"\
        },\
        \"HttpEndpoint\":{\
          \"shape\":\"InstanceMetadataEndpointState\",\
          \"documentation\":\"<p>This parameter enables or disables the HTTP metadata endpoint on your instances. If the parameter is not specified, the default state is <code>enabled</code>.</p> <note> <p>If you specify a value of <code>disabled</code>, you will not be able to access your instance metadata. </p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The metadata options for the instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds\\\">Configuring the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"InstanceMonitoring\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Enabled\":{\
          \"shape\":\"MonitoringEnabled\",\
          \"documentation\":\"<p>If <code>true</code>, detailed monitoring is enabled. Otherwise, basic monitoring is enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes whether detailed monitoring is enabled for the Auto Scaling instances.</p>\"\
    },\
    \"InstanceProtected\":{\"type\":\"boolean\"},\
    \"InstanceRefresh\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance refresh ID.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"InstanceRefreshStatus\",\
          \"documentation\":\"<p>The current status for the instance refresh operation:</p> <ul> <li> <p> <code>Pending</code> - The request was created, but the operation has not started.</p> </li> <li> <p> <code>InProgress</code> - The operation is in progress.</p> </li> <li> <p> <code>Successful</code> - The operation completed successfully.</p> </li> <li> <p> <code>Failed</code> - The operation failed to complete. You can troubleshoot using the status reason and the scaling activities. </p> </li> <li> <p> <code>Cancelling</code> - An ongoing operation is being cancelled. Cancellation does not roll back any replacements that have already been completed, but it prevents new replacements from being started. </p> </li> <li> <p> <code>Cancelled</code> - The operation is cancelled. </p> </li> </ul>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Provides more details about the current status of the instance refresh. </p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time at which the instance refresh began.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time at which the instance refresh ended.</p>\"\
        },\
        \"PercentageComplete\":{\
          \"shape\":\"IntPercent\",\
          \"documentation\":\"<p>The percentage of the instance refresh that is complete. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and added to the percentage complete.</p>\"\
        },\
        \"InstancesToUpdate\":{\
          \"shape\":\"InstancesToUpdate\",\
          \"documentation\":\"<p>The number of instances remaining to update before the instance refresh is complete.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance refresh for an Auto Scaling group. </p>\"\
    },\
    \"InstanceRefreshIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"InstanceRefreshInProgressFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"XmlStringMaxLen255\"}\
      },\
      \"documentation\":\"<p>The request failed because an active instance refresh operation already exists for the specified Auto Scaling group.</p>\",\
      \"error\":{\
        \"code\":\"InstanceRefreshInProgress\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InstanceRefreshStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"InProgress\",\
        \"Successful\",\
        \"Failed\",\
        \"Cancelling\",\
        \"Cancelled\"\
      ]\
    },\
    \"InstanceRefreshes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceRefresh\"}\
    },\
    \"Instances\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Instance\"}\
    },\
    \"InstancesDistribution\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OnDemandAllocationStrategy\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>Indicates how to allocate instance types to fulfill On-Demand capacity. The only valid value is <code>prioritized</code>, which is also the default value. This strategy uses the order of instance types in the <code>LaunchTemplateOverrides</code> to define the launch priority of each instance type. The first instance type in the array is prioritized higher than the last. If all your On-Demand capacity cannot be fulfilled using your highest priority instance, then the Auto Scaling groups launches the remaining capacity using the second priority instance type, and so on.</p>\"\
        },\
        \"OnDemandBaseCapacity\":{\
          \"shape\":\"OnDemandBaseCapacity\",\
          \"documentation\":\"<p>The minimum amount of the Auto Scaling group's capacity that must be fulfilled by On-Demand Instances. This base portion is provisioned first as your group scales. Defaults to 0 if not specified. If you specify weights for the instance types in the overrides, set the value of <code>OnDemandBaseCapacity</code> in terms of the number of capacity units, and not the number of instances.</p>\"\
        },\
        \"OnDemandPercentageAboveBaseCapacity\":{\
          \"shape\":\"OnDemandPercentageAboveBaseCapacity\",\
          \"documentation\":\"<p>Controls the percentages of On-Demand Instances and Spot Instances for your additional capacity beyond <code>OnDemandBaseCapacity</code>. Expressed as a number (for example, 20 specifies 20% On-Demand Instances, 80% Spot Instances). Defaults to 100 if not specified. If set to 100, only On-Demand Instances are provisioned.</p>\"\
        },\
        \"SpotAllocationStrategy\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>Indicates how to allocate instances across Spot Instance pools. </p> <p>If the allocation strategy is <code>lowest-price</code>, the Auto Scaling group launches instances using the Spot pools with the lowest price, and evenly allocates your instances across the number of Spot pools that you specify. Defaults to <code>lowest-price</code> if not specified.</p> <p>If the allocation strategy is <code>capacity-optimized</code> (recommended), the Auto Scaling group launches instances using Spot pools that are optimally chosen based on the available Spot capacity. Alternatively, you can use <code>capacity-optimized-prioritized</code> and set the order of instance types in the list of launch template overrides from highest to lowest priority (from first to last in the list). Amazon EC2 Auto Scaling honors the instance type priorities on a best-effort basis but optimizes for capacity first. </p>\"\
        },\
        \"SpotInstancePools\":{\
          \"shape\":\"SpotInstancePools\",\
          \"documentation\":\"<p>The number of Spot Instance pools across which to allocate your Spot Instances. The Spot pools are determined from the different instance types in the overrides. Valid only when the Spot allocation strategy is <code>lowest-price</code>. Value must be in the range of 1 to 20. Defaults to 2 if not specified.</p>\"\
        },\
        \"SpotMaxPrice\":{\
          \"shape\":\"MixedInstanceSpotPrice\",\
          \"documentation\":\"<p>The maximum price per unit hour that you are willing to pay for a Spot Instance. If you leave the value at its default (empty), Amazon EC2 Auto Scaling uses the On-Demand price as the maximum Spot price. To remove a value that you previously set, include the property but specify an empty string (\\\"\\\") for the value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instances distribution for an Auto Scaling group with a <a>MixedInstancesPolicy</a>.</p> <p>The instances distribution specifies the distribution of On-Demand Instances and Spot Instances, the maximum price to pay for Spot Instances, and how the Auto Scaling group allocates instance types to fulfill On-Demand and Spot capacities.</p> <p>When you update <code>SpotAllocationStrategy</code>, <code>SpotInstancePools</code>, or <code>SpotMaxPrice</code>, this update action does not deploy any changes across the running Amazon EC2 instances in the group. Your existing Spot Instances continue to run as long as the maximum price for those instances is higher than the current Spot price. When scale out occurs, Amazon EC2 Auto Scaling launches instances based on the new settings. When scale in occurs, Amazon EC2 Auto Scaling terminates instances according to the group's termination policies.</p>\"\
    },\
    \"InstancesToUpdate\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"IntPercent\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"InvalidNextToken\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The <code>NextToken</code> value is not valid.</p>\",\
      \"error\":{\
        \"code\":\"InvalidNextToken\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LaunchConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LaunchConfigurationName\",\
        \"ImageId\",\
        \"InstanceType\",\
        \"CreatedTime\"\
      ],\
      \"members\":{\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the launch configuration.</p>\"\
        },\
        \"LaunchConfigurationARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the launch configuration.</p>\"\
        },\
        \"ImageId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI) to use to launch your EC2 instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html\\\">Finding an AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"KeyName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the key pair.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Amazon EC2 Key Pairs</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>A list that contains the security groups to assign to the instances in the Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html\\\">Security Groups for Your VPC</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
        },\
        \"ClassicLinkVPCId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of a ClassicLink-enabled VPC to link your EC2-Classic instances to. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink\\\">Linking EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ClassicLinkVPCSecurityGroups\":{\
          \"shape\":\"ClassicLinkVPCSecurityGroups\",\
          \"documentation\":\"<p>The IDs of one or more security groups for the VPC specified in <code>ClassicLinkVPCId</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html\\\">ClassicLink</a> in the <i>Amazon EC2 User Guide for Linux Instances</i> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html#as-ClassicLink\\\">Linking EC2-Classic instances to a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"UserData\":{\
          \"shape\":\"XmlStringUserData\",\
          \"documentation\":\"<p>The user data to make available to the launched EC2 instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Linux) and <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Windows). If you are using a command line tool, base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance type for the instances.</p> <p>For information about available instance types, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes\\\">Available Instance Types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"KernelId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the kernel associated with the AMI.</p>\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the RAM disk associated with the AMI.</p>\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappings\",\
          \"documentation\":\"<p>A block device mapping, which specifies the block devices for the instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html\\\">Block Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"InstanceMonitoring\":{\
          \"shape\":\"InstanceMonitoring\",\
          \"documentation\":\"<p>Controls whether instances in this group are launched with detailed (<code>true</code>) or basic (<code>false</code>) monitoring.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html\\\">Configure Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"SpotPrice\",\
          \"documentation\":\"<p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot price. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-spot-instances.html\\\">Requesting Spot Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"XmlStringMaxLen1600\",\
          \"documentation\":\"<p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance. The instance profile contains the IAM role. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html\\\">IAM role for applications that run on Amazon EC2 instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The creation date and time for the launch configuration.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"EbsOptimized\",\
          \"documentation\":\"<p>Specifies whether the launch configuration is optimized for EBS I/O (<code>true</code>) or not (<code>false</code>). For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html\\\">Amazon EBS-Optimized Instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"AssociatePublicIpAddress\":{\
          \"shape\":\"AssociatePublicIpAddress\",\
          \"documentation\":\"<p>For Auto Scaling groups that are running in a VPC, specifies whether to assign a public IP address to the group's instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html\\\">Launching Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"PlacementTenancy\":{\
          \"shape\":\"XmlStringMaxLen64\",\
          \"documentation\":\"<p>The tenancy of the instance, either <code>default</code> or <code>dedicated</code>. An instance with <code>dedicated</code> tenancy runs on isolated, single-tenant hardware and can only be launched into a VPC.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html\\\">Configuring instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MetadataOptions\":{\
          \"shape\":\"InstanceMetadataOptions\",\
          \"documentation\":\"<p>The metadata options for the instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds\\\">Configuring the Instance Metadata Options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a launch configuration.</p>\"\
    },\
    \"LaunchConfigurationNameType\":{\
      \"type\":\"structure\",\
      \"required\":[\"LaunchConfigurationName\"],\
      \"members\":{\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the launch configuration.</p>\"\
        }\
      }\
    },\
    \"LaunchConfigurationNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"LaunchConfigurationNamesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LaunchConfigurationNames\":{\
          \"shape\":\"LaunchConfigurationNames\",\
          \"documentation\":\"<p>The launch configuration names. If you omit this parameter, all launch configurations are described.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        }\
      }\
    },\
    \"LaunchConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LaunchConfiguration\"}\
    },\
    \"LaunchConfigurationsType\":{\
      \"type\":\"structure\",\
      \"required\":[\"LaunchConfigurations\"],\
      \"members\":{\
        \"LaunchConfigurations\":{\
          \"shape\":\"LaunchConfigurations\",\
          \"documentation\":\"<p>The launch configurations.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"LaunchTemplate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LaunchTemplateSpecification\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>The launch template to use.</p>\"\
        },\
        \"Overrides\":{\
          \"shape\":\"Overrides\",\
          \"documentation\":\"<p>Any properties that you specify override the same properties in the launch template. If not provided, Amazon EC2 Auto Scaling uses the instance type specified in the launch template when it launches an instance. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a launch template and overrides. </p> <p>You specify these properties as part of a mixed instances policy. </p> <p>When you update the launch template or overrides, existing Amazon EC2 instances continue to run. When scale out occurs, Amazon EC2 Auto Scaling launches instances to match the new settings. When scale in occurs, Amazon EC2 Auto Scaling terminates instances according to the group's termination policies.</p>\"\
    },\
    \"LaunchTemplateName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":3,\
      \"pattern\":\"[a-zA-Z0-9\\\\(\\\\)\\\\.\\\\-/_]+\"\
    },\
    \"LaunchTemplateOverrides\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance type, such as <code>m3.xlarge</code>. You must use an instance type that is supported in your requested Region and Availability Zones. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p>\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The number of capacity units provided by the specified instance type in terms of virtual CPUs, memory, storage, throughput, or other relative performance characteristic. When a Spot or On-Demand Instance is provisioned, the capacity units count toward the desired capacity. Amazon EC2 Auto Scaling provisions instances until the desired capacity is totally fulfilled, even if this results in an overage. For example, if there are 2 units remaining to fulfill capacity, and Amazon EC2 Auto Scaling can only provision an instance with a <code>WeightedCapacity</code> of 5 units, the instance is provisioned, and the desired capacity is exceeded by 3 units. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html\\\">Instance weighting for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. Value must be in the range of 1 to 999.</p>\"\
        },\
        \"LaunchTemplateSpecification\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>Provides the launch template to be used when launching the instance type. For example, some instance types might require a launch template with a different AMI. If not provided, Amazon EC2 Auto Scaling uses the launch template that's defined for your mixed instances policy. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-launch-template-overrides.html\\\">Specifying a different launch template for an instance type</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an override for a launch template. The maximum number of instance types that can be associated with an Auto Scaling group is 40. The maximum number of distinct launch templates you can define for an Auto Scaling group is 20. For more information about configuring overrides, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-override-options.html\\\">Configuring overrides</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
    },\
    \"LaunchTemplateSpecification\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LaunchTemplateId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the launch template. To get the template ID, use the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html\\\">DescribeLaunchTemplates</a> API operation. New launch templates can be created using the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html\\\">CreateLaunchTemplate</a> API. </p> <p>Conditional: You must specify either a <code>LaunchTemplateId</code> or a <code>LaunchTemplateName</code>.</p>\"\
        },\
        \"LaunchTemplateName\":{\
          \"shape\":\"LaunchTemplateName\",\
          \"documentation\":\"<p>The name of the launch template. To get the template name, use the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html\\\">DescribeLaunchTemplates</a> API operation. New launch templates can be created using the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html\\\">CreateLaunchTemplate</a> API. </p> <p>Conditional: You must specify either a <code>LaunchTemplateId</code> or a <code>LaunchTemplateName</code>.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The version number, <code>$Latest</code>, or <code>$Default</code>. To get the version number, use the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplateVersions.html\\\">DescribeLaunchTemplateVersions</a> API operation. New launch template versions can be created using the Amazon EC2 <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplateVersion.html\\\">CreateLaunchTemplateVersion</a> API. If the value is <code>$Latest</code>, Amazon EC2 Auto Scaling selects the latest version of the launch template when launching instances. If the value is <code>$Default</code>, Amazon EC2 Auto Scaling selects the default version of the launch template when launching instances. The default value is <code>$Default</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the Amazon EC2 launch template and the launch template version that can be used by an Auto Scaling group to configure Amazon EC2 instances.</p> <p>The launch template that is specified must be configured for use with an Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html\\\">Creating a launch template for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"LifecycleActionResult\":{\"type\":\"string\"},\
    \"LifecycleActionToken\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":36\
    },\
    \"LifecycleHook\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LifecycleHookName\":{\
          \"shape\":\"AsciiStringMaxLen255\",\
          \"documentation\":\"<p>The name of the lifecycle hook.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group for the lifecycle hook.</p>\"\
        },\
        \"LifecycleTransition\":{\
          \"shape\":\"LifecycleTransition\",\
          \"documentation\":\"<p>The state of the EC2 instance to which to attach the lifecycle hook. The following are possible values:</p> <ul> <li> <p>autoscaling:EC2_INSTANCE_LAUNCHING</p> </li> <li> <p>autoscaling:EC2_INSTANCE_TERMINATING</p> </li> </ul>\"\
        },\
        \"NotificationTargetARN\":{\
          \"shape\":\"NotificationTargetResourceName\",\
          \"documentation\":\"<p>The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an instance is in the transition state for the lifecycle hook. The notification target can be either an SQS queue or an SNS topic.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.</p>\"\
        },\
        \"NotificationMetadata\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Additional information that is included any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>\"\
        },\
        \"HeartbeatTimeout\":{\
          \"shape\":\"HeartbeatTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> parameter.</p>\"\
        },\
        \"GlobalTimeout\":{\
          \"shape\":\"GlobalTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that an instance can remain in a <code>Pending:Wait</code> or <code>Terminating:Wait</code> state. The maximum is 172800 seconds (48 hours) or 100 times <code>HeartbeatTimeout</code>, whichever is smaller.</p>\"\
        },\
        \"DefaultResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The possible values are <code>CONTINUE</code> and <code>ABANDON</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a lifecycle hook, which tells Amazon EC2 Auto Scaling that you want to perform an action whenever it launches instances or terminates instances.</p>\"\
    },\
    \"LifecycleHookNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AsciiStringMaxLen255\"},\
      \"max\":50\
    },\
    \"LifecycleHookSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LifecycleHookName\",\
        \"LifecycleTransition\"\
      ],\
      \"members\":{\
        \"LifecycleHookName\":{\
          \"shape\":\"AsciiStringMaxLen255\",\
          \"documentation\":\"<p>The name of the lifecycle hook.</p>\"\
        },\
        \"LifecycleTransition\":{\
          \"shape\":\"LifecycleTransition\",\
          \"documentation\":\"<p>The state of the EC2 instance to which you want to attach the lifecycle hook. The valid values are:</p> <ul> <li> <p>autoscaling:EC2_INSTANCE_LAUNCHING</p> </li> <li> <p>autoscaling:EC2_INSTANCE_TERMINATING</p> </li> </ul>\"\
        },\
        \"NotificationMetadata\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>\"\
        },\
        \"HeartbeatTimeout\":{\
          \"shape\":\"HeartbeatTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that can elapse before the lifecycle hook times out.</p> <p>If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> parameter. You can prevent the lifecycle hook from timing out by calling <a>RecordLifecycleActionHeartbeat</a>.</p>\"\
        },\
        \"DefaultResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The valid values are <code>CONTINUE</code> and <code>ABANDON</code>. The default value is <code>ABANDON</code>.</p>\"\
        },\
        \"NotificationTargetARN\":{\
          \"shape\":\"NotificationTargetResourceName\",\
          \"documentation\":\"<p>The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an instance is in the transition state for the lifecycle hook. The notification target can be either an SQS queue or an SNS topic.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target, for example, an Amazon SNS topic or an Amazon SQS queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used to specify a lifecycle hook for an Auto Scaling group.</p> <p>A lifecycle hook tells Amazon EC2 Auto Scaling to perform an action on an instance when the instance launches (before it is put into service) or as the instance terminates (before it is fully terminated).</p> <p>This step is a part of the procedure for creating a lifecycle hook for an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a Lambda function and a rule that allows CloudWatch Events to invoke your Lambda function when Amazon EC2 Auto Scaling launches or terminates instances.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p> <b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b> </p> </li> <li> <p>If you need more time, record the lifecycle action heartbeat to keep the instance in a pending state.</p> </li> <li> <p>If you finish before the timeout period ends, complete the lifecycle action.</p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"LifecycleHookSpecifications\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LifecycleHookSpecification\"}\
    },\
    \"LifecycleHooks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LifecycleHook\"}\
    },\
    \"LifecycleState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"Pending:Wait\",\
        \"Pending:Proceed\",\
        \"Quarantined\",\
        \"InService\",\
        \"Terminating\",\
        \"Terminating:Wait\",\
        \"Terminating:Proceed\",\
        \"Terminated\",\
        \"Detaching\",\
        \"Detached\",\
        \"EnteringStandby\",\
        \"Standby\"\
      ]\
    },\
    \"LifecycleTransition\":{\"type\":\"string\"},\
    \"LimitExceededFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>You have already reached a limit for your Amazon EC2 Auto Scaling resources (for example, Auto Scaling groups, launch configurations, or lifecycle hooks). For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAccountLimits.html\\\">DescribeAccountLimits</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p>\",\
      \"error\":{\
        \"code\":\"LimitExceeded\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"LoadBalancerNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"LoadBalancerState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the load balancer.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following load balancer states:</p> <ul> <li> <p> <code>Adding</code> - The instances in the group are being registered with the load balancer.</p> </li> <li> <p> <code>Added</code> - All instances in the group are registered with the load balancer.</p> </li> <li> <p> <code>InService</code> - At least one instance in the group passed an ELB health check.</p> </li> <li> <p> <code>Removing</code> - The instances in the group are being deregistered from the load balancer. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p> </li> <li> <p> <code>Removed</code> - All instances in the group are deregistered from the load balancer.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the state of a Classic Load Balancer.</p> <p>If you specify a load balancer when creating the Auto Scaling group, the state of the load balancer is <code>InService</code>.</p> <p>If you attach a load balancer to an existing Auto Scaling group, the initial state is <code>Adding</code>. The state transitions to <code>Added</code> after all instances in the group are registered with the load balancer. If Elastic Load Balancing health checks are enabled for the load balancer, the state transitions to <code>InService</code> after at least one instance in the group passes the health check. If EC2 health checks are enabled instead, the load balancer remains in the <code>Added</code> state.</p>\"\
    },\
    \"LoadBalancerStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerState\"}\
    },\
    \"LoadBalancerTargetGroupState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LoadBalancerTargetGroupARN\":{\
          \"shape\":\"XmlStringMaxLen511\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the target group.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The state of the target group.</p> <ul> <li> <p> <code>Adding</code> - The Auto Scaling instances are being registered with the target group.</p> </li> <li> <p> <code>Added</code> - All Auto Scaling instances are registered with the target group.</p> </li> <li> <p> <code>InService</code> - At least one Auto Scaling instance passed an ELB health check.</p> </li> <li> <p> <code>Removing</code> - The Auto Scaling instances are being deregistered from the target group. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p> </li> <li> <p> <code>Removed</code> - All Auto Scaling instances are deregistered from the target group.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the state of a target group.</p> <p>If you attach a target group to an existing Auto Scaling group, the initial state is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the target group. If Elastic Load Balancing health checks are enabled, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. If EC2 health checks are enabled instead, the target group remains in the <code>Added</code> state.</p>\"\
    },\
    \"LoadBalancerTargetGroupStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerTargetGroupState\"}\
    },\
    \"MaxInstanceLifetime\":{\"type\":\"integer\"},\
    \"MaxNumberOfAutoScalingGroups\":{\"type\":\"integer\"},\
    \"MaxNumberOfLaunchConfigurations\":{\"type\":\"integer\"},\
    \"MaxRecords\":{\"type\":\"integer\"},\
    \"MetricCollectionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a metric.</p>\"\
    },\
    \"MetricCollectionTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricCollectionType\"}\
    },\
    \"MetricDimension\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"MetricDimensionName\",\
          \"documentation\":\"<p>The name of the dimension.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"MetricDimensionValue\",\
          \"documentation\":\"<p>The value of the dimension.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the dimension of a metric.</p>\"\
    },\
    \"MetricDimensionName\":{\"type\":\"string\"},\
    \"MetricDimensionValue\":{\"type\":\"string\"},\
    \"MetricDimensions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDimension\"}\
    },\
    \"MetricGranularityType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Granularity\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The granularity. The only valid value is <code>1Minute</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a granularity of a metric.</p>\"\
    },\
    \"MetricGranularityTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricGranularityType\"}\
    },\
    \"MetricName\":{\"type\":\"string\"},\
    \"MetricNamespace\":{\"type\":\"string\"},\
    \"MetricScale\":{\"type\":\"double\"},\
    \"MetricStatistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Average\",\
        \"Minimum\",\
        \"Maximum\",\
        \"SampleCount\",\
        \"Sum\"\
      ]\
    },\
    \"MetricType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASGAverageCPUUtilization\",\
        \"ASGAverageNetworkIn\",\
        \"ASGAverageNetworkOut\",\
        \"ALBRequestCountPerTarget\"\
      ]\
    },\
    \"MetricUnit\":{\"type\":\"string\"},\
    \"Metrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"MinAdjustmentMagnitude\":{\"type\":\"integer\"},\
    \"MinAdjustmentStep\":{\
      \"type\":\"integer\",\
      \"deprecated\":true\
    },\
    \"MixedInstanceSpotPrice\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":0\
    },\
    \"MixedInstancesPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplate\",\
          \"documentation\":\"<p>Specifies the launch template to use and optionally the instance types (overrides) that are used to provision EC2 instances to fulfill On-Demand and Spot capacities. Required when creating a mixed instances policy.</p>\"\
        },\
        \"InstancesDistribution\":{\
          \"shape\":\"InstancesDistribution\",\
          \"documentation\":\"<p>Specifies the instances distribution. If not provided, the value for each property in <code>InstancesDistribution</code> uses a default value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a mixed instances policy for an Auto Scaling group. With mixed instances, your Auto Scaling group can provision a combination of On-Demand Instances and Spot Instances across multiple instance types. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>You can create a mixed instances policy for a new Auto Scaling group, or you can create it for an existing group by updating the group to specify <code>MixedInstancesPolicy</code> as the top-level property instead of a launch configuration or launch template.</p>\"\
    },\
    \"MonitoringEnabled\":{\"type\":\"boolean\"},\
    \"NoDevice\":{\"type\":\"boolean\"},\
    \"NonZeroIntPercent\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"NotificationConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TopicARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (Amazon SNS) topic.</p>\"\
        },\
        \"NotificationType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following event notification types:</p> <ul> <li> <p> <code>autoscaling:EC2_INSTANCE_LAUNCH</code> </p> </li> <li> <p> <code>autoscaling:EC2_INSTANCE_LAUNCH_ERROR</code> </p> </li> <li> <p> <code>autoscaling:EC2_INSTANCE_TERMINATE</code> </p> </li> <li> <p> <code>autoscaling:EC2_INSTANCE_TERMINATE_ERROR</code> </p> </li> <li> <p> <code>autoscaling:TEST_NOTIFICATION</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a notification.</p>\"\
    },\
    \"NotificationConfigurations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NotificationConfiguration\"}\
    },\
    \"NotificationTargetResourceName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":0,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"NumberOfAutoScalingGroups\":{\"type\":\"integer\"},\
    \"NumberOfLaunchConfigurations\":{\"type\":\"integer\"},\
    \"OnDemandBaseCapacity\":{\"type\":\"integer\"},\
    \"OnDemandPercentageAboveBaseCapacity\":{\"type\":\"integer\"},\
    \"Overrides\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LaunchTemplateOverrides\"}\
    },\
    \"PoliciesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScalingPolicies\":{\
          \"shape\":\"ScalingPolicies\",\
          \"documentation\":\"<p>The scaling policies.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"PolicyARNType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the policy.</p>\"\
        },\
        \"Alarms\":{\
          \"shape\":\"Alarms\",\
          \"documentation\":\"<p>The CloudWatch alarms created for the target tracking scaling policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the output of PutScalingPolicy.</p>\"\
    },\
    \"PolicyIncrement\":{\"type\":\"integer\"},\
    \"PolicyNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourceName\"}\
    },\
    \"PolicyTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen64\"}\
    },\
    \"PredefinedMetricSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"PredefinedMetricType\"],\
      \"members\":{\
        \"PredefinedMetricType\":{\
          \"shape\":\"MetricType\",\
          \"documentation\":\"<p>The metric type. The following predefined metrics are available:</p> <ul> <li> <p> <code>ASGAverageCPUUtilization</code> - Average CPU utilization of the Auto Scaling group.</p> </li> <li> <p> <code>ASGAverageNetworkIn</code> - Average number of bytes received on all network interfaces by the Auto Scaling group.</p> </li> <li> <p> <code>ASGAverageNetworkOut</code> - Average number of bytes sent out on all network interfaces by the Auto Scaling group.</p> </li> <li> <p> <code>ALBRequestCountPerTarget</code> - Number of requests completed per target in an Application Load Balancer target group.</p> </li> </ul>\"\
        },\
        \"ResourceLabel\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Identifies the resource associated with the metric type. You can't specify a resource label unless the metric type is <code>ALBRequestCountPerTarget</code> and there is a target group attached to the Auto Scaling group.</p> <p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format is app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;, where:</p> <ul> <li> <p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p> </li> <li> <p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p> </li> </ul> <p>This is an example: app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.</p> <p>To find the ARN for an Application Load Balancer, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a predefined metric for a target tracking scaling policy to use with Amazon EC2 Auto Scaling.</p>\"\
    },\
    \"ProcessNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"ProcessType\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProcessName\"],\
      \"members\":{\
        \"ProcessName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following processes:</p> <ul> <li> <p> <code>Launch</code> </p> </li> <li> <p> <code>Terminate</code> </p> </li> <li> <p> <code>AddToLoadBalancer</code> </p> </li> <li> <p> <code>AlarmNotification</code> </p> </li> <li> <p> <code>AZRebalance</code> </p> </li> <li> <p> <code>HealthCheck</code> </p> </li> <li> <p> <code>InstanceRefresh</code> </p> </li> <li> <p> <code>ReplaceUnhealthy</code> </p> </li> <li> <p> <code>ScheduledActions</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a process type.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types\\\">Scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"Processes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProcessType\"}\
    },\
    \"ProcessesType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Processes\":{\
          \"shape\":\"Processes\",\
          \"documentation\":\"<p>The names of the process types.</p>\"\
        }\
      }\
    },\
    \"Progress\":{\"type\":\"integer\"},\
    \"PropagateAtLaunch\":{\"type\":\"boolean\"},\
    \"ProtectedFromScaleIn\":{\"type\":\"boolean\"},\
    \"PutLifecycleHookAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PutLifecycleHookType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LifecycleHookName\",\
        \"AutoScalingGroupName\"\
      ],\
      \"members\":{\
        \"LifecycleHookName\":{\
          \"shape\":\"AsciiStringMaxLen255\",\
          \"documentation\":\"<p>The name of the lifecycle hook.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LifecycleTransition\":{\
          \"shape\":\"LifecycleTransition\",\
          \"documentation\":\"<p>The instance state to which you want to attach the lifecycle hook. The valid values are:</p> <ul> <li> <p>autoscaling:EC2_INSTANCE_LAUNCHING</p> </li> <li> <p>autoscaling:EC2_INSTANCE_TERMINATING</p> </li> </ul> <p>Required for new lifecycle hooks, but optional when updating existing hooks.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target, for example, an Amazon SNS topic or an Amazon SQS queue.</p> <p>Required for new lifecycle hooks, but optional when updating existing hooks.</p>\"\
        },\
        \"NotificationTargetARN\":{\
          \"shape\":\"NotificationTargetResourceName\",\
          \"documentation\":\"<p>The ARN of the notification target that Amazon EC2 Auto Scaling uses to notify you when an instance is in the transition state for the lifecycle hook. This target can be either an SQS queue or an SNS topic.</p> <p>If you specify an empty string, this overrides the current ARN.</p> <p>This operation uses the JSON format when sending notifications to an Amazon SQS queue, and an email key-value pair format when sending notifications to an Amazon SNS topic.</p> <p>When you specify a notification target, Amazon EC2 Auto Scaling sends it a test message. Test messages contain the following additional key-value pair: <code>\\\"Event\\\": \\\"autoscaling:TEST_NOTIFICATION\\\"</code>.</p>\"\
        },\
        \"NotificationMetadata\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>\"\
        },\
        \"HeartbeatTimeout\":{\
          \"shape\":\"HeartbeatTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. The range is from <code>30</code> to <code>7200</code> seconds. The default value is <code>3600</code> seconds (1 hour).</p> <p>If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> parameter. You can prevent the lifecycle hook from timing out by calling the <a>RecordLifecycleActionHeartbeat</a> API.</p>\"\
        },\
        \"DefaultResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. This parameter can be either <code>CONTINUE</code> or <code>ABANDON</code>. The default value is <code>ABANDON</code>.</p>\"\
        }\
      }\
    },\
    \"PutNotificationConfigurationType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"TopicARN\",\
        \"NotificationTypes\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TopicARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Simple Notification Service (Amazon SNS) topic.</p>\"\
        },\
        \"NotificationTypes\":{\
          \"shape\":\"AutoScalingNotificationTypes\",\
          \"documentation\":\"<p>The type of event that causes the notification to be sent. To query the notification types supported by Amazon EC2 Auto Scaling, call the <a>DescribeAutoScalingNotificationTypes</a> API.</p>\"\
        }\
      }\
    },\
    \"PutScalingPolicyType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"PolicyName\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the policy.</p>\"\
        },\
        \"PolicyType\":{\
          \"shape\":\"XmlStringMaxLen64\",\
          \"documentation\":\"<p>One of the following policy types: </p> <ul> <li> <p> <code>TargetTrackingScaling</code> </p> </li> <li> <p> <code>StepScaling</code> </p> </li> <li> <p> <code>SimpleScaling</code> (default)</p> </li> </ul>\"\
        },\
        \"AdjustmentType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies how the scaling adjustment is interpreted (for example, an absolute number or a percentage). The valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p> <p>Required if the policy type is <code>StepScaling</code> or <code>SimpleScaling</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment\\\">Scaling adjustment types</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MinAdjustmentStep\":{\
          \"shape\":\"MinAdjustmentStep\",\
          \"documentation\":\"<p>Available for backward compatibility. Use <code>MinAdjustmentMagnitude</code> instead.</p>\"\
        },\
        \"MinAdjustmentMagnitude\":{\
          \"shape\":\"MinAdjustmentMagnitude\",\
          \"documentation\":\"<p>The minimum value to scale by when the adjustment type is <code>PercentChangeInCapacity</code>. For example, suppose that you create a step scaling policy to scale out an Auto Scaling group by 25 percent and you specify a <code>MinAdjustmentMagnitude</code> of 2. If the group has 4 instances and the scaling policy is performed, 25 percent of 4 is 1. However, because you specified a <code>MinAdjustmentMagnitude</code> of 2, Amazon EC2 Auto Scaling scales out the group by 2 instances.</p> <p>Valid only if the policy type is <code>StepScaling</code> or <code>SimpleScaling</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment\\\">Scaling adjustment types</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <note> <p>Some Auto Scaling groups use instance weights. In this case, set the <code>MinAdjustmentMagnitude</code> to a value that is at least as large as your largest instance weight.</p> </note>\"\
        },\
        \"ScalingAdjustment\":{\
          \"shape\":\"PolicyIncrement\",\
          \"documentation\":\"<p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity. For exact capacity, you must specify a positive value.</p> <p>Required if the policy type is <code>SimpleScaling</code>. (Not used with any other policy type.) </p>\"\
        },\
        \"Cooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The duration of the policy's cooldown period, in seconds. When a cooldown period is specified here, it overrides the default cooldown period defined for the Auto Scaling group.</p> <p>Valid only if the policy type is <code>SimpleScaling</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MetricAggregationType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The aggregation type for the CloudWatch metrics. The valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the aggregation type is null, the value is treated as <code>Average</code>.</p> <p>Valid only if the policy type is <code>StepScaling</code>.</p>\"\
        },\
        \"StepAdjustments\":{\
          \"shape\":\"StepAdjustments\",\
          \"documentation\":\"<p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p> <p>Required if the policy type is <code>StepScaling</code>. (Not used with any other policy type.) </p>\"\
        },\
        \"EstimatedInstanceWarmup\":{\
          \"shape\":\"EstimatedInstanceWarmup\",\
          \"documentation\":\"<p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics. If not provided, the default is to use the value from the default cooldown period for the Auto Scaling group.</p> <p>Valid only if the policy type is <code>TargetTrackingScaling</code> or <code>StepScaling</code>.</p>\"\
        },\
        \"TargetTrackingConfiguration\":{\
          \"shape\":\"TargetTrackingConfiguration\",\
          \"documentation\":\"<p>A target tracking scaling policy. Includes support for predefined or customized metrics.</p> <p>The following predefined metrics are available:</p> <ul> <li> <p> <code>ASGAverageCPUUtilization</code> </p> </li> <li> <p> <code>ASGAverageNetworkIn</code> </p> </li> <li> <p> <code>ASGAverageNetworkOut</code> </p> </li> <li> <p> <code>ALBRequestCountPerTarget</code> </p> </li> </ul> <p>If you specify <code>ALBRequestCountPerTarget</code> for the metric, you must specify the <code>ResourceLabel</code> parameter with the <code>PredefinedMetricSpecification</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_TargetTrackingConfiguration.html\\\">TargetTrackingConfiguration</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p> <p>Required if the policy type is <code>TargetTrackingScaling</code>.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"ScalingPolicyEnabled\",\
          \"documentation\":\"<p>Indicates whether the scaling policy is enabled or disabled. The default is enabled. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enable-disable-scaling-policy.html\\\">Disabling a scaling policy for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"PutScheduledUpdateGroupActionType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"ScheduledActionName\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScheduledActionName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of this scaling action.</p>\"\
        },\
        \"Time\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>This parameter is no longer used.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for this action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in quotes (for example, <code>\\\"2019-06-01T00:00:00Z\\\"</code>).</p> <p>If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon EC2 Auto Scaling performs the action at this time, and then performs the action based on the specified recurrence.</p> <p>If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error message.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for the recurring schedule to end, in UTC.</p>\"\
        },\
        \"Recurrence\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The recurring schedule for this action. This format consists of five fields separated by white spaces: [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes (for example, <code>\\\"30 0 1 1,6,12 *\\\"</code>). For more information about this format, see <a href=\\\"http://crontab.org\\\">Crontab</a>.</p> <p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p> <p>Cron expressions use Universal Coordinated Time (UTC) by default.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"AutoScalingGroupMinSize\",\
          \"documentation\":\"<p>The minimum size of the Auto Scaling group.</p>\"\
        },\
        \"MaxSize\":{\
          \"shape\":\"AutoScalingGroupMaxSize\",\
          \"documentation\":\"<p>The maximum size of the Auto Scaling group.</p>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain. It can scale beyond this capacity if you add more scaling conditions. </p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by default. </p> <p>Valid values are the canonical names of the IANA time zones, derived from the IANA Time Zone Database (such as <code>Etc/GMT+9</code> or <code>Pacific/Tahiti</code>). For more information, see <a href=\\\"https://en.wikipedia.org/wiki/List_of_tz_database_time_zones\\\">https://en.wikipedia.org/wiki/List_of_tz_database_time_zones</a>.</p>\"\
        }\
      }\
    },\
    \"RecordLifecycleActionHeartbeatAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RecordLifecycleActionHeartbeatType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LifecycleHookName\",\
        \"AutoScalingGroupName\"\
      ],\
      \"members\":{\
        \"LifecycleHookName\":{\
          \"shape\":\"AsciiStringMaxLen255\",\
          \"documentation\":\"<p>The name of the lifecycle hook.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LifecycleActionToken\":{\
          \"shape\":\"LifecycleActionToken\",\
          \"documentation\":\"<p>A token that uniquely identifies a specific lifecycle action associated with an instance. Amazon EC2 Auto Scaling sends this token to the notification target that you specified when you created the lifecycle hook.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        }\
      }\
    },\
    \"RefreshInstanceWarmup\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"RefreshPreferences\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinHealthyPercentage\":{\
          \"shape\":\"IntPercent\",\
          \"documentation\":\"<p>The amount of capacity in the Auto Scaling group that must remain healthy during an instance refresh to allow the operation to continue, as a percentage of the desired capacity of the Auto Scaling group (rounded up to the nearest integer). The default is <code>90</code>. </p>\"\
        },\
        \"InstanceWarmup\":{\
          \"shape\":\"RefreshInstanceWarmup\",\
          \"documentation\":\"<p>The number of seconds until a newly launched instance is configured and ready to use. During this time, Amazon EC2 Auto Scaling does not immediately move on to the next replacement. The default is to use the value for the health check grace period defined for the group.</p>\"\
        },\
        \"CheckpointPercentages\":{\
          \"shape\":\"CheckpointPercentages\",\
          \"documentation\":\"<p>Threshold values for each checkpoint in ascending order. Each number must be unique. To replace all instances in the Auto Scaling group, the last number in the array must be <code>100</code>.</p> <p>For usage examples, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-adding-checkpoints-instance-refresh.html\\\">Adding checkpoints to an instance refresh</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CheckpointDelay\":{\
          \"shape\":\"CheckpointDelay\",\
          \"documentation\":\"<p>The amount of time, in seconds, to wait after a checkpoint before continuing. This property is optional, but if you specify a value for it, you must also specify a value for <code>CheckpointPercentages</code>. If you specify a value for <code>CheckpointPercentages</code> and not for <code>CheckpointDelay</code>, the <code>CheckpointDelay</code> defaults to <code>3600</code> (1 hour). </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used to start an instance refresh. </p> <p>All properties are optional. However, if you specify a value for <code>CheckpointDelay</code>, you must also provide a value for <code>CheckpointPercentages</code>. </p>\"\
    },\
    \"RefreshStrategy\":{\
      \"type\":\"string\",\
      \"enum\":[\"Rolling\"]\
    },\
    \"ResourceContentionFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>You already have a pending update to an Amazon EC2 Auto Scaling resource (for example, an Auto Scaling group, instance, or load balancer).</p>\",\
      \"error\":{\
        \"code\":\"ResourceContention\",\
        \"httpStatusCode\":500,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ResourceInUseFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The operation can't be performed because the resource is in use.</p>\",\
      \"error\":{\
        \"code\":\"ResourceInUse\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"ScalingActivityInProgressFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p/>\"\
        }\
      },\
      \"documentation\":\"<p>The operation can't be performed because there are scaling activities in progress.</p>\",\
      \"error\":{\
        \"code\":\"ScalingActivityInProgress\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ScalingActivityStatusCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PendingSpotBidPlacement\",\
        \"WaitingForSpotInstanceRequestId\",\
        \"WaitingForSpotInstanceId\",\
        \"WaitingForInstanceId\",\
        \"PreInService\",\
        \"InProgress\",\
        \"WaitingForELBConnectionDraining\",\
        \"MidLifecycleAction\",\
        \"WaitingForInstanceWarmup\",\
        \"Successful\",\
        \"Failed\",\
        \"Cancelled\"\
      ]\
    },\
    \"ScalingPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScalingPolicy\"}\
    },\
    \"ScalingPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"PolicyName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the scaling policy.</p>\"\
        },\
        \"PolicyARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the policy.</p>\"\
        },\
        \"PolicyType\":{\
          \"shape\":\"XmlStringMaxLen64\",\
          \"documentation\":\"<p>One of the following policy types: </p> <ul> <li> <p> <code>TargetTrackingScaling</code> </p> </li> <li> <p> <code>StepScaling</code> </p> </li> <li> <p> <code>SimpleScaling</code> (default)</p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html\\\">Target tracking scaling policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html\\\">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"AdjustmentType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies how the scaling adjustment is interpreted (for example, an absolute number or a percentage). The valid values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and <code>PercentChangeInCapacity</code>.</p>\"\
        },\
        \"MinAdjustmentStep\":{\
          \"shape\":\"MinAdjustmentStep\",\
          \"documentation\":\"<p>Available for backward compatibility. Use <code>MinAdjustmentMagnitude</code> instead.</p>\"\
        },\
        \"MinAdjustmentMagnitude\":{\
          \"shape\":\"MinAdjustmentMagnitude\",\
          \"documentation\":\"<p>The minimum value to scale by when the adjustment type is <code>PercentChangeInCapacity</code>. </p>\"\
        },\
        \"ScalingAdjustment\":{\
          \"shape\":\"PolicyIncrement\",\
          \"documentation\":\"<p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p>\"\
        },\
        \"Cooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The duration of the policy's cooldown period, in seconds.</p>\"\
        },\
        \"StepAdjustments\":{\
          \"shape\":\"StepAdjustments\",\
          \"documentation\":\"<p>A set of adjustments that enable you to scale based on the size of the alarm breach.</p>\"\
        },\
        \"MetricAggregationType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The aggregation type for the CloudWatch metrics. The valid values are <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>.</p>\"\
        },\
        \"EstimatedInstanceWarmup\":{\
          \"shape\":\"EstimatedInstanceWarmup\",\
          \"documentation\":\"<p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics.</p>\"\
        },\
        \"Alarms\":{\
          \"shape\":\"Alarms\",\
          \"documentation\":\"<p>The CloudWatch alarms related to the policy.</p>\"\
        },\
        \"TargetTrackingConfiguration\":{\
          \"shape\":\"TargetTrackingConfiguration\",\
          \"documentation\":\"<p>A target tracking scaling policy.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"ScalingPolicyEnabled\",\
          \"documentation\":\"<p>Indicates whether the policy is enabled (<code>true</code>) or disabled (<code>false</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a scaling policy.</p>\"\
    },\
    \"ScalingPolicyEnabled\":{\"type\":\"boolean\"},\
    \"ScalingProcessQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScalingProcesses\":{\
          \"shape\":\"ProcessNames\",\
          \"documentation\":\"<p>One or more of the following processes:</p> <ul> <li> <p> <code>Launch</code> </p> </li> <li> <p> <code>Terminate</code> </p> </li> <li> <p> <code>AddToLoadBalancer</code> </p> </li> <li> <p> <code>AlarmNotification</code> </p> </li> <li> <p> <code>AZRebalance</code> </p> </li> <li> <p> <code>HealthCheck</code> </p> </li> <li> <p> <code>InstanceRefresh</code> </p> </li> <li> <p> <code>ReplaceUnhealthy</code> </p> </li> <li> <p> <code>ScheduledActions</code> </p> </li> </ul> <p>If you omit this parameter, all processes are specified.</p>\"\
        }\
      }\
    },\
    \"ScheduledActionNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen255\"}\
    },\
    \"ScheduledActionsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ScheduledUpdateGroupActions\":{\
          \"shape\":\"ScheduledUpdateGroupActions\",\
          \"documentation\":\"<p>The scheduled actions.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"ScheduledUpdateGroupAction\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ScheduledActionName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the scheduled action.</p>\"\
        },\
        \"ScheduledActionARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the scheduled action.</p>\"\
        },\
        \"Time\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>This parameter is no longer used.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time in UTC for this action to start. For example, <code>\\\"2019-06-01T00:00:00Z\\\"</code>. </p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time in UTC for the recurring schedule to end. For example, <code>\\\"2019-06-01T00:00:00Z\\\"</code>. </p>\"\
        },\
        \"Recurrence\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The recurring schedule for the action, in Unix cron syntax format.</p> <p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"AutoScalingGroupMinSize\",\
          \"documentation\":\"<p>The minimum size of the Auto Scaling group.</p>\"\
        },\
        \"MaxSize\":{\
          \"shape\":\"AutoScalingGroupMaxSize\",\
          \"documentation\":\"<p>The maximum size of the Auto Scaling group.</p>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The time zone for the cron expression.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a scheduled scaling action.</p>\"\
    },\
    \"ScheduledUpdateGroupActionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ScheduledActionName\"],\
      \"members\":{\
        \"ScheduledActionName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the scaling action.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for the action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in quotes (for example, <code>\\\"2019-06-01T00:00:00Z\\\"</code>).</p> <p>If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon EC2 Auto Scaling performs the action at this time, and then performs the action based on the specified recurrence.</p> <p>If you try to schedule the action in the past, Amazon EC2 Auto Scaling returns an error message.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for the recurring schedule to end, in UTC.</p>\"\
        },\
        \"Recurrence\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The recurring schedule for the action, in Unix cron syntax format. This format consists of five fields separated by white spaces: [Minute] [Hour] [Day_of_Month] [Month_of_Year] [Day_of_Week]. The value must be in quotes (for example, <code>\\\"30 0 1 1,6,12 *\\\"</code>). For more information about this format, see <a href=\\\"http://crontab.org\\\">Crontab</a>.</p> <p>When <code>StartTime</code> and <code>EndTime</code> are specified with <code>Recurrence</code>, they form the boundaries of when the recurring action starts and stops.</p> <p>Cron expressions use Universal Coordinated Time (UTC) by default.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"AutoScalingGroupMinSize\",\
          \"documentation\":\"<p>The minimum size of the Auto Scaling group.</p>\"\
        },\
        \"MaxSize\":{\
          \"shape\":\"AutoScalingGroupMaxSize\",\
          \"documentation\":\"<p>The maximum size of the Auto Scaling group.</p>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by default. </p> <p>Valid values are the canonical names of the IANA time zones, derived from the IANA Time Zone Database (such as <code>Etc/GMT+9</code> or <code>Pacific/Tahiti</code>). For more information, see <a href=\\\"https://en.wikipedia.org/wiki/List_of_tz_database_time_zones\\\">https://en.wikipedia.org/wiki/List_of_tz_database_time_zones</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used for one or more scheduled scaling action updates in a <a>BatchPutScheduledUpdateGroupAction</a> operation.</p>\"\
    },\
    \"ScheduledUpdateGroupActionRequests\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScheduledUpdateGroupActionRequest\"}\
    },\
    \"ScheduledUpdateGroupActions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ScheduledUpdateGroupAction\"}\
    },\
    \"SecurityGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlString\"}\
    },\
    \"ServiceLinkedRoleFailure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"XmlStringMaxLen255\"}\
      },\
      \"documentation\":\"<p>The service-linked role is not yet ready for use.</p>\",\
      \"error\":{\
        \"code\":\"ServiceLinkedRoleFailure\",\
        \"httpStatusCode\":500,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SetDesiredCapacityType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"DesiredCapacity\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group after this operation completes and the capacity it attempts to maintain.</p>\"\
        },\
        \"HonorCooldown\":{\
          \"shape\":\"HonorCooldown\",\
          \"documentation\":\"<p>Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete before initiating a scaling activity to set your Auto Scaling group to its new capacity. By default, Amazon EC2 Auto Scaling does not honor the cooldown period during manual scaling activities.</p>\"\
        }\
      }\
    },\
    \"SetInstanceHealthQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HealthStatus\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"HealthStatus\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The health status of the instance. Set to <code>Healthy</code> to have the instance remain in service. Set to <code>Unhealthy</code> to have the instance be out of service. Amazon EC2 Auto Scaling terminates and replaces the unhealthy instance.</p>\"\
        },\
        \"ShouldRespectGracePeriod\":{\
          \"shape\":\"ShouldRespectGracePeriod\",\
          \"documentation\":\"<p>If the Auto Scaling group of the specified instance has a <code>HealthCheckGracePeriod</code> specified for the group, by default, this call respects the grace period. Set this to <code>False</code>, to have the call not respect the grace period associated with the group.</p> <p>For more information about the health check grace period, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html\\\">CreateAutoScalingGroup</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p>\"\
        }\
      }\
    },\
    \"SetInstanceProtectionAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"SetInstanceProtectionQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceIds\",\
        \"AutoScalingGroupName\",\
        \"ProtectedFromScaleIn\"\
      ],\
      \"members\":{\
        \"InstanceIds\":{\
          \"shape\":\"InstanceIds\",\
          \"documentation\":\"<p>One or more instance IDs. You can specify up to 50 instances.</p>\"\
        },\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ProtectedFromScaleIn\":{\
          \"shape\":\"ProtectedFromScaleIn\",\
          \"documentation\":\"<p>Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling when scaling in.</p>\"\
        }\
      }\
    },\
    \"ShouldDecrementDesiredCapacity\":{\"type\":\"boolean\"},\
    \"ShouldRespectGracePeriod\":{\"type\":\"boolean\"},\
    \"SpotInstancePools\":{\"type\":\"integer\"},\
    \"SpotPrice\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"StartInstanceRefreshAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>A unique ID for tracking the progress of the request.</p>\"\
        }\
      }\
    },\
    \"StartInstanceRefreshType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"Strategy\":{\
          \"shape\":\"RefreshStrategy\",\
          \"documentation\":\"<p>The strategy to use for the instance refresh. The only valid value is <code>Rolling</code>.</p> <p>A rolling update is an update that is applied to all instances in an Auto Scaling group until all instances have been updated. A rolling update can fail due to failed health checks or if instances are on standby or are protected from scale in. If the rolling update process fails, any instances that were already replaced are not rolled back to their previous configuration. </p>\"\
        },\
        \"Preferences\":{\
          \"shape\":\"RefreshPreferences\",\
          \"documentation\":\"<p>Set of preferences associated with the instance refresh request.</p> <p>If not provided, the default values are used. For <code>MinHealthyPercentage</code>, the default value is <code>90</code>. For <code>InstanceWarmup</code>, the default is to use the value specified for the health check grace period for the Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RefreshPreferences.html\\\">RefreshPreferences</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p>\"\
        }\
      }\
    },\
    \"StepAdjustment\":{\
      \"type\":\"structure\",\
      \"required\":[\"ScalingAdjustment\"],\
      \"members\":{\
        \"MetricIntervalLowerBound\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The lower bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the lower bound is inclusive (the metric must be greater than or equal to the threshold plus the lower bound). Otherwise, it is exclusive (the metric must be greater than the threshold plus the lower bound). A null value indicates negative infinity.</p>\"\
        },\
        \"MetricIntervalUpperBound\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The upper bound for the difference between the alarm threshold and the CloudWatch metric. If the metric value is above the breach threshold, the upper bound is exclusive (the metric must be less than the threshold plus the upper bound). Otherwise, it is inclusive (the metric must be less than or equal to the threshold plus the upper bound). A null value indicates positive infinity.</p> <p>The upper bound must be greater than the lower bound.</p>\"\
        },\
        \"ScalingAdjustment\":{\
          \"shape\":\"PolicyIncrement\",\
          \"documentation\":\"<p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used to create a step adjustment for a step scaling policy.</p> <p>For the following examples, suppose that you have an alarm with a breach threshold of 50:</p> <ul> <li> <p>To trigger the adjustment when the metric is greater than or equal to 50 and less than 60, specify a lower bound of 0 and an upper bound of 10.</p> </li> <li> <p>To trigger the adjustment when the metric is greater than 40 and less than or equal to 50, specify a lower bound of -10 and an upper bound of 0.</p> </li> </ul> <p>There are a few rules for the step adjustments for your step policy:</p> <ul> <li> <p>The ranges of your step adjustments can't overlap or have a gap.</p> </li> <li> <p>At most, one step adjustment can have a null lower bound. If one step adjustment has a negative lower bound, then there must be a step adjustment with a null lower bound.</p> </li> <li> <p>At most, one step adjustment can have a null upper bound. If one step adjustment has a positive upper bound, then there must be a step adjustment with a null upper bound.</p> </li> <li> <p>The upper and lower bound can't be null in the same step adjustment.</p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-steps\\\">Step adjustments</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"StepAdjustments\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StepAdjustment\"}\
    },\
    \"SuspendedProcess\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProcessName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the suspended process.</p>\"\
        },\
        \"SuspensionReason\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The reason that the process was suspended.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an auto scaling process that has been suspended.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types\\\">Scaling processes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"SuspendedProcesses\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SuspendedProcess\"}\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The type of resource. The only supported value is <code>auto-scaling-group</code>.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The tag key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The tag value.</p>\"\
        },\
        \"PropagateAtLaunch\":{\
          \"shape\":\"PropagateAtLaunch\",\
          \"documentation\":\"<p>Determines whether the tag is added to new instances as they are launched in the group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a tag for an Auto Scaling group.</p>\"\
    },\
    \"TagDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceId\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The name of the group.</p>\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The type of resource. The only supported value is <code>auto-scaling-group</code>.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The tag key.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The tag value.</p>\"\
        },\
        \"PropagateAtLaunch\":{\
          \"shape\":\"PropagateAtLaunch\",\
          \"documentation\":\"<p>Determines whether the tag is added to new instances as they are launched in the group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a tag for an Auto Scaling group.</p>\"\
    },\
    \"TagDescriptionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagDescription\"}\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"Tags\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagsType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagDescriptionList\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>A string that indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"TargetGroupARNs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen511\"}\
    },\
    \"TargetTrackingConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetValue\"],\
      \"members\":{\
        \"PredefinedMetricSpecification\":{\
          \"shape\":\"PredefinedMetricSpecification\",\
          \"documentation\":\"<p>A predefined metric. You must specify either a predefined metric or a customized metric.</p>\"\
        },\
        \"CustomizedMetricSpecification\":{\
          \"shape\":\"CustomizedMetricSpecification\",\
          \"documentation\":\"<p>A customized metric. You must specify either a predefined metric or a customized metric.</p>\"\
        },\
        \"TargetValue\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>The target value for the metric.</p>\"\
        },\
        \"DisableScaleIn\":{\
          \"shape\":\"DisableScaleIn\",\
          \"documentation\":\"<p>Indicates whether scaling in by the target tracking scaling policy is disabled. If scaling in is disabled, the target tracking scaling policy doesn't remove instances from the Auto Scaling group. Otherwise, the target tracking scaling policy can remove instances from the Auto Scaling group. The default is <code>false</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a target tracking scaling policy configuration to use with Amazon EC2 Auto Scaling.</p>\"\
    },\
    \"TerminateInstanceInAutoScalingGroupType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ShouldDecrementDesiredCapacity\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        },\
        \"ShouldDecrementDesiredCapacity\":{\
          \"shape\":\"ShouldDecrementDesiredCapacity\",\
          \"documentation\":\"<p>Indicates whether terminating the instance also decrements the size of the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"TerminationPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlStringMaxLen1600\"}\
    },\
    \"TimestampType\":{\"type\":\"timestamp\"},\
    \"UpdateAutoScalingGroupType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the launch configuration. If you specify <code>LaunchConfigurationName</code> in your update request, you can't specify <code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>.</p>\"\
        },\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>The launch template and version to use to specify the updates. If you specify <code>LaunchTemplate</code> in your update request, you can't specify <code>LaunchConfigurationName</code> or <code>MixedInstancesPolicy</code>.</p>\"\
        },\
        \"MixedInstancesPolicy\":{\
          \"shape\":\"MixedInstancesPolicy\",\
          \"documentation\":\"<p>An embedded object that specifies a mixed instances policy. When you make changes to an existing policy, all optional properties are left unchanged if not specified. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-purchase-options.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"AutoScalingGroupMinSize\",\
          \"documentation\":\"<p>The minimum size of the Auto Scaling group.</p>\"\
        },\
        \"MaxSize\":{\
          \"shape\":\"AutoScalingGroupMaxSize\",\
          \"documentation\":\"<p>The maximum size of the Auto Scaling group.</p> <note> <p>With a mixed instances policy that uses instance weighting, Amazon EC2 Auto Scaling may need to go above <code>MaxSize</code> to meet your capacity requirements. In this event, Amazon EC2 Auto Scaling will never go above <code>MaxSize</code> by more than your largest instance weight (weights that define how many units each instance contributes to the desired capacity of the group).</p> </note>\"\
        },\
        \"DesiredCapacity\":{\
          \"shape\":\"AutoScalingGroupDesiredCapacity\",\
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group after this operation completes and the capacity it attempts to maintain. This number must be greater than or equal to the minimum size of the group and less than or equal to the maximum size of the group.</p>\"\
        },\
        \"DefaultCooldown\":{\
          \"shape\":\"Cooldown\",\
          \"documentation\":\"<p>The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. The default value is <code>300</code>. This setting applies when using simple scaling policies, but not when using other scaling policies or scheduled scaling. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>One or more Availability Zones for the group.</p>\"\
        },\
        \"HealthCheckType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The service to use for the health checks. The valid values are <code>EC2</code> and <code>ELB</code>. If you configure an Auto Scaling group to use ELB health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the load balancer health checks.</p>\"\
        },\
        \"HealthCheckGracePeriod\":{\
          \"shape\":\"HealthCheckGracePeriod\",\
          \"documentation\":\"<p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service. The default value is <code>0</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html#health-check-grace-period\\\">Health check grace period</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Conditional: Required if you are adding an <code>ELB</code> health check.</p>\"\
        },\
        \"PlacementGroup\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of an existing placement group into which to launch your instances, if any. A placement group is a logical grouping of instances within a single Availability Zone. You cannot specify multiple Availability Zones and a placement group. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html\\\">Placement Groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"VPCZoneIdentifier\":{\
          \"shape\":\"XmlStringMaxLen2047\",\
          \"documentation\":\"<p>A comma-separated list of subnet IDs for a virtual private cloud (VPC). If you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the subnets that you specify for this parameter must reside in those Availability Zones.</p>\"\
        },\
        \"TerminationPolicies\":{\
          \"shape\":\"TerminationPolicies\",\
          \"documentation\":\"<p>A policy or a list of policies that are used to select the instances to terminate. The policies are executed in the order that you list them. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html\\\">Controlling which Auto Scaling instances terminate during scale in</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"NewInstancesProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in. For more information about preventing instances from terminating on scale in, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-instance-termination.html#instance-protection\\\">Instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ServiceLinkedRoleARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other AWS services on your behalf. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html\\\">Service-linked roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MaxInstanceLifetime\":{\
          \"shape\":\"MaxInstanceLifetime\",\
          \"documentation\":\"<p>The maximum amount of time, in seconds, that an instance can be in service. The default is null. If specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day). To clear a previously set value, specify a new value of 0. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html\\\">Replacing Auto Scaling instances based on maximum instance lifetime</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CapacityRebalance\":{\
          \"shape\":\"CapacityRebalanceEnabled\",\
          \"documentation\":\"<p>Enables or disables Capacity Rebalancing. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/capacity-rebalance.html\\\">Amazon EC2 Auto Scaling Capacity Rebalancing</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      }\
    },\
    \"Values\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlString\"}\
    },\
    \"XmlString\":{\
      \"type\":\"string\",\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen1023\":{\
      \"type\":\"string\",\
      \"max\":1023,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen1600\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen19\":{\
      \"type\":\"string\",\
      \"max\":19,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen2047\":{\
      \"type\":\"string\",\
      \"max\":2047,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen255\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen32\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen511\":{\
      \"type\":\"string\",\
      \"max\":511,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMaxLen64\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringUserData\":{\
      \"type\":\"string\",\
      \"max\":21847,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    }\
  },\
  \"documentation\":\"<fullname>Amazon EC2 Auto Scaling</fullname> <p>Amazon EC2 Auto Scaling is designed to automatically launch or terminate EC2 instances based on user-defined scaling policies, scheduled actions, and health checks. Use this service with AWS Auto Scaling, Amazon CloudWatch, and Elastic Load Balancing.</p> <p>For more information, including information about granting IAM users required permissions for Amazon EC2 Auto Scaling actions, see the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html\\\">Amazon EC2 Auto Scaling User Guide</a>.</p>\"\
}\
";
}

@end
