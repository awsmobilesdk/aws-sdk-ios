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
      \"documentation\":\"<note> <p>This API operation is superseded by <a>AttachTrafficSources</a>, which can attach multiple traffic sources types. We recommend using <code>AttachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>AttachLoadBalancerTargetGroups</code>. You can use both the original <code>AttachLoadBalancerTargetGroups</code> API operation and <code>AttachTrafficSources</code> on the same Auto Scaling group.</p> </note> <p>Attaches one or more target groups to the specified Auto Scaling group.</p> <p>This operation is used with the following load balancer types: </p> <ul> <li> <p>Application Load Balancer - Operates at the application layer (layer 7) and supports HTTP and HTTPS. </p> </li> <li> <p>Network Load Balancer - Operates at the transport layer (layer 4) and supports TCP, TLS, and UDP. </p> </li> <li> <p>Gateway Load Balancer - Operates at the network layer (layer 3).</p> </li> </ul> <p>To describe the target groups for an Auto Scaling group, call the <a>DescribeLoadBalancerTargetGroups</a> API. To detach the target group from the Auto Scaling group, call the <a>DetachLoadBalancerTargetGroups</a> API.</p> <p>This operation is additive and does not detach existing target groups or Classic Load Balancers from the Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
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
      \"documentation\":\"<note> <p>This API operation is superseded by <a>AttachTrafficSources</a>, which can attach multiple traffic sources types. We recommend using <code>AttachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>AttachLoadBalancers</code>. You can use both the original <code>AttachLoadBalancers</code> API operation and <code>AttachTrafficSources</code> on the same Auto Scaling group.</p> </note> <p>Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 Auto Scaling registers the running instances with these Classic Load Balancers.</p> <p>To describe the load balancers for an Auto Scaling group, call the <a>DescribeLoadBalancers</a> API. To detach a load balancer from the Auto Scaling group, call the <a>DetachLoadBalancers</a> API.</p> <p>This operation is additive and does not detach existing Classic Load Balancers or target groups from the Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"AttachTrafficSources\":{\
      \"name\":\"AttachTrafficSources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AttachTrafficSourcesType\"},\
      \"output\":{\
        \"shape\":\"AttachTrafficSourcesResultType\",\
        \"resultWrapper\":\"AttachTrafficSourcesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ServiceLinkedRoleFailure\"}\
      ],\
      \"documentation\":\"<p>Attaches one or more traffic sources to the specified Auto Scaling group.</p> <p>You can use any of the following as traffic sources for an Auto Scaling group:</p> <ul> <li> <p>Application Load Balancer</p> </li> <li> <p>Classic Load Balancer</p> </li> <li> <p>Gateway Load Balancer</p> </li> <li> <p>Network Load Balancer</p> </li> <li> <p>VPC Lattice</p> </li> </ul> <p>This operation is additive and does not detach existing traffic sources from the Auto Scaling group. </p> <p>After the operation completes, use the <a>DescribeTrafficSources</a> API to return details about the state of the attachments between traffic sources and your Auto Scaling group. To detach a traffic source from the Auto Scaling group, call the <a>DetachTrafficSources</a> API.</p>\"\
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
      \"documentation\":\"<p>Cancels an instance refresh or rollback that is in progress. If an instance refresh or rollback is not in progress, an <code>ActiveInstanceRefreshNotFound</code> error occurs.</p> <p>This operation is part of the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p> <p>When you cancel an instance refresh, this does not roll back any changes that it made. Use the <a>RollbackInstanceRefresh</a> API to roll back instead.</p>\"\
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
      \"documentation\":\"<p>Completes the lifecycle action for the specified token or instance with the specified result.</p> <p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p> </li> <li> <p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p> </li> <li> <p>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state.</p> </li> <li> <p> <b>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</b> </p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p> <b>We strongly recommend using a launch template when calling this operation to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b> </p> <p>Creates an Auto Scaling group with the specified name and attributes. </p> <p>If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html\\\">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>For introductory exercises for creating an Auto Scaling group, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html\\\">Getting started with Amazon EC2 Auto Scaling</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html\\\">Tutorial: Set up a scaled and load-balanced application</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html\\\">Auto Scaling groups</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Every Auto Scaling group has three size properties (<code>DesiredCapacity</code>, <code>MaxSize</code>, and <code>MinSize</code>). Usually, you set these sizes based on a specific number of instances. However, if you configure a mixed instances policy that defines weights for the instance types, you must specify these sizes with the same units that you use for weighting instances.</p>\"\
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
      \"documentation\":\"<p>Creates a launch configuration.</p> <p>If you exceed your maximum limit of launch configurations, the call fails. To query this limit, call the <a>DescribeAccountLimits</a> API. For information about updating this limit, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html\\\">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html\\\">Launch configurations</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <note> <p>Amazon EC2 Auto Scaling configures instances launched as part of an Auto Scaling group using either a launch template or a launch configuration. We strongly recommend that you do not use launch configurations. They do not provide full functionality for Amazon EC2 Auto Scaling or Amazon EC2. For information about using launch templates, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html\\\">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> </note>\"\
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
      \"documentation\":\"<p>Creates or updates tags for the specified Auto Scaling group.</p> <p>When you specify a tag with a key that already exists, the operation overwrites the previous tag definition, and you do not get an error message.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html\\\">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p>Deletes the specified Auto Scaling group.</p> <p>If the group has instances or scaling activities in progress, you must specify the option to force the deletion in order for it to succeed. The force delete operation will also terminate the EC2 instances. If the group has a warm pool, the force delete option also deletes the warm pool.</p> <p>To remove instances from the Auto Scaling group before deleting it, call the <a>DetachInstances</a> API with the list of instances and the option to decrement the desired capacity. This ensures that Amazon EC2 Auto Scaling does not launch replacement instances.</p> <p>To terminate all instances before deleting the Auto Scaling group, call the <a>UpdateAutoScalingGroup</a> API and set the minimum size and desired capacity of the Auto Scaling group to zero.</p> <p>If the group has scaling policies, deleting the group deletes the policies, the underlying alarm actions, and any alarm that no longer has an associated action.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-process-shutdown.html\\\">Delete your Auto Scaling infrastructure</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
    \"DeleteWarmPool\":{\
      \"name\":\"DeleteWarmPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteWarmPoolType\"},\
      \"output\":{\
        \"shape\":\"DeleteWarmPoolAnswer\",\
        \"resultWrapper\":\"DeleteWarmPoolResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ScalingActivityInProgressFault\"},\
        {\"shape\":\"ResourceInUseFault\"}\
      ],\
      \"documentation\":\"<p>Deletes the warm pool for the specified Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html\\\">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p>Describes the current Amazon EC2 Auto Scaling resource quotas for your account.</p> <p>When you establish an Amazon Web Services account, the account has initial quotas on the maximum number of Auto Scaling groups and launch configurations that you can create in a given Region. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html\\\">Quotas for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p>Describes the available adjustment types for step scaling and simple scaling policies.</p> <p>The following adjustment types are supported:</p> <ul> <li> <p> <code>ChangeInCapacity</code> </p> </li> <li> <p> <code>ExactCapacity</code> </p> </li> <li> <p> <code>PercentChangeInCapacity</code> </p> </li> </ul>\"\
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
      \"documentation\":\"<p>Gets information about the Auto Scaling groups in the account and Region.</p> <p>If you specify Auto Scaling group names, the output includes information for only the specified Auto Scaling groups. If you specify filters, the output includes information for only those Auto Scaling groups that meet the filter criteria. If you do not specify group names or filters, the output includes information for all Auto Scaling groups. </p> <p>This operation also returns information about instances in Auto Scaling groups. To retrieve information about the instances in a warm pool, you must call the <a>DescribeWarmPool</a> API. </p>\"\
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
      \"documentation\":\"<p>Gets information about the Auto Scaling instances in the account and Region.</p>\"\
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
      \"documentation\":\"<p>Gets information about the instance refreshes for the specified Auto Scaling group.</p> <p>This operation is part of the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p> <p>To help you determine the status of an instance refresh, Amazon EC2 Auto Scaling returns information about the instance refreshes you previously initiated, including their status, start time, end time, the percentage of the instance refresh that is complete, and the number of instances remaining to update before the instance refresh is complete. If a rollback is initiated while an instance refresh is in progress, Amazon EC2 Auto Scaling also returns information about the rollback of the instance refresh.</p>\"\
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
      \"documentation\":\"<p>Gets information about the launch configurations in the account and Region.</p>\"\
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
      \"documentation\":\"<p>Describes the available types of lifecycle hooks.</p> <p>The following hook types are supported:</p> <ul> <li> <p> <code>autoscaling:EC2_INSTANCE_LAUNCHING</code> </p> </li> <li> <p> <code>autoscaling:EC2_INSTANCE_TERMINATING</code> </p> </li> </ul>\"\
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
      \"documentation\":\"<p>Gets information about the lifecycle hooks for the specified Auto Scaling group.</p>\"\
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
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"InvalidNextToken\"}\
      ],\
      \"documentation\":\"<note> <p>This API operation is superseded by <a>DescribeTrafficSources</a>, which can describe multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DescribeLoadBalancerTargetGroups</code>. You can use both the original <code>DescribeLoadBalancerTargetGroups</code> API operation and <code>DescribeTrafficSources</code> on the same Auto Scaling group.</p> </note> <p>Gets information about the Elastic Load Balancing target groups for the specified Auto Scaling group.</p> <p>To determine the attachment status of the target group, use the <code>State</code> element in the response. When you attach a target group to an Auto Scaling group, the initial <code>State</code> value is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the target group. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. When the target group is in the <code>InService</code> state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the target group doesn't enter the <code>InService</code> state. </p> <p>Target groups also have an <code>InService</code> state if you attach them in the <a>CreateAutoScalingGroup</a> API call. If your target group state is <code>InService</code>, but it is not working properly, check the scaling activities by calling <a>DescribeScalingActivities</a> and take any corrective actions necessary.</p> <p>For help with failed health checks, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html\\\">Troubleshooting Amazon EC2 Auto Scaling: Health checks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p> <note> <p>You can use this operation to describe target groups that were attached by using <a>AttachLoadBalancerTargetGroups</a>, but not for target groups that were attached by using <a>AttachTrafficSources</a>.</p> </note>\"\
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
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"InvalidNextToken\"}\
      ],\
      \"documentation\":\"<note> <p>This API operation is superseded by <a>DescribeTrafficSources</a>, which can describe multiple traffic sources types. We recommend using <code>DescribeTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DescribeLoadBalancers</code>. You can use both the original <code>DescribeLoadBalancers</code> API operation and <code>DescribeTrafficSources</code> on the same Auto Scaling group.</p> </note> <p>Gets information about the load balancers for the specified Auto Scaling group.</p> <p>This operation describes only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DescribeLoadBalancerTargetGroups</a> API instead.</p> <p>To determine the attachment status of the load balancer, use the <code>State</code> element in the response. When you attach a load balancer to an Auto Scaling group, the initial <code>State</code> value is <code>Adding</code>. The state transitions to <code>Added</code> after all Auto Scaling instances are registered with the load balancer. If Elastic Load Balancing health checks are enabled for the Auto Scaling group, the state transitions to <code>InService</code> after at least one Auto Scaling instance passes the health check. When the load balancer is in the <code>InService</code> state, Amazon EC2 Auto Scaling can terminate and replace any instances that are reported as unhealthy. If no registered instances pass the health checks, the load balancer doesn't enter the <code>InService</code> state. </p> <p>Load balancers also have an <code>InService</code> state if you attach them in the <a>CreateAutoScalingGroup</a> API call. If your load balancer state is <code>InService</code>, but it is not working properly, check the scaling activities by calling <a>DescribeScalingActivities</a> and take any corrective actions necessary.</p> <p>For help with failed health checks, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html\\\">Troubleshooting Amazon EC2 Auto Scaling: Health checks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
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
      \"documentation\":\"<p>Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.</p>\"\
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
      \"documentation\":\"<p>Gets information about the Amazon SNS notifications that are configured for one or more Auto Scaling groups.</p>\"\
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
      \"documentation\":\"<p>Gets information about the scaling policies in the account and Region.</p>\"\
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
      \"documentation\":\"<p>Gets information about the scaling activities in the account and Region.</p> <p>When scaling events occur, you see a record of the scaling activity in the scaling activities. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html\\\">Verifying a scaling activity for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If the scaling event succeeds, the value of the <code>StatusCode</code> element in the response is <code>Successful</code>. If an attempt to launch instances failed, the <code>StatusCode</code> value is <code>Failed</code> or <code>Cancelled</code> and the <code>StatusMessage</code> element in the response indicates the cause of the failure. For help interpreting the <code>StatusMessage</code>, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/CHAP_Troubleshooting.html\\\">Troubleshooting Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p>\"\
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
      \"documentation\":\"<p>Gets information about the scheduled actions that haven't run or that have not reached their end time.</p> <p>To describe the scaling activities for scheduled actions that have already run, call the <a>DescribeScalingActivities</a> API.</p>\"\
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
      \"documentation\":\"<p>Describes the specified tags.</p> <p>You can use filters to limit the results. For example, you can query for the tags for a specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at least one of the specified values for it to be included in the results.</p> <p>You can also specify multiple filters. The result includes information for a particular tag only if it matches all the filters. If there's no match, no special message is returned.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html\\\">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p>Describes the termination policies supported by Amazon EC2 Auto Scaling.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html\\\">Work with Amazon EC2 Auto Scaling termination policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"DescribeTrafficSources\":{\
      \"name\":\"DescribeTrafficSources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTrafficSourcesRequest\"},\
      \"output\":{\
        \"shape\":\"DescribeTrafficSourcesResponse\",\
        \"resultWrapper\":\"DescribeTrafficSourcesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"InvalidNextToken\"}\
      ],\
      \"documentation\":\"<p>Gets information about the traffic sources for the specified Auto Scaling group.</p> <p>You can optionally provide a traffic source type. If you provide a traffic source type, then the results only include that traffic source type.</p> <p>If you do not provide a traffic source type, then the results include all the traffic sources for the specified Auto Scaling group. </p>\"\
    },\
    \"DescribeWarmPool\":{\
      \"name\":\"DescribeWarmPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeWarmPoolType\"},\
      \"output\":{\
        \"shape\":\"DescribeWarmPoolAnswer\",\
        \"resultWrapper\":\"DescribeWarmPoolResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"InvalidNextToken\"},\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Gets information about a warm pool and its instances.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html\\\">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<note> <p>This API operation is superseded by <a>DetachTrafficSources</a>, which can detach multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DetachLoadBalancerTargetGroups</code>. You can use both the original <code>DetachLoadBalancerTargetGroups</code> API operation and <code>DetachTrafficSources</code> on the same Auto Scaling group.</p> </note> <p>Detaches one or more target groups from the specified Auto Scaling group.</p> <p>When you detach a target group, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the target group using the <a>DescribeLoadBalancerTargetGroups</a> API call. The instances remain running.</p> <note> <p>You can use this operation to detach target groups that were attached by using <a>AttachLoadBalancerTargetGroups</a>, but not for target groups that were attached by using <a>AttachTrafficSources</a>.</p> </note>\"\
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
      \"documentation\":\"<note> <p>This API operation is superseded by <a>DetachTrafficSources</a>, which can detach multiple traffic sources types. We recommend using <code>DetachTrafficSources</code> to simplify how you manage traffic sources. However, we continue to support <code>DetachLoadBalancers</code>. You can use both the original <code>DetachLoadBalancers</code> API operation and <code>DetachTrafficSources</code> on the same Auto Scaling group.</p> </note> <p>Detaches one or more Classic Load Balancers from the specified Auto Scaling group.</p> <p>This operation detaches only Classic Load Balancers. If you have Application Load Balancers, Network Load Balancers, or Gateway Load Balancers, use the <a>DetachLoadBalancerTargetGroups</a> API instead.</p> <p>When you detach a load balancer, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the load balancer using the <a>DescribeLoadBalancers</a> API call. The instances remain running.</p>\"\
    },\
    \"DetachTrafficSources\":{\
      \"name\":\"DetachTrafficSources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetachTrafficSourcesType\"},\
      \"output\":{\
        \"shape\":\"DetachTrafficSourcesResultType\",\
        \"resultWrapper\":\"DetachTrafficSourcesResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Detaches one or more traffic sources from the specified Auto Scaling group.</p> <p>When you detach a taffic, it enters the <code>Removing</code> state while deregistering the instances in the group. When all instances are deregistered, then you can no longer describe the traffic source using the <a>DescribeTrafficSources</a> API call. The instances continue to run.</p>\"\
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
      \"documentation\":\"<p>Disables group metrics collection for the specified Auto Scaling group.</p>\"\
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
      \"documentation\":\"<p>Enables group metrics collection for the specified Auto Scaling group.</p> <p>You can use these metrics to track changes in an Auto Scaling group and to set alarms on threshold values. You can view group metrics using the Amazon EC2 Auto Scaling console or the CloudWatch console. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html\\\">Monitor CloudWatch metrics for your Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
    \"GetPredictiveScalingForecast\":{\
      \"name\":\"GetPredictiveScalingForecast\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPredictiveScalingForecastType\"},\
      \"output\":{\
        \"shape\":\"GetPredictiveScalingForecastAnswer\",\
        \"resultWrapper\":\"GetPredictiveScalingForecastResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Retrieves the forecast data for a predictive scaling policy.</p> <p>Load forecasts are predictions of the hourly load values using historical load data from CloudWatch and an analysis of historical trends. Capacity forecasts are represented as predicted values for the minimum capacity that is needed on an hourly basis, based on the hourly load forecast.</p> <p>A minimum of 24 hours of data is required to create the initial forecasts. However, having a full 14 days of historical data results in more accurate forecasts.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html\\\">Predictive scaling for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p>Creates or updates a lifecycle hook for the specified Auto Scaling group.</p> <p>Lifecycle hooks let you create solutions that are aware of events in the Auto Scaling instance lifecycle, and then perform a custom action on instances when the corresponding lifecycle event occurs.</p> <p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p> </li> <li> <p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p> <b>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</b> </p> </li> <li> <p>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state using the <a>RecordLifecycleActionHeartbeat</a> API call.</p> </li> <li> <p>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto Scaling group, the call fails.</p> <p>You can view the lifecycle hooks for an Auto Scaling group using the <a>DescribeLifecycleHooks</a> API call. If you are no longer using a lifecycle hook, you can delete it by calling the <a>DeleteLifecycleHook</a> API.</p>\"\
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
      \"documentation\":\"<p>Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to scale an Auto Scaling group based on configurable metrics. If no policies are defined, the dynamic scaling and predictive scaling features are not used. </p> <p>For more information about using dynamic scaling, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html\\\">Target tracking scaling policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html\\\">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>For more information about using predictive scaling, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html\\\">Predictive scaling for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>You can view the scaling policies for an Auto Scaling group using the <a>DescribePolicies</a> API call. If you are no longer using a scaling policy, you can delete it by calling the <a>DeletePolicy</a> API.</p>\"\
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
      \"documentation\":\"<p>Creates or updates a scheduled scaling action for an Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html\\\">Scheduled scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>You can view the scheduled actions for an Auto Scaling group using the <a>DescribeScheduledActions</a> API call. If you are no longer using a scheduled action, you can delete it by calling the <a>DeleteScheduledAction</a> API.</p> <p>If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error message.</p>\"\
    },\
    \"PutWarmPool\":{\
      \"name\":\"PutWarmPool\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutWarmPoolType\"},\
      \"output\":{\
        \"shape\":\"PutWarmPoolAnswer\",\
        \"resultWrapper\":\"PutWarmPoolResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your application needs to scale out, the Auto Scaling group can draw on the warm pool to meet its new desired capacity. For more information and example configurations, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html\\\">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>This operation must be called from the Region in which the Auto Scaling group was created. This operation cannot be called on an Auto Scaling group that has a mixed instances policy or a launch template or launch configuration that requests Spot Instances.</p> <p>You can view the instances in the warm pool using the <a>DescribeWarmPool</a> API call. If you are no longer using a warm pool, you can delete it by calling the <a>DeleteWarmPool</a> API.</p>\"\
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
      \"documentation\":\"<p>Records a heartbeat for the lifecycle action associated with the specified token or instance. This extends the timeout by the length of time defined using the <a>PutLifecycleHook</a> API call.</p> <p>This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:</p> <ol> <li> <p>(Optional) Create a launch template or launch configuration with a user data script that runs while an instance is in a wait state due to a lifecycle hook.</p> </li> <li> <p>(Optional) Create a Lambda function and a rule that allows Amazon EventBridge to invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.</p> </li> <li> <p>(Optional) Create a notification target and an IAM role. The target can be either an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish lifecycle notifications to the target.</p> </li> <li> <p>Create the lifecycle hook. Specify whether the hook is used when the instances launch or terminate.</p> </li> <li> <p> <b>If you need more time, record the lifecycle action heartbeat to keep the instance in a wait state.</b> </p> </li> <li> <p>If you finish before the timeout period ends, send a callback by using the <a>CompleteLifecycleAction</a> API call.</p> </li> </ol> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
    \"RollbackInstanceRefresh\":{\
      \"name\":\"RollbackInstanceRefresh\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RollbackInstanceRefreshType\"},\
      \"output\":{\
        \"shape\":\"RollbackInstanceRefreshAnswer\",\
        \"resultWrapper\":\"RollbackInstanceRefreshResult\"\
      },\
      \"errors\":[\
        {\"shape\":\"LimitExceededFault\"},\
        {\"shape\":\"ResourceContentionFault\"},\
        {\"shape\":\"ActiveInstanceRefreshNotFoundFault\"},\
        {\"shape\":\"IrreversibleInstanceRefreshFault\"}\
      ],\
      \"documentation\":\"<p>Cancels an instance refresh that is in progress and rolls back any changes that it made. Amazon EC2 Auto Scaling replaces any instances that were replaced during the instance refresh. This restores your Auto Scaling group to the configuration that it was using before the start of the instance refresh. </p> <p>This operation is part of the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group after you make configuration changes.</p> <p>A rollback is not supported in the following situations: </p> <ul> <li> <p>There is no desired configuration specified for the instance refresh.</p> </li> <li> <p>The Auto Scaling group has a launch template that uses an Amazon Web Services Systems Manager parameter instead of an AMI ID for the <code>ImageId</code> property.</p> </li> <li> <p>The Auto Scaling group uses the launch template's <code>$Latest</code> or <code>$Default</code> version.</p> </li> </ul> <p>When you receive a successful response from this operation, Amazon EC2 Auto Scaling immediately begins replacing instances. You can check the status of this operation through the <a>DescribeInstanceRefreshes</a> API operation. </p>\"\
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
      \"documentation\":\"<p>Updates the instance protection settings of the specified instances. This operation cannot be called on instances in a warm pool.</p> <p>For more information about preventing instances that are part of an Auto Scaling group from terminating on scale in, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html\\\">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the call fails.</p>\"\
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
      \"documentation\":\"<p>Starts an instance refresh. During an instance refresh, Amazon EC2 Auto Scaling performs a rolling update of instances in an Auto Scaling group. Instances are terminated first and then replaced, which temporarily reduces the capacity available within your Auto Scaling group.</p> <p>This operation is part of the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html\\\">instance refresh feature</a> in Amazon EC2 Auto Scaling, which helps you update instances in your Auto Scaling group. This feature is helpful, for example, when you have a new AMI or a new user data script. You just need to create a new launch template that specifies the new AMI or user data script. Then start an instance refresh to immediately begin the process of updating instances in the group. </p> <p>If successful, the request's response contains a unique ID that you can use to track the progress of the instance refresh. To query its status, call the <a>DescribeInstanceRefreshes</a> API. To describe the instance refreshes that have already run, call the <a>DescribeInstanceRefreshes</a> API. To cancel an instance refresh that is in progress, use the <a>CancelInstanceRefresh</a> API. </p> <p>An instance refresh might fail for several reasons, such as EC2 launch failures, misconfigured health checks, or not ignoring or allowing the termination of instances that are in <code>Standby</code> state or protected from scale in. You can monitor for failed EC2 launches using the scaling activities. To find the scaling activities, call the <a>DescribeScalingActivities</a> API.</p> <p>If you enable auto rollback, your Auto Scaling group will be rolled back automatically when the instance refresh fails. You can enable this feature before starting an instance refresh by specifying the <code>AutoRollback</code> property in the instance refresh preferences. Otherwise, to roll back an instance refresh before it finishes, use the <a>RollbackInstanceRefresh</a> API. </p>\"\
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
      \"documentation\":\"<p>Terminates the specified instance and optionally adjusts the desired group size. This operation cannot be called on instances in a warm pool.</p> <p>This call simply makes a termination request. The instance is not terminated immediately. When an instance is terminated, the instance status changes to <code>terminated</code>. You can't connect to or start an instance after you've terminated it.</p> <p>If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling launches instances to replace the ones that are terminated. </p> <p>By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you decrement the desired capacity, your Auto Scaling group can become unbalanced between Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might terminate instances in other zones. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html#AutoScalingBehavior.InstanceUsage\\\">Rebalancing activities</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
      \"documentation\":\"<p> <b>We strongly recommend that all Auto Scaling groups use launch templates to ensure full functionality for Amazon EC2 Auto Scaling and Amazon EC2.</b> </p> <p>Updates the configuration for the specified Auto Scaling group.</p> <p>To update an Auto Scaling group, specify the name of the group and the property that you want to change. Any properties that you don't specify are not changed by this update request. The new settings take effect on any scaling activities after this call returns. </p> <p>If you associate a new launch configuration or template with an Auto Scaling group, all new instances will get the updated configuration. Existing instances continue to run with the configuration that they were originally launched with. When you update a group to specify a mixed instances policy instead of a launch configuration or template, existing instances may be replaced to match the new purchasing options that you specified in the policy. For example, if the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, this means that half of your instances will be gradually terminated and relaunched as Spot Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before terminating the old ones, so that updating your group does not compromise the performance or availability of your application.</p> <p>Note the following about changing <code>DesiredCapacity</code>, <code>MaxSize</code>, or <code>MinSize</code>:</p> <ul> <li> <p>If a scale-in activity occurs as a result of a new <code>DesiredCapacity</code> value that is lower than the current size of the group, the Auto Scaling group uses its termination policy to determine which instances to terminate.</p> </li> <li> <p>If you specify a new value for <code>MinSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MinSize</code> is larger than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MinSize</code> value.</p> </li> <li> <p>If you specify a new value for <code>MaxSize</code> without specifying a value for <code>DesiredCapacity</code>, and the new <code>MaxSize</code> is smaller than the current size of the group, this sets the group's <code>DesiredCapacity</code> to the new <code>MaxSize</code> value.</p> </li> </ul> <p>To see which properties have been set, call the <a>DescribeAutoScalingGroups</a> API. To view the scaling policies for an Auto Scaling group, call the <a>DescribePolicies</a> API. If the group has scaling policies, you can update them by calling the <a>PutScalingPolicy</a> API.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AcceleratorCountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The minimum value.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The maximum value.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>AcceleratorCount</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
    \"AcceleratorManufacturer\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"nvidia\",\
        \"amd\",\
        \"amazon-web-services\",\
        \"xilinx\"\
      ]\
    },\
    \"AcceleratorManufacturers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AcceleratorManufacturer\"}\
    },\
    \"AcceleratorName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"a100\",\
        \"v100\",\
        \"k80\",\
        \"t4\",\
        \"m60\",\
        \"radeon-pro-v520\",\
        \"vu9p\"\
      ]\
    },\
    \"AcceleratorNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AcceleratorName\"}\
    },\
    \"AcceleratorTotalMemoryMiBRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The memory minimum in MiB.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The memory maximum in MiB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>AcceleratorTotalMemoryMiB</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
    \"AcceleratorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"gpu\",\
        \"fpga\",\
        \"inference\"\
      ]\
    },\
    \"AcceleratorTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AcceleratorType\"}\
    },\
    \"ActiveInstanceRefreshNotFoundFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"XmlStringMaxLen255\"}\
      },\
      \"documentation\":\"<p>The request failed because an active instance refresh or rollback for the specified Auto Scaling group was not found.</p>\",\
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
    \"AllowedInstanceType\":{\
      \"type\":\"string\",\
      \"max\":30,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\.\\\\*]+\"\
    },\
    \"AllowedInstanceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AllowedInstanceType\"},\
      \"max\":400\
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
          \"documentation\":\"<p>The Amazon Resource Names (ARNs) of the target groups. You can specify up to 10 target groups. To get the ARN of a target group, use the Elastic Load Balancing <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
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
    \"AttachTrafficSourcesResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AttachTrafficSourcesType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"TrafficSources\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TrafficSources\":{\
          \"shape\":\"TrafficSources\",\
          \"documentation\":\"<p>The unique identifiers of one or more traffic sources. You can specify up to 10 traffic sources.</p>\"\
        }\
      }\
    },\
    \"AutoRollback\":{\"type\":\"boolean\"},\
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
        \"PredictedCapacity\":{\
          \"shape\":\"AutoScalingGroupPredictedCapacity\",\
          \"documentation\":\"<p>The predicted capacity of the group when it has a predictive scaling policy.</p>\"\
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
          \"documentation\":\"<p>A comma-separated value string of one or more health check types.</p>\"\
        },\
        \"HealthCheckGracePeriod\":{\
          \"shape\":\"HealthCheckGracePeriod\",\
          \"documentation\":\"<p>The duration of the health check grace period, in seconds.</p>\"\
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
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other Amazon Web Services on your behalf.</p>\"\
        },\
        \"MaxInstanceLifetime\":{\
          \"shape\":\"MaxInstanceLifetime\",\
          \"documentation\":\"<p>The maximum amount of time, in seconds, that an instance can be in service.</p> <p>Valid Range: Minimum value of 0.</p>\"\
        },\
        \"CapacityRebalance\":{\
          \"shape\":\"CapacityRebalanceEnabled\",\
          \"documentation\":\"<p>Indicates whether Capacity Rebalancing is enabled.</p>\"\
        },\
        \"WarmPoolConfiguration\":{\
          \"shape\":\"WarmPoolConfiguration\",\
          \"documentation\":\"<p>The warm pool for the group.</p>\"\
        },\
        \"WarmPoolSize\":{\
          \"shape\":\"WarmPoolSize\",\
          \"documentation\":\"<p>The current size of the warm pool.</p>\"\
        },\
        \"Context\":{\
          \"shape\":\"Context\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"DesiredCapacityType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling supports <code>DesiredCapacityType</code> for attribute-based instance type selection only.</p>\"\
        },\
        \"DefaultInstanceWarmup\":{\
          \"shape\":\"DefaultInstanceWarmup\",\
          \"documentation\":\"<p>The duration of the default instance warmup, in seconds.</p>\"\
        },\
        \"TrafficSources\":{\
          \"shape\":\"TrafficSources\",\
          \"documentation\":\"<p>The traffic sources associated with this Auto Scaling group.</p>\"\
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
          \"documentation\":\"<p>The names of the Auto Scaling groups. By default, you can only specify up to 50 names. You can optionally increase this limit using the <code>MaxRecords</code> property.</p> <p>If you omit this property, all Auto Scaling groups are described.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The default value is <code>50</code> and the maximum value is <code>100</code>.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>One or more filters to limit the results based on specific tags. </p>\"\
        }\
      }\
    },\
    \"AutoScalingGroupPredictedCapacity\":{\"type\":\"integer\"},\
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
          \"documentation\":\"<p>The lifecycle state for the instance. The <code>Quarantined</code> state is not used. For information about lifecycle states, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroupLifecycle.html\\\">Instance lifecycle</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p> <p>Valid values: <code>Pending</code> | <code>Pending:Wait</code> | <code>Pending:Proceed</code> | <code>Quarantined</code> | <code>InService</code> | <code>Terminating</code> | <code>Terminating:Wait</code> | <code>Terminating:Proceed</code> | <code>Terminated</code> | <code>Detaching</code> | <code>Detached</code> | <code>EnteringStandby</code> | <code>Standby</code> | <code>Warmed:Pending</code> | <code>Warmed:Pending:Wait</code> | <code>Warmed:Pending:Proceed</code> | <code>Warmed:Terminating</code> | <code>Warmed:Terminating:Wait</code> | <code>Warmed:Terminating:Proceed</code> | <code>Warmed:Terminated</code> | <code>Warmed:Stopped</code> | <code>Warmed:Running</code> </p>\"\
        },\
        \"HealthStatus\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>The last reported health status of this instance. <code>Healthy</code> means that the instance is healthy and should remain in service. <code>Unhealthy</code> means that the instance is unhealthy and Amazon EC2 Auto Scaling should terminate and replace it.</p>\"\
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
    \"BareMetal\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"included\",\
        \"excluded\",\
        \"required\"\
      ]\
    },\
    \"BaselineEbsBandwidthMbpsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The minimum value in Mbps.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The maximum value in Mbps.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>BaselineEbsBandwidthMbps</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
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
    \"BlockDeviceEbsThroughput\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":125\
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
          \"documentation\":\"<p>The name of the instance store volume (virtual device) to attach to an instance at launch. The name must be in the form ephemeral<i>X</i> where <i>X</i> is a number starting from zero (0), for example, <code>ephemeral0</code>.</p>\"\
        },\
        \"DeviceName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The device name assigned to the volume (for example, <code>/dev/sdh</code> or <code>xvdh</code>). For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html\\\">Device naming on Linux instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <note> <p>To define a block device mapping, set the device name and exactly one of the following properties: <code>Ebs</code>, <code>NoDevice</code>, or <code>VirtualName</code>.</p> </note>\"\
        },\
        \"Ebs\":{\
          \"shape\":\"Ebs\",\
          \"documentation\":\"<p>Information to attach an EBS volume to an instance at launch.</p>\"\
        },\
        \"NoDevice\":{\
          \"shape\":\"NoDevice\",\
          \"documentation\":\"<p>Setting this value to <code>true</code> prevents a volume that is included in the block device mapping of the AMI from being mapped to the specified device name at launch.</p> <p>If <code>NoDevice</code> is <code>true</code> for the root device, instances might fail the EC2 health check. In that case, Amazon EC2 Auto Scaling launches replacement instances.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a block device mapping.</p>\"\
    },\
    \"BlockDeviceMappings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BlockDeviceMapping\"}\
    },\
    \"BurstablePerformance\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"included\",\
        \"excluded\",\
        \"required\"\
      ]\
    },\
    \"CancelInstanceRefreshAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance refresh ID associated with the request. This is the unique ID assigned to the instance refresh when it was started.</p>\"\
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
    \"CapacityForecast\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Timestamps\",\
        \"Values\"\
      ],\
      \"members\":{\
        \"Timestamps\":{\
          \"shape\":\"PredictiveScalingForecastTimestamps\",\
          \"documentation\":\"<p>The timestamps for the data points, in UTC format.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"PredictiveScalingForecastValues\",\
          \"documentation\":\"<p>The values of the data points.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <code>GetPredictiveScalingForecast</code> call returns the capacity forecast for a predictive scaling policy. This structure includes the data points for that capacity forecast, along with the timestamps of those data points. </p>\"\
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
          \"documentation\":\"<p>The action for the group to take. You can specify either <code>CONTINUE</code> or <code>ABANDON</code>.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance.</p>\"\
        }\
      }\
    },\
    \"Context\":{\"type\":\"string\"},\
    \"Cooldown\":{\"type\":\"integer\"},\
    \"CpuManufacturer\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"intel\",\
        \"amd\",\
        \"amazon-web-services\"\
      ]\
    },\
    \"CpuManufacturers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CpuManufacturer\"}\
    },\
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
          \"documentation\":\"<p>The name of the Auto Scaling group. This name must be unique per Region per account.</p> <p>The name can contain any ASCII character 33 to 126 including most punctuation characters, digits, and upper and lowercased letters.</p> <note> <p>You cannot use a colon (:) in the name.</p> </note>\"\
        },\
        \"LaunchConfigurationName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the launch configuration to use to launch instances. </p> <p>Conditional: You must specify either a launch template (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a launch configuration (<code>LaunchConfigurationName</code> or <code>InstanceId</code>).</p>\"\
        },\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>Information used to specify the launch template and version to use to launch instances. </p> <p>Conditional: You must specify either a launch template (<code>LaunchTemplate</code> or <code>MixedInstancesPolicy</code>) or a launch configuration (<code>LaunchConfigurationName</code> or <code>InstanceId</code>).</p> <note> <p>The launch template that is specified must be configured for use with an Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html\\\">Creating a launch template for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> </note>\"\
        },\
        \"MixedInstancesPolicy\":{\
          \"shape\":\"MixedInstancesPolicy\",\
          \"documentation\":\"<p>The mixed instances policy. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
          \"documentation\":\"<p> <i>Only needed if you use simple scaling policies.</i> </p> <p>The amount of time, in seconds, between one scaling activity ending and another one starting due to simple scaling policies. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Default: <code>300</code> seconds</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>A list of Availability Zones where instances in the Auto Scaling group can be created. Used for launching into the default VPC subnet in each Availability Zone when not using the <code>VPCZoneIdentifier</code> property, or for attaching a network interface when an existing network interface ID is specified in a launch template.</p>\"\
        },\
        \"LoadBalancerNames\":{\
          \"shape\":\"LoadBalancerNames\",\
          \"documentation\":\"<p>A list of Classic Load Balancers associated with this Auto Scaling group. For Application Load Balancers, Network Load Balancers, and Gateway Load Balancers, specify the <code>TargetGroupARNs</code> property instead.</p>\"\
        },\
        \"TargetGroupARNs\":{\
          \"shape\":\"TargetGroupARNs\",\
          \"documentation\":\"<p>The Amazon Resource Names (ARN) of the Elastic Load Balancing target groups to associate with the Auto Scaling group. Instances are registered as targets with the target groups. The target groups receive incoming traffic and route requests to one or more registered targets. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html\\\">Use Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"HealthCheckType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>A comma-separated value string of one or more health check types.</p> <p>The valid values are <code>EC2</code>, <code>ELB</code>, and <code>VPC_LATTICE</code>. <code>EC2</code> is the default health check and cannot be disabled. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html\\\">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Only specify <code>EC2</code> if you must clear a value that was previously set.</p>\"\
        },\
        \"HealthCheckGracePeriod\":{\
          \"shape\":\"HealthCheckGracePeriod\",\
          \"documentation\":\"<p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service and marking it unhealthy due to a failed health check. This is useful if your instances do not immediately pass their health checks after they enter the <code>InService</code> state. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/health-check-grace-period.html\\\">Set the health check grace period for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Default: <code>0</code> seconds</p>\"\
        },\
        \"PlacementGroup\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the placement group into which to launch your instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html\\\">Placement groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <note> <p>A <i>cluster</i> placement group is a logical grouping of instances within a single Availability Zone. You cannot specify multiple Availability Zones and a cluster placement group. </p> </note>\"\
        },\
        \"VPCZoneIdentifier\":{\
          \"shape\":\"XmlStringMaxLen2047\",\
          \"documentation\":\"<p>A comma-separated list of subnet IDs for a virtual private cloud (VPC) where instances in the Auto Scaling group can be created. If you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the subnets that you specify must reside in those Availability Zones.</p>\"\
        },\
        \"TerminationPolicies\":{\
          \"shape\":\"TerminationPolicies\",\
          \"documentation\":\"<p>A policy or a list of policies that are used to select the instance to terminate. These policies are executed in the order that you list them. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html\\\">Work with Amazon EC2 Auto Scaling termination policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Valid values: <code>Default</code> | <code>AllocationStrategy</code> | <code>ClosestToNextInstanceHour</code> | <code>NewestInstance</code> | <code>OldestInstance</code> | <code>OldestLaunchConfiguration</code> | <code>OldestLaunchTemplate</code> | <code>arn:aws:lambda:region:account-id:function:my-function:my-alias</code> </p>\"\
        },\
        \"NewInstancesProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in. For more information about preventing instances from terminating on scale in, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html\\\">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CapacityRebalance\":{\
          \"shape\":\"CapacityRebalanceEnabled\",\
          \"documentation\":\"<p>Indicates whether Capacity Rebalancing is enabled. Otherwise, Capacity Rebalancing is disabled. When you turn on Capacity Rebalancing, Amazon EC2 Auto Scaling attempts to launch a Spot Instance whenever Amazon EC2 notifies that a Spot Instance is at an elevated risk of interruption. After launching a new instance, it then terminates an old instance. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html\\\">Use Capacity Rebalancing to handle Amazon EC2 Spot Interruptions</a> in the in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"LifecycleHookSpecificationList\":{\
          \"shape\":\"LifecycleHookSpecifications\",\
          \"documentation\":\"<p>One or more lifecycle hooks to add to the Auto Scaling group before instances are launched.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>One or more tags. You can tag your Auto Scaling group and propagate the tags to the Amazon EC2 instances it launches. Tags are not propagated to Amazon EBS volumes. To add tags to Amazon EBS volumes, specify the tags in a launch template but use caution. If the launch template specifies an instance tag with a key that is also specified for the Auto Scaling group, Amazon EC2 Auto Scaling overrides the value of that instance tag with the value specified by the Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html\\\">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ServiceLinkedRoleARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other Amazon Web Services service on your behalf. By default, Amazon EC2 Auto Scaling uses a service-linked role named <code>AWSServiceRoleForAutoScaling</code>, which it creates if it does not exist. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html\\\">Service-linked roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MaxInstanceLifetime\":{\
          \"shape\":\"MaxInstanceLifetime\",\
          \"documentation\":\"<p>The maximum amount of time, in seconds, that an instance can be in service. The default is null. If specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day). For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html\\\">Replacing Auto Scaling instances based on maximum instance lifetime</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"Context\":{\
          \"shape\":\"Context\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"DesiredCapacityType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling supports <code>DesiredCapacityType</code> for attribute-based instance type selection only. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html\\\">Creating an Auto Scaling group using attribute-based instance type selection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>By default, Amazon EC2 Auto Scaling specifies <code>units</code>, which translates into number of instances.</p> <p>Valid values: <code>units</code> | <code>vcpu</code> | <code>memory-mib</code> </p>\"\
        },\
        \"DefaultInstanceWarmup\":{\
          \"shape\":\"DefaultInstanceWarmup\",\
          \"documentation\":\"<p>The amount of time, in seconds, until a new instance is considered to have finished initializing and resource consumption to become stable after it enters the <code>InService</code> state. </p> <p>During an instance refresh, Amazon EC2 Auto Scaling waits for the warm-up period after it replaces an instance before it moves on to replacing the next instance. Amazon EC2 Auto Scaling also waits for the warm-up period before aggregating the metrics for new instances with existing instances in the Amazon CloudWatch metrics that are used for scaling, resulting in more reliable usage data. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-default-instance-warmup.html\\\">Set the default instance warmup for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <important> <p>To manage various warm-up settings at the group level, we recommend that you set the default instance warmup, <i>even if it is set to 0 seconds</i>. To remove a value that you previously set, include the property but specify <code>-1</code> for the value. However, we strongly recommend keeping the default instance warmup enabled by specifying a value of <code>0</code> or other nominal value.</p> </important> <p>Default: None </p>\"\
        },\
        \"TrafficSources\":{\
          \"shape\":\"TrafficSources\",\
          \"documentation\":\"<p>The list of traffic sources to attach to this Auto Scaling group. You can use any of the following as traffic sources for an Auto Scaling group: Classic Load Balancer, Application Load Balancer, Gateway Load Balancer, Network Load Balancer, and VPC Lattice.</p>\"\
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
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI) that was assigned during registration. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html\\\">Finding a Linux AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>If you specify <code>InstanceId</code>, an <code>ImageId</code> is not required.</p>\"\
        },\
        \"KeyName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the key pair. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html\\\">Amazon EC2 key pairs and Linux instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"SecurityGroups\":{\
          \"shape\":\"SecurityGroups\",\
          \"documentation\":\"<p>A list that contains the security group IDs to assign to the instances in the Auto Scaling group. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html\\\">Control traffic to resources using security groups</a> in the <i>Amazon Virtual Private Cloud User Guide</i>.</p>\"\
        },\
        \"ClassicLinkVPCId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Available for backward compatibility.</p>\"\
        },\
        \"ClassicLinkVPCSecurityGroups\":{\
          \"shape\":\"ClassicLinkVPCSecurityGroups\",\
          \"documentation\":\"<p>Available for backward compatibility.</p>\"\
        },\
        \"UserData\":{\
          \"shape\":\"XmlStringUserData\",\
          \"documentation\":\"<p>The user data to make available to the launched EC2 instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Linux) and <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Windows). If you are using a command line tool, base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"XmlStringMaxLen19\",\
          \"documentation\":\"<p>The ID of the instance to use to create the launch configuration. The new launch configuration derives attributes from the instance, except for the block device mapping.</p> <p>To create a launch configuration with a block device mapping or override any other instance attributes, specify them as part of the same request.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-lc-with-instanceID.html\\\">Creating a launch configuration using an EC2 instance</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies the instance type of the EC2 instance. For information about available instance types, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes\\\">Available instance types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>If you specify <code>InstanceId</code>, an <code>InstanceType</code> is not required.</p>\"\
        },\
        \"KernelId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the kernel associated with the AMI.</p> <note> <p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html\\\">User provided kernels</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> </note>\"\
        },\
        \"RamdiskId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ID of the RAM disk to select.</p> <note> <p>We recommend that you use PV-GRUB instead of kernels and RAM disks. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html\\\">User provided kernels</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> </note>\"\
        },\
        \"BlockDeviceMappings\":{\
          \"shape\":\"BlockDeviceMappings\",\
          \"documentation\":\"<p>The block device mapping entries that define the block devices to attach to the instances at launch. By default, the block devices specified in the block device mapping for the AMI are used. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html\\\">Block device mappings</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
        },\
        \"InstanceMonitoring\":{\
          \"shape\":\"InstanceMonitoring\",\
          \"documentation\":\"<p>Controls whether instances in this group are launched with detailed (<code>true</code>) or basic (<code>false</code>) monitoring.</p> <p>The default value is <code>true</code> (enabled).</p> <important> <p>When detailed monitoring is enabled, Amazon CloudWatch generates metrics every minute and your account is charged a fee. When you disable detailed monitoring, CloudWatch generates metrics every 5 minutes. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html\\\">Configure Monitoring for Auto Scaling Instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> </important>\"\
        },\
        \"SpotPrice\":{\
          \"shape\":\"SpotPrice\",\
          \"documentation\":\"<p>The maximum hourly price to be paid for any Spot Instance launched to fulfill the request. Spot Instances are launched when the price you specify exceeds the current Spot price. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-template-spot-instances.html\\\">Request Spot Instances for fault-tolerant and flexible applications</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Valid Range: Minimum value of 0.001</p> <note> <p>When you change your maximum price by creating a new launch configuration, running instances will continue to run as long as the maximum price for those running instances is higher than the current Spot price.</p> </note>\"\
        },\
        \"IamInstanceProfile\":{\
          \"shape\":\"XmlStringMaxLen1600\",\
          \"documentation\":\"<p>The name or the Amazon Resource Name (ARN) of the instance profile associated with the IAM role for the instance. The instance profile contains the IAM role. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html\\\">IAM role for applications that run on Amazon EC2 instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"EbsOptimized\":{\
          \"shape\":\"EbsOptimized\",\
          \"documentation\":\"<p>Specifies whether the launch configuration is optimized for EBS I/O (<code>true</code>) or not (<code>false</code>). The optimization provides dedicated throughput to Amazon EBS and an optimized configuration stack to provide optimal I/O performance. This optimization is not available with all instance types. Additional fees are incurred when you enable EBS optimization for an instance type that is not EBS-optimized by default. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html\\\">Amazon EBS-optimized instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>The default value is <code>false</code>.</p>\"\
        },\
        \"AssociatePublicIpAddress\":{\
          \"shape\":\"AssociatePublicIpAddress\",\
          \"documentation\":\"<p>Specifies whether to assign a public IPv4 address to the group's instances. If the instance is launched into a default subnet, the default is to assign a public IPv4 address, unless you disabled the option to assign a public IPv4 address on the subnet. If the instance is launched into a nondefault subnet, the default is not to assign a public IPv4 address, unless you enabled the option to assign a public IPv4 address on the subnet.</p> <p>If you specify <code>true</code>, each instance in the Auto Scaling group receives a unique public IPv4 address. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html\\\">Launching Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you specify this property, you must specify at least one subnet for <code>VPCZoneIdentifier</code> when you create your group.</p>\"\
        },\
        \"PlacementTenancy\":{\
          \"shape\":\"XmlStringMaxLen64\",\
          \"documentation\":\"<p>The tenancy of the instance, either <code>default</code> or <code>dedicated</code>. An instance with <code>dedicated</code> tenancy runs on isolated, single-tenant hardware and can only be launched into a VPC. To launch dedicated instances into a shared tenancy VPC (a VPC with the instance placement tenancy attribute set to <code>default</code>), you must set the value of this property to <code>dedicated</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-dedicated-instances.html\\\">Configuring instance tenancy with Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>If you specify <code>PlacementTenancy</code>, you must specify at least one subnet for <code>VPCZoneIdentifier</code> when you create your group.</p> <p>Valid values: <code>default</code> | <code>dedicated</code> </p>\"\
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
      \"members\":{\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric. To get the exact metric name, namespace, and dimensions, inspect the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html\\\">Metric</a> object that is returned by a call to <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html\\\">ListMetrics</a>.</p>\"\
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
          \"documentation\":\"<p>The unit of the metric. For a complete list of the units that CloudWatch supports, see the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html\\\">MetricDatum</a> data type in the <i>Amazon CloudWatch API Reference</i>.</p>\"\
        },\
        \"Metrics\":{\
          \"shape\":\"TargetTrackingMetricDataQueries\",\
          \"documentation\":\"<p>The metrics to include in the target tracking scaling policy, as a metric data query. This can include both raw metric and metric math expressions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use with Amazon EC2 Auto Scaling.</p> <p>To create your customized metric specification:</p> <ul> <li> <p>Add values for each required property from CloudWatch. You can use an existing metric, or a new metric that you create. To use your own metric, you must first publish the metric to CloudWatch. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html\\\">Publish custom metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> </li> <li> <p>Choose a metric that changes proportionally with capacity. The value of the metric should increase or decrease in inverse proportion to the number of capacity units. That is, the value of the metric should decrease when capacity increases.</p> </li> </ul> <p>For more information about the CloudWatch terminology below, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html\\\">Amazon CloudWatch concepts</a>.</p> <note> <p>Each individual service provides information about the metrics, namespace, and dimensions they use. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html\\\">Amazon Web Services services that publish CloudWatch metrics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> </note>\"\
    },\
    \"DefaultInstanceWarmup\":{\"type\":\"integer\"},\
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
          \"documentation\":\"<p>Specifies that the group is to be deleted along with all instances associated with the group, without waiting for all instances to be terminated. This action also deletes any outstanding lifecycle actions associated with the group.</p>\"\
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
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic.</p>\"\
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
    \"DeleteWarmPoolAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteWarmPoolType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"ForceDelete\":{\
          \"shape\":\"ForceDelete\",\
          \"documentation\":\"<p>Specifies that the warm pool is to be deleted along with all of its associated instances, without waiting for all instances to be terminated. This parameter also deletes any outstanding lifecycle actions associated with the warm pool instances.</p>\"\
        }\
      }\
    },\
    \"DescribeAccountLimitsAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxNumberOfAutoScalingGroups\":{\
          \"shape\":\"MaxNumberOfAutoScalingGroups\",\
          \"documentation\":\"<p>The maximum number of groups allowed for your account. The default is 200 groups per Region.</p>\"\
        },\
        \"MaxNumberOfLaunchConfigurations\":{\
          \"shape\":\"MaxNumberOfLaunchConfigurations\",\
          \"documentation\":\"<p>The maximum number of launch configurations allowed for your account. The default is 200 launch configurations per Region.</p>\"\
        },\
        \"NumberOfAutoScalingGroups\":{\
          \"shape\":\"NumberOfAutoScalingGroups\",\
          \"documentation\":\"<p>The current number of groups for your account.</p>\"\
        },\
        \"NumberOfLaunchConfigurations\":{\
          \"shape\":\"NumberOfLaunchConfigurations\",\
          \"documentation\":\"<p>The current number of launch configurations for your account.</p>\"\
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
          \"documentation\":\"<p>The IDs of the instances. If you omit this property, all Auto Scaling instances are described. If you specify an ID that does not exist, it is ignored with no error.</p> <p>Array Members: Maximum number of 50 items.</p>\"\
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
          \"documentation\":\"<p>The instance refreshes for the specified group, sorted by creation timestamp in descending order.</p>\"\
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
          \"documentation\":\"<p>The names of one or more lifecycle hooks. If you omit this property, all lifecycle hooks are described.</p>\"\
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
          \"documentation\":\"<p>The metrics.</p>\"\
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
          \"documentation\":\"<p>The names of one or more policies. If you omit this property, all policies are described. If a group name is provided, the results are limited to that group. If you specify an unknown policy name, it is ignored with no error.</p> <p>Array Members: Maximum number of 50 items.</p>\"\
        },\
        \"PolicyTypes\":{\
          \"shape\":\"PolicyTypes\",\
          \"documentation\":\"<p>One or more policy types. The valid values are <code>SimpleScaling</code>, <code>StepScaling</code>, <code>TargetTrackingScaling</code>, and <code>PredictiveScaling</code>.</p>\"\
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
          \"documentation\":\"<p>The activity IDs of the desired scaling activities. If you omit this property, all activities for the past six weeks are described. If unknown activities are requested, they are ignored with no error. If you specify an Auto Scaling group, the results are limited to that group.</p> <p>Array Members: Maximum number of 50 IDs.</p>\"\
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
          \"documentation\":\"<p>The names of one or more scheduled actions. If you omit this property, all scheduled actions are described. If you specify an unknown scheduled action, it is ignored with no error.</p> <p>Array Members: Maximum number of 50 actions.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The earliest scheduled start time to return. If scheduled action names are provided, this property is ignored.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The latest scheduled start time to return. If scheduled action names are provided, this property is ignored.</p>\"\
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
    \"DescribeTrafficSourcesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TrafficSourceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The traffic source type that you want to describe.</p> <p>The following lists the valid values:</p> <ul> <li> <p> <code>elb</code> if the traffic source is a Classic Load Balancer.</p> </li> <li> <p> <code>elbv2</code> if the traffic source is a Application Load Balancer, Gateway Load Balancer, or Network Load Balancer.</p> </li> <li> <p> <code>vpc-lattice</code> if the traffic source is VPC Lattice.</p> </li> </ul>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of items to return with this call. The maximum value is <code>50</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeTrafficSourcesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrafficSources\":{\
          \"shape\":\"TrafficSourceStates\",\
          \"documentation\":\"<p>Information about the traffic sources.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>This string indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"DescribeWarmPoolAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WarmPoolConfiguration\":{\
          \"shape\":\"WarmPoolConfiguration\",\
          \"documentation\":\"<p>The warm pool configuration details. </p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>The instances that are currently in the warm pool.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>This string indicates that the response contains more items than can be returned in a single response. To receive additional items, specify this string for the <code>NextToken</code> value when requesting the next set of items. This value is null when there are no more items to return.</p>\"\
        }\
      }\
    },\
    \"DescribeWarmPoolType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"MaxRecords\":{\
          \"shape\":\"MaxRecords\",\
          \"documentation\":\"<p>The maximum number of instances to return with this call. The maximum value is <code>50</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The token for the next set of instances to return. (You received this token from a previous call.)</p>\"\
        }\
      }\
    },\
    \"DesiredConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LaunchTemplate\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>Describes the launch template and the version of the launch template that Amazon EC2 Auto Scaling uses to launch Amazon EC2 instances. For more information about launch templates, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchTemplates.html\\\">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MixedInstancesPolicy\":{\
          \"shape\":\"MixedInstancesPolicy\",\
          \"documentation\":\"<p>Use this structure to launch multiple instance types and On-Demand Instances and Spot Instances within a single Auto Scaling group.</p> <p>A mixed instances policy contains information that Amazon EC2 Auto Scaling can use to launch instances and help optimize your costs. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the desired configuration for an instance refresh. </p> <p>If you specify a desired configuration, you must specify either a <code>LaunchTemplate</code> or a <code>MixedInstancesPolicy</code>. </p>\"\
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
    \"DetachTrafficSourcesResultType\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DetachTrafficSourcesType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"TrafficSources\"\
      ],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"TrafficSources\":{\
          \"shape\":\"TrafficSources\",\
          \"documentation\":\"<p>The unique identifiers of one or more traffic sources. You can specify up to 10 traffic sources.</p>\"\
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
          \"documentation\":\"<p>Identifies the metrics to disable.</p> <p>You can specify one or more of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> <li> <p> <code>WarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>WarmPoolWarmedCapacity</code> </p> </li> <li> <p> <code>WarmPoolPendingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTerminatingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTotalCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolTotalCapacity</code> </p> </li> </ul> <p>If you omit this property, all metrics are disabled.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html#as-group-metrics\\\">Auto Scaling group metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
          \"documentation\":\"<p>The volume size, in GiBs. The following are the supported volumes sizes for each volume type: </p> <ul> <li> <p> <code>gp2</code> and <code>gp3</code>: 1-16,384</p> </li> <li> <p> <code>io1</code>: 4-16,384</p> </li> <li> <p> <code>st1</code> and <code>sc1</code>: 125-16,384</p> </li> <li> <p> <code>standard</code>: 1-1,024</p> </li> </ul> <p>You must specify either a <code>SnapshotId</code> or a <code>VolumeSize</code>. If you specify both <code>SnapshotId</code> and <code>VolumeSize</code>, the volume size must be equal or greater than the size of the snapshot.</p>\"\
        },\
        \"VolumeType\":{\
          \"shape\":\"BlockDeviceEbsVolumeType\",\
          \"documentation\":\"<p>The volume type. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumeTypes.html\\\">Amazon EBS volume types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>Valid values: <code>standard</code> | <code>io1</code> | <code>gp2</code> | <code>st1</code> | <code>sc1</code> | <code>gp3</code> </p>\"\
        },\
        \"DeleteOnTermination\":{\
          \"shape\":\"BlockDeviceEbsDeleteOnTermination\",\
          \"documentation\":\"<p>Indicates whether the volume is deleted on instance termination. For Amazon EC2 Auto Scaling, the default value is <code>true</code>.</p>\"\
        },\
        \"Iops\":{\
          \"shape\":\"BlockDeviceEbsIops\",\
          \"documentation\":\"<p>The number of input/output (I/O) operations per second (IOPS) to provision for the volume. For <code>gp3</code> and <code>io1</code> volumes, this represents the number of IOPS that are provisioned for the volume. For <code>gp2</code> volumes, this represents the baseline performance of the volume and the rate at which the volume accumulates I/O credits for bursting. </p> <p>The following are the supported values for each volume type: </p> <ul> <li> <p> <code>gp3</code>: 3,000-16,000 IOPS</p> </li> <li> <p> <code>io1</code>: 100-64,000 IOPS</p> </li> </ul> <p>For <code>io1</code> volumes, we guarantee 64,000 IOPS only for <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances\\\">Instances built on the Nitro System</a>. Other instance families guarantee performance up to 32,000 IOPS. </p> <p> <code>Iops</code> is supported when the volume type is <code>gp3</code> or <code>io1</code> and required only when the volume type is <code>io1</code>. (Not used with <code>standard</code>, <code>gp2</code>, <code>st1</code>, or <code>sc1</code> volumes.) </p>\"\
        },\
        \"Encrypted\":{\
          \"shape\":\"BlockDeviceEbsEncrypted\",\
          \"documentation\":\"<p>Specifies whether the volume should be encrypted. Encrypted EBS volumes can only be attached to instances that support Amazon EBS encryption. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances\\\">Supported instance types</a>. If your AMI uses encrypted volumes, you can also only launch it on supported instance types.</p> <note> <p>If you are creating a volume from a snapshot, you cannot create an unencrypted volume from an encrypted snapshot. Also, you cannot specify a KMS key ID when using a launch configuration.</p> <p>If you enable encryption by default, the EBS volumes that you create are always encrypted, either using the Amazon Web Services managed KMS key or a customer-managed KMS key, regardless of whether the snapshot was encrypted. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-data-protection.html#encryption\\\">Use Amazon Web Services KMS keys to encrypt Amazon EBS volumes</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> </note>\"\
        },\
        \"Throughput\":{\
          \"shape\":\"BlockDeviceEbsThroughput\",\
          \"documentation\":\"<p>The throughput (MiBps) to provision for a <code>gp3</code> volume.</p>\"\
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
          \"documentation\":\"<p>Identifies the metrics to enable.</p> <p>You can specify one or more of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> <li> <p> <code>WarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>WarmPoolWarmedCapacity</code> </p> </li> <li> <p> <code>WarmPoolPendingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTerminatingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTotalCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolTotalCapacity</code> </p> </li> </ul> <p>If you specify <code>Granularity</code> and don't specify any metrics, all metrics are enabled.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html#as-group-metrics\\\">Auto Scaling group metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"Granularity\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The frequency at which Amazon EC2 Auto Scaling sends aggregated data to CloudWatch. The only valid value is <code>1Minute</code>.</p>\"\
        }\
      }\
    },\
    \"EnabledMetric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> <li> <p> <code>WarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>WarmPoolWarmedCapacity</code> </p> </li> <li> <p> <code>WarmPoolPendingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTerminatingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTotalCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolTotalCapacity</code> </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html#as-group-metrics\\\">Auto Scaling group metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"Granularity\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The granularity of the metric. The only valid value is <code>1Minute</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an enabled Auto Scaling group metric.</p>\"\
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
    \"ExcludedInstance\":{\
      \"type\":\"string\",\
      \"max\":30,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9\\\\.\\\\*]+\"\
    },\
    \"ExcludedInstanceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExcludedInstance\"},\
      \"max\":400\
    },\
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
          \"documentation\":\"<p>The name of the filter.</p> <p>The valid values for <code>Name</code> depend on which API operation you're using with the filter (<a>DescribeAutoScalingGroups</a> or <a>DescribeTags</a>).</p> <p> <b>DescribeAutoScalingGroups</b> </p> <p>Valid values for <code>Name</code> include the following: </p> <ul> <li> <p> <code>tag-key</code> - Accepts tag keys. The results only include information about the Auto Scaling groups associated with these tag keys. </p> </li> <li> <p> <code>tag-value</code> - Accepts tag values. The results only include information about the Auto Scaling groups associated with these tag values. </p> </li> <li> <p> <code>tag:&lt;key&gt;</code> - Accepts the key/value combination of the tag. Use the tag key in the filter name and the tag value as the filter value. The results only include information about the Auto Scaling groups associated with the specified key/value combination. </p> </li> </ul> <p> <b>DescribeTags</b> </p> <p>Valid values for <code>Name</code> include the following: </p> <ul> <li> <p> <code>auto-scaling-group</code> - Accepts the names of Auto Scaling groups. The results only include information about the tags associated with these Auto Scaling groups. </p> </li> <li> <p> <code>key</code> - Accepts tag keys. The results only include information about the tags associated with these tag keys. </p> </li> <li> <p> <code>value</code> - Accepts tag values. The results only include information about the tags associated with these tag values. </p> </li> <li> <p> <code>propagate-at-launch</code> - Accepts a Boolean value, which specifies whether tags propagate to instances at launch. The results only include information about the tags associated with the specified Boolean value. </p> </li> </ul>\"\
        },\
        \"Values\":{\
          \"shape\":\"Values\",\
          \"documentation\":\"<p>One or more filter values. Filter values are case-sensitive. </p> <p>If you specify multiple values for a filter, the values are automatically logically joined with an <code>OR</code>, and the request returns all results that match any of the specified values. For example, specify \\\"tag:environment\\\" for the filter name and \\\"production,development\\\" for the filter values to find Auto Scaling groups with the tag \\\"environment=production\\\" or \\\"environment=development\\\".</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a filter that is used to return a more specific list of results from a describe operation.</p> <p>If you specify multiple filters, the filters are automatically logically joined with an <code>AND</code>, and the request returns only the results that match all of the specified filters. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html\\\">Tag Auto Scaling groups and instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"Filters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Filter\"}\
    },\
    \"ForceDelete\":{\"type\":\"boolean\"},\
    \"GetPredictiveScalingForecastAnswer\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LoadForecast\",\
        \"CapacityForecast\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"LoadForecast\":{\
          \"shape\":\"LoadForecasts\",\
          \"documentation\":\"<p>The load forecast.</p>\"\
        },\
        \"CapacityForecast\":{\
          \"shape\":\"CapacityForecast\",\
          \"documentation\":\"<p>The capacity forecast.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The time the forecast was made.</p>\"\
        }\
      }\
    },\
    \"GetPredictiveScalingForecastType\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AutoScalingGroupName\",\
        \"PolicyName\",\
        \"StartTime\",\
        \"EndTime\"\
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
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The inclusive start time of the time range for the forecast data to get. At most, the date and time can be one year before the current date and time.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The exclusive end time of the time range for the forecast data to get. The maximum time duration between the start and end time is 30 days. </p> <p>Although this parameter can accept a date and time that is more than two days in the future, the availability of forecast data has limits. Amazon EC2 Auto Scaling only issues forecasts for periods of two days in advance.</p>\"\
        }\
      }\
    },\
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
          \"documentation\":\"<p>The last reported health status of the instance. <code>Healthy</code> means that the instance is healthy and should remain in service. <code>Unhealthy</code> means that the instance is unhealthy and that Amazon EC2 Auto Scaling should terminate and replace it.</p>\"\
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
    \"InstanceGeneration\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"current\",\
        \"previous\"\
      ]\
    },\
    \"InstanceGenerations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceGeneration\"}\
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
          \"documentation\":\"<p>The current status for the instance refresh operation:</p> <ul> <li> <p> <code>Pending</code> - The request was created, but the instance refresh has not started.</p> </li> <li> <p> <code>InProgress</code> - An instance refresh is in progress.</p> </li> <li> <p> <code>Successful</code> - An instance refresh completed successfully.</p> </li> <li> <p> <code>Failed</code> - An instance refresh failed to complete. You can troubleshoot using the status reason and the scaling activities. </p> </li> <li> <p> <code>Cancelling</code> - An ongoing instance refresh is being cancelled.</p> </li> <li> <p> <code>Cancelled</code> - The instance refresh is cancelled. </p> </li> <li> <p> <code>RollbackInProgress</code> - An instance refresh is being rolled back.</p> </li> <li> <p> <code>RollbackFailed</code> - The rollback failed to complete. You can troubleshoot using the status reason and the scaling activities.</p> </li> <li> <p> <code>RollbackSuccessful</code> - The rollback completed successfully.</p> </li> </ul>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>The explanation for the specific status assigned to this operation.</p>\"\
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
          \"documentation\":\"<p>The percentage of the instance refresh that is complete. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and is added to the percentage complete.</p> <note> <p> <code>PercentageComplete</code> does not include instances that are replaced during a rollback. This value gradually goes back down to zero during a rollback.</p> </note>\"\
        },\
        \"InstancesToUpdate\":{\
          \"shape\":\"InstancesToUpdate\",\
          \"documentation\":\"<p>The number of instances remaining to update before the instance refresh is complete.</p> <note> <p>If you roll back the instance refresh, <code>InstancesToUpdate</code> shows you the number of instances that were not yet updated by the instance refresh. Therefore, these instances don't need to be replaced as part of the rollback.</p> </note>\"\
        },\
        \"ProgressDetails\":{\
          \"shape\":\"InstanceRefreshProgressDetails\",\
          \"documentation\":\"<p>Additional progress details for an Auto Scaling group that has a warm pool.</p>\"\
        },\
        \"Preferences\":{\
          \"shape\":\"RefreshPreferences\",\
          \"documentation\":\"<p>The preferences for an instance refresh.</p>\"\
        },\
        \"DesiredConfiguration\":{\
          \"shape\":\"DesiredConfiguration\",\
          \"documentation\":\"<p>Describes the desired configuration for the instance refresh.</p>\"\
        },\
        \"RollbackDetails\":{\
          \"shape\":\"RollbackDetails\",\
          \"documentation\":\"<p>The rollback details.</p>\"\
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
      \"documentation\":\"<p>The request failed because an active instance refresh already exists for the specified Auto Scaling group.</p>\",\
      \"error\":{\
        \"code\":\"InstanceRefreshInProgress\",\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"InstanceRefreshLivePoolProgress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PercentageComplete\":{\
          \"shape\":\"IntPercent\",\
          \"documentation\":\"<p>The percentage of instances in the Auto Scaling group that have been replaced. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and is added to the percentage complete.</p>\"\
        },\
        \"InstancesToUpdate\":{\
          \"shape\":\"InstancesToUpdate\",\
          \"documentation\":\"<p>The number of instances remaining to update.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reports progress on replacing instances that are in the Auto Scaling group.</p>\"\
    },\
    \"InstanceRefreshProgressDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LivePoolProgress\":{\
          \"shape\":\"InstanceRefreshLivePoolProgress\",\
          \"documentation\":\"<p>Reports progress on replacing instances that are in the Auto Scaling group.</p>\"\
        },\
        \"WarmPoolProgress\":{\
          \"shape\":\"InstanceRefreshWarmPoolProgress\",\
          \"documentation\":\"<p>Reports progress on replacing instances that are in the warm pool.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reports progress on replacing instances in an Auto Scaling group that has a warm pool. This includes separate details for instances in the warm pool and instances in the Auto Scaling group (the live pool).</p>\"\
    },\
    \"InstanceRefreshStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Pending\",\
        \"InProgress\",\
        \"Successful\",\
        \"Failed\",\
        \"Cancelling\",\
        \"Cancelled\",\
        \"RollbackInProgress\",\
        \"RollbackFailed\",\
        \"RollbackSuccessful\"\
      ]\
    },\
    \"InstanceRefreshWarmPoolProgress\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PercentageComplete\":{\
          \"shape\":\"IntPercent\",\
          \"documentation\":\"<p>The percentage of instances in the warm pool that have been replaced. For each instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the instance's health status changes to healthy and the specified warm-up time passes, the instance is considered updated and is added to the percentage complete.</p>\"\
        },\
        \"InstancesToUpdate\":{\
          \"shape\":\"InstancesToUpdate\",\
          \"documentation\":\"<p>The number of instances remaining to update.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reports progress on replacing instances that are in the warm pool.</p>\"\
    },\
    \"InstanceRefreshes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceRefresh\"}\
    },\
    \"InstanceRequirements\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VCpuCount\",\
        \"MemoryMiB\"\
      ],\
      \"members\":{\
        \"VCpuCount\":{\
          \"shape\":\"VCpuCountRequest\",\
          \"documentation\":\"<p>The minimum and maximum number of vCPUs for an instance type.</p>\"\
        },\
        \"MemoryMiB\":{\
          \"shape\":\"MemoryMiBRequest\",\
          \"documentation\":\"<p>The minimum and maximum instance memory size for an instance type, in MiB.</p>\"\
        },\
        \"CpuManufacturers\":{\
          \"shape\":\"CpuManufacturers\",\
          \"documentation\":\"<p>Lists which specific CPU manufacturers to include.</p> <ul> <li> <p>For instance types with Intel CPUs, specify <code>intel</code>.</p> </li> <li> <p>For instance types with AMD CPUs, specify <code>amd</code>.</p> </li> <li> <p>For instance types with Amazon Web Services CPUs, specify <code>amazon-web-services</code>.</p> </li> </ul> <note> <p>Don't confuse the CPU hardware manufacturer with the CPU hardware architecture. Instances will be launched with a compatible CPU architecture based on the Amazon Machine Image (AMI) that you specify in your launch template. </p> </note> <p>Default: Any manufacturer</p>\"\
        },\
        \"MemoryGiBPerVCpu\":{\
          \"shape\":\"MemoryGiBPerVCpuRequest\",\
          \"documentation\":\"<p>The minimum and maximum amount of memory per vCPU for an instance type, in GiB.</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"ExcludedInstanceTypes\":{\
          \"shape\":\"ExcludedInstanceTypes\",\
          \"documentation\":\"<p>The instance types to exclude. You can use strings with one or more wild cards, represented by an asterisk (<code>*</code>), to exclude an instance family, type, size, or generation. The following are examples: <code>m5.8xlarge</code>, <code>c5*.*</code>, <code>m5a.*</code>, <code>r*</code>, <code>*3*</code>. </p> <p>For example, if you specify <code>c5*</code>, you are excluding the entire C5 instance family, which includes all C5a and C5n instance types. If you specify <code>m5a.*</code>, Amazon EC2 Auto Scaling will exclude all the M5a instance types, but not the M5n instance types.</p> <note> <p>If you specify <code>ExcludedInstanceTypes</code>, you can't specify <code>AllowedInstanceTypes</code>.</p> </note> <p>Default: No excluded instance types</p>\"\
        },\
        \"InstanceGenerations\":{\
          \"shape\":\"InstanceGenerations\",\
          \"documentation\":\"<p>Indicates whether current or previous generation instance types are included.</p> <ul> <li> <p>For current generation instance types, specify <code>current</code>. The current generation includes EC2 instance types currently recommended for use. This typically includes the latest two to three generations in each instance family. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> </li> <li> <p>For previous generation instance types, specify <code>previous</code>.</p> </li> </ul> <p>Default: Any current or previous generation</p>\"\
        },\
        \"SpotMaxPricePercentageOverLowestPrice\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The price protection threshold for Spot Instances. This is the maximum youâll pay for a Spot Instance, expressed as a percentage higher than the least expensive current generation M, C, or R instance type with your specified attributes. When Amazon EC2 Auto Scaling selects instance types with your attributes, we will exclude instance types whose price is higher than your threshold. The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a percentage. To turn off price protection, specify a high value, such as <code>999999</code>. </p> <p>If you set <code>DesiredCapacityType</code> to <code>vcpu</code> or <code>memory-mib</code>, the price protection threshold is applied based on the per vCPU or per memory price instead of the per instance price. </p> <p>Default: <code>100</code> </p>\"\
        },\
        \"OnDemandMaxPricePercentageOverLowestPrice\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The price protection threshold for On-Demand Instances. This is the maximum youâll pay for an On-Demand Instance, expressed as a percentage higher than the least expensive current generation M, C, or R instance type with your specified attributes. When Amazon EC2 Auto Scaling selects instance types with your attributes, we will exclude instance types whose price is higher than your threshold. The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a percentage. To turn off price protection, specify a high value, such as <code>999999</code>. </p> <p>If you set <code>DesiredCapacityType</code> to <code>vcpu</code> or <code>memory-mib</code>, the price protection threshold is applied based on the per vCPU or per memory price instead of the per instance price. </p> <p>Default: <code>20</code> </p>\"\
        },\
        \"BareMetal\":{\
          \"shape\":\"BareMetal\",\
          \"documentation\":\"<p>Indicates whether bare metal instance types are included, excluded, or required.</p> <p>Default: <code>excluded</code> </p>\"\
        },\
        \"BurstablePerformance\":{\
          \"shape\":\"BurstablePerformance\",\
          \"documentation\":\"<p>Indicates whether burstable performance instance types are included, excluded, or required. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html\\\">Burstable performance instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>Default: <code>excluded</code> </p>\"\
        },\
        \"RequireHibernateSupport\":{\
          \"shape\":\"NullableBoolean\",\
          \"documentation\":\"<p>Indicates whether instance types must provide On-Demand Instance hibernation support.</p> <p>Default: <code>false</code> </p>\"\
        },\
        \"NetworkInterfaceCount\":{\
          \"shape\":\"NetworkInterfaceCountRequest\",\
          \"documentation\":\"<p>The minimum and maximum number of network interfaces for an instance type.</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"LocalStorage\":{\
          \"shape\":\"LocalStorage\",\
          \"documentation\":\"<p>Indicates whether instance types with instance store volumes are included, excluded, or required. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html\\\">Amazon EC2 instance store</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>Default: <code>included</code> </p>\"\
        },\
        \"LocalStorageTypes\":{\
          \"shape\":\"LocalStorageTypes\",\
          \"documentation\":\"<p>Indicates the type of local storage that is required.</p> <ul> <li> <p>For instance types with hard disk drive (HDD) storage, specify <code>hdd</code>.</p> </li> <li> <p>For instance types with solid state drive (SSD) storage, specify <code>ssd</code>.</p> </li> </ul> <p>Default: Any local storage type</p>\"\
        },\
        \"TotalLocalStorageGB\":{\
          \"shape\":\"TotalLocalStorageGBRequest\",\
          \"documentation\":\"<p>The minimum and maximum total local storage size for an instance type, in GB.</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"BaselineEbsBandwidthMbps\":{\
          \"shape\":\"BaselineEbsBandwidthMbpsRequest\",\
          \"documentation\":\"<p>The minimum and maximum baseline bandwidth performance for an instance type, in Mbps. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html\\\">Amazon EBSâoptimized instances</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"AcceleratorTypes\":{\
          \"shape\":\"AcceleratorTypes\",\
          \"documentation\":\"<p>Lists the accelerator types that must be on an instance type.</p> <ul> <li> <p>For instance types with GPU accelerators, specify <code>gpu</code>.</p> </li> <li> <p>For instance types with FPGA accelerators, specify <code>fpga</code>.</p> </li> <li> <p>For instance types with inference accelerators, specify <code>inference</code>.</p> </li> </ul> <p>Default: Any accelerator type</p>\"\
        },\
        \"AcceleratorCount\":{\
          \"shape\":\"AcceleratorCountRequest\",\
          \"documentation\":\"<p>The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services Inferentia chips) for an instance type.</p> <p>To exclude accelerator-enabled instance types, set <code>Max</code> to <code>0</code>.</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"AcceleratorManufacturers\":{\
          \"shape\":\"AcceleratorManufacturers\",\
          \"documentation\":\"<p>Indicates whether instance types must have accelerators by specific manufacturers.</p> <ul> <li> <p>For instance types with NVIDIA devices, specify <code>nvidia</code>.</p> </li> <li> <p>For instance types with AMD devices, specify <code>amd</code>.</p> </li> <li> <p>For instance types with Amazon Web Services devices, specify <code>amazon-web-services</code>.</p> </li> <li> <p>For instance types with Xilinx devices, specify <code>xilinx</code>.</p> </li> </ul> <p>Default: Any manufacturer</p>\"\
        },\
        \"AcceleratorNames\":{\
          \"shape\":\"AcceleratorNames\",\
          \"documentation\":\"<p>Lists the accelerators that must be on an instance type.</p> <ul> <li> <p>For instance types with NVIDIA A100 GPUs, specify <code>a100</code>.</p> </li> <li> <p>For instance types with NVIDIA V100 GPUs, specify <code>v100</code>.</p> </li> <li> <p>For instance types with NVIDIA K80 GPUs, specify <code>k80</code>.</p> </li> <li> <p>For instance types with NVIDIA T4 GPUs, specify <code>t4</code>.</p> </li> <li> <p>For instance types with NVIDIA M60 GPUs, specify <code>m60</code>.</p> </li> <li> <p>For instance types with AMD Radeon Pro V520 GPUs, specify <code>radeon-pro-v520</code>.</p> </li> <li> <p>For instance types with Xilinx VU9P FPGAs, specify <code>vu9p</code>.</p> </li> </ul> <p>Default: Any accelerator</p>\"\
        },\
        \"AcceleratorTotalMemoryMiB\":{\
          \"shape\":\"AcceleratorTotalMemoryMiBRequest\",\
          \"documentation\":\"<p>The minimum and maximum total memory size for the accelerators on an instance type, in MiB.</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"NetworkBandwidthGbps\":{\
          \"shape\":\"NetworkBandwidthGbpsRequest\",\
          \"documentation\":\"<p>The minimum and maximum amount of network bandwidth, in gigabits per second (Gbps).</p> <p>Default: No minimum or maximum limits</p>\"\
        },\
        \"AllowedInstanceTypes\":{\
          \"shape\":\"AllowedInstanceTypes\",\
          \"documentation\":\"<p>The instance types to apply your specified attributes against. All other instance types are ignored, even if they match your specified attributes.</p> <p>You can use strings with one or more wild cards, represented by an asterisk (<code>*</code>), to allow an instance type, size, or generation. The following are examples: <code>m5.8xlarge</code>, <code>c5*.*</code>, <code>m5a.*</code>, <code>r*</code>, <code>*3*</code>.</p> <p>For example, if you specify <code>c5*</code>, Amazon EC2 Auto Scaling will allow the entire C5 instance family, which includes all C5a and C5n instance types. If you specify <code>m5a.*</code>, Amazon EC2 Auto Scaling will allow all the M5a instance types, but not the M5n instance types.</p> <note> <p>If you specify <code>AllowedInstanceTypes</code>, you can't specify <code>ExcludedInstanceTypes</code>.</p> </note> <p>Default: All instance types</p>\"\
        }\
      },\
      \"documentation\":\"<p>The attributes for the instance types for a mixed instances policy. Amazon EC2 Auto Scaling uses your specified requirements to identify instance types. Then, it uses your On-Demand and Spot allocation strategies to launch instances from these instance types.</p> <p>When you specify multiple attributes, you get instance types that satisfy all of the specified attributes. If you specify multiple values for an attribute, you get instance types that satisfy any of the specified values.</p> <p>To limit the list of instance types from which Amazon EC2 Auto Scaling can identify matching instance types, you can use one of the following parameters, but not both in the same request:</p> <ul> <li> <p> <code>AllowedInstanceTypes</code> - The instance types to include in the list. All other instance types are ignored, even if they match your specified attributes.</p> </li> <li> <p> <code>ExcludedInstanceTypes</code> - The instance types to exclude from the list, even if they match your specified attributes.</p> </li> </ul> <note> <p>You must specify <code>VCpuCount</code> and <code>MemoryMiB</code>. All other attributes are optional. Any unspecified optional attribute is set to its default.</p> </note> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html\\\">Creating an Auto Scaling group using attribute-based instance type selection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. For help determining which instance types match your attributes before you apply them to your Auto Scaling group, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html#ec2fleet-get-instance-types-from-instance-requirements\\\">Preview instance types with specified attributes</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
    },\
    \"InstanceReusePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReuseOnScaleIn\":{\
          \"shape\":\"ReuseOnScaleIn\",\
          \"documentation\":\"<p>Specifies whether instances in the Auto Scaling group can be returned to the warm pool on scale in. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an instance reuse policy for a warm pool. </p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html\\\">Warm pools for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
          \"documentation\":\"<p>The allocation strategy to apply to your On-Demand Instances when they are launched. Possible instance types are determined by the launch template overrides that you specify.</p> <p>The following lists the valid values:</p> <dl> <dt>lowest-price</dt> <dd> <p>Uses price to determine which instance types are the highest priority, launching the lowest priced instance types within an Availability Zone first. This is the default value for Auto Scaling groups that specify <a>InstanceRequirements</a>. </p> </dd> <dt>prioritized</dt> <dd> <p>You set the order of instance types for the launch template overrides from highest to lowest priority (from first to last in the list). Amazon EC2 Auto Scaling launches your highest priority instance types first. If all your On-Demand capacity cannot be fulfilled using your highest priority instance type, then Amazon EC2 Auto Scaling launches the remaining capacity using the second priority instance type, and so on. This is the default value for Auto Scaling groups that don't specify <a>InstanceRequirements</a> and cannot be used for groups that do.</p> </dd> </dl>\"\
        },\
        \"OnDemandBaseCapacity\":{\
          \"shape\":\"OnDemandBaseCapacity\",\
          \"documentation\":\"<p>The minimum amount of the Auto Scaling group's capacity that must be fulfilled by On-Demand Instances. This base portion is launched first as your group scales.</p> <p>This number has the same unit of measurement as the group's desired capacity. If you change the default unit of measurement (number of instances) by specifying weighted capacity values in your launch template overrides list, or by changing the default desired capacity type setting of the group, you must specify this number using the same unit of measurement.</p> <p>Default: 0</p>\"\
        },\
        \"OnDemandPercentageAboveBaseCapacity\":{\
          \"shape\":\"OnDemandPercentageAboveBaseCapacity\",\
          \"documentation\":\"<p>Controls the percentages of On-Demand Instances and Spot Instances for your additional capacity beyond <code>OnDemandBaseCapacity</code>. Expressed as a number (for example, 20 specifies 20% On-Demand Instances, 80% Spot Instances). If set to 100, only On-Demand Instances are used.</p> <p>Default: 100</p>\"\
        },\
        \"SpotAllocationStrategy\":{\
          \"shape\":\"XmlString\",\
          \"documentation\":\"<p>The allocation strategy to apply to your Spot Instances when they are launched. Possible instance types are determined by the launch template overrides that you specify.</p> <p>The following lists the valid values:</p> <dl> <dt>capacity-optimized</dt> <dd> <p>Requests Spot Instances using pools that are optimally chosen based on the available Spot capacity. This strategy has the lowest risk of interruption. To give certain instance types a higher chance of launching first, use <code>capacity-optimized-prioritized</code>.</p> </dd> <dt>capacity-optimized-prioritized</dt> <dd> <p>You set the order of instance types for the launch template overrides from highest to lowest priority (from first to last in the list). Amazon EC2 Auto Scaling honors the instance type priorities on a best effort basis but optimizes for capacity first. Note that if the On-Demand allocation strategy is set to <code>prioritized</code>, the same priority is applied when fulfilling On-Demand capacity. This is not a valid value for Auto Scaling groups that specify <a>InstanceRequirements</a>.</p> </dd> <dt>lowest-price</dt> <dd> <p>Requests Spot Instances using the lowest priced pools within an Availability Zone, across the number of Spot pools that you specify for the <code>SpotInstancePools</code> property. To ensure that your desired capacity is met, you might receive Spot Instances from several pools. This is the default value, but it might lead to high interruption rates because this strategy only considers instance price and not available capacity.</p> </dd> <dt>price-capacity-optimized (recommended)</dt> <dd> <p>The price and capacity optimized allocation strategy looks at both price and capacity to select the Spot Instance pools that are the least likely to be interrupted and have the lowest possible price.</p> </dd> </dl>\"\
        },\
        \"SpotInstancePools\":{\
          \"shape\":\"SpotInstancePools\",\
          \"documentation\":\"<p>The number of Spot Instance pools across which to allocate your Spot Instances. The Spot pools are determined from the different instance types in the overrides. Valid only when the <code>SpotAllocationStrategy</code> is <code>lowest-price</code>. Value must be in the range of 1â20.</p> <p>Default: 2</p>\"\
        },\
        \"SpotMaxPrice\":{\
          \"shape\":\"MixedInstanceSpotPrice\",\
          \"documentation\":\"<p>The maximum price per unit hour that you are willing to pay for a Spot Instance. If your maximum price is lower than the Spot price for the instance types that you selected, your Spot Instances are not launched. We do not recommend specifying a maximum price because it can lead to increased interruptions. When Spot Instances launch, you pay the current Spot price. To remove a maximum price that you previously set, include the property but specify an empty string (\\\"\\\") for the value.</p> <important> <p>If you specify a maximum price, your instances will be interrupted more frequently than if you do not specify one.</p> </important> <p>Valid Range: Minimum value of 0.001</p>\"\
        }\
      },\
      \"documentation\":\"<p>Use this structure to specify the distribution of On-Demand Instances and Spot Instances and the allocation strategies used to fulfill On-Demand and Spot capacities for a mixed instances policy.</p>\"\
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
    \"IrreversibleInstanceRefreshFault\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"XmlStringMaxLen255\"}\
      },\
      \"documentation\":\"<p>The request failed because a desired configuration was not found or an incompatible launch template (uses a Systems Manager parameter instead of an AMI ID) or launch template version (<code>$Latest</code> or <code>$Default</code>) is present on the Auto Scaling group.</p>\",\
      \"error\":{\
        \"code\":\"IrreversibleInstanceRefresh\",\
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
          \"documentation\":\"<p>The ID of the Amazon Machine Image (AMI) to use to launch your EC2 instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html\\\">Find a Linux AMI</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
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
          \"documentation\":\"<p>Available for backward compatibility.</p>\"\
        },\
        \"ClassicLinkVPCSecurityGroups\":{\
          \"shape\":\"ClassicLinkVPCSecurityGroups\",\
          \"documentation\":\"<p>Available for backward compatibility.</p>\"\
        },\
        \"UserData\":{\
          \"shape\":\"XmlStringUserData\",\
          \"documentation\":\"<p>The user data to make available to the launched EC2 instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Linux) and <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html\\\">Instance metadata and user data</a> (Windows). If you are using a command line tool, base64-encoding is performed for you, and you can load the text from a file. Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.</p>\"\
        },\
        \"InstanceType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance type for the instances. For information about available instance types, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes\\\">Available instance types</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
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
          \"documentation\":\"<p>The block device mapping entries that define the block devices to attach to the instances at launch. By default, the block devices specified in the block device mapping for the AMI are used. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html\\\">Block Device Mapping</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p>\"\
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
          \"documentation\":\"<p>Specifies whether to assign a public IPv4 address to the group's instances. If the instance is launched into a default subnet, the default is to assign a public IPv4 address, unless you disabled the option to assign a public IPv4 address on the subnet. If the instance is launched into a nondefault subnet, the default is not to assign a public IPv4 address, unless you enabled the option to assign a public IPv4 address on the subnet. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html\\\">Launching Auto Scaling instances in a VPC</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
          \"documentation\":\"<p>The launch configuration names. If you omit this property, all launch configurations are described.</p> <p>Array Members: Maximum number of 50 items.</p>\"\
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
          \"documentation\":\"<p>The launch template.</p>\"\
        },\
        \"Overrides\":{\
          \"shape\":\"Overrides\",\
          \"documentation\":\"<p>Any properties that you specify override the same properties in the launch template.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Use this structure to specify the launch templates and instance types (overrides) for a mixed instances policy.</p>\"\
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
          \"documentation\":\"<p>The instance type, such as <code>m3.xlarge</code>. You must specify an instance type that is supported in your requested Region and Availability Zones. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html\\\">Instance types</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.</p> <p>You can specify up to 40 instance types per Auto Scaling group.</p>\"\
        },\
        \"WeightedCapacity\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>If you provide a list of instance types to use, you can specify the number of capacity units provided by each instance type in terms of virtual CPUs, memory, storage, throughput, or other relative performance characteristic. When a Spot or On-Demand Instance is launched, the capacity units count toward the desired capacity. Amazon EC2 Auto Scaling launches instances until the desired capacity is totally fulfilled, even if this results in an overage. For example, if there are two units remaining to fulfill capacity, and Amazon EC2 Auto Scaling can only launch an instance with a <code>WeightedCapacity</code> of five units, the instance is launched, and the desired capacity is exceeded by three units. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups-instance-weighting.html\\\">Configuring instance weighting for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. Value must be in the range of 1â999.</p> <p>If you specify a value for <code>WeightedCapacity</code> for one instance type, you must specify a value for <code>WeightedCapacity</code> for all of them.</p> <important> <p>Every Auto Scaling group has three size parameters (<code>DesiredCapacity</code>, <code>MaxSize</code>, and <code>MinSize</code>). Usually, you set these sizes based on a specific number of instances. However, if you configure a mixed instances policy that defines weights for the instance types, you must specify these sizes with the same units that you use for weighting instances. </p> </important>\"\
        },\
        \"LaunchTemplateSpecification\":{\
          \"shape\":\"LaunchTemplateSpecification\",\
          \"documentation\":\"<p>Provides a launch template for the specified instance type or set of instance requirements. For example, some instance types might require a launch template with a different AMI. If not provided, Amazon EC2 Auto Scaling uses the launch template that's specified in the <code>LaunchTemplate</code> definition. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups-launch-template-overrides.html\\\">Specifying a different launch template for an instance type</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>. </p> <p>You can specify up to 20 launch templates per Auto Scaling group. The launch templates specified in the overrides and in the <code>LaunchTemplate</code> definition count towards this limit.</p>\"\
        },\
        \"InstanceRequirements\":{\
          \"shape\":\"InstanceRequirements\",\
          \"documentation\":\"<p>The instance requirements. Amazon EC2 Auto Scaling uses your specified requirements to identify instance types. Then, it uses your On-Demand and Spot allocation strategies to launch instances from these instance types.</p> <p>You can specify up to four separate sets of instance requirements per Auto Scaling group. This is useful for provisioning instances from different Amazon Machine Images (AMIs) in the same Auto Scaling group. To do this, create the AMIs and create a new launch template for each AMI. Then, create a compatible set of instance requirements for each launch template. </p> <note> <p>If you specify <code>InstanceRequirements</code>, you can't specify <code>InstanceType</code>.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Use this structure to let Amazon EC2 Auto Scaling do the following when the Auto Scaling group has a mixed instances policy:</p> <ul> <li> <p>Override the instance type that is specified in the launch template.</p> </li> <li> <p>Use multiple instance types.</p> </li> </ul> <p>Specify the instance types that you want, or define your instance requirements instead and let Amazon EC2 Auto Scaling provision the available instance types that meet your requirements. This can provide Amazon EC2 Auto Scaling with a larger selection of instance types to choose from when fulfilling Spot and On-Demand capacities. You can view which instance types are matched before you apply the instance requirements to your Auto Scaling group.</p> <p>After you define your instance requirements, you don't have to keep updating these settings to get new EC2 instance types automatically. Amazon EC2 Auto Scaling uses the instance requirements of the Auto Scaling group to determine whether a new EC2 instance type can be used.</p>\"\
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
      \"documentation\":\"<p>Describes the launch template and the version of the launch template that Amazon EC2 Auto Scaling uses to launch Amazon EC2 instances. For more information about launch templates, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchTemplates.html\\\">Launch templates</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
          \"documentation\":\"<p>The lifecycle transition.</p> <p>Valid values: <code>autoscaling:EC2_INSTANCE_LAUNCHING</code> | <code>autoscaling:EC2_INSTANCE_TERMINATING</code> </p>\"\
        },\
        \"NotificationTargetARN\":{\
          \"shape\":\"NotificationTargetResourceName\",\
          \"documentation\":\"<p>The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an instance is in a wait state for the lifecycle hook.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target (an Amazon SNS topic or an Amazon SQS queue).</p>\"\
        },\
        \"NotificationMetadata\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Additional information that is included any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>\"\
        },\
        \"HeartbeatTimeout\":{\
          \"shape\":\"HeartbeatTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. If the lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified in the <code>DefaultResult</code> property.</p>\"\
        },\
        \"GlobalTimeout\":{\
          \"shape\":\"GlobalTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that an instance can remain in a wait state. The maximum is 172800 seconds (48 hours) or 100 times <code>HeartbeatTimeout</code>, whichever is smaller.</p>\"\
        },\
        \"DefaultResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an unexpected failure occurs.</p> <p>Valid values: <code>CONTINUE</code> | <code>ABANDON</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a lifecycle hook. A lifecycle hook lets you create solutions that are aware of events in the Auto Scaling instance lifecycle, and then perform a custom action on instances when the corresponding lifecycle event occurs.</p>\"\
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
          \"documentation\":\"<p>The lifecycle transition. For Auto Scaling groups, there are two major lifecycle transitions.</p> <ul> <li> <p>To create a lifecycle hook for scale-out events, specify <code>autoscaling:EC2_INSTANCE_LAUNCHING</code>.</p> </li> <li> <p>To create a lifecycle hook for scale-in events, specify <code>autoscaling:EC2_INSTANCE_TERMINATING</code>.</p> </li> </ul>\"\
        },\
        \"NotificationMetadata\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>\"\
        },\
        \"HeartbeatTimeout\":{\
          \"shape\":\"HeartbeatTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. The range is from <code>30</code> to <code>7200</code> seconds. The default value is <code>3600</code> seconds (1 hour).</p>\"\
        },\
        \"DefaultResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an unexpected failure occurs. The default value is <code>ABANDON</code>.</p> <p>Valid values: <code>CONTINUE</code> | <code>ABANDON</code> </p>\"\
        },\
        \"NotificationTargetARN\":{\
          \"shape\":\"NotificationTargetResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the notification target that Amazon EC2 Auto Scaling sends notifications to when an instance is in a wait state for the lifecycle hook. You can specify an Amazon SNS topic or an Amazon SQS queue.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target. For information about creating this role, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/prepare-for-lifecycle-notifications.html#lifecycle-hook-notification-target\\\">Configure a notification target for a lifecycle hook</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information used to specify a lifecycle hook for an Auto Scaling group.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html\\\">Amazon EC2 Auto Scaling lifecycle hooks</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
        \"Standby\",\
        \"Warmed:Pending\",\
        \"Warmed:Pending:Wait\",\
        \"Warmed:Pending:Proceed\",\
        \"Warmed:Terminating\",\
        \"Warmed:Terminating:Wait\",\
        \"Warmed:Terminating:Proceed\",\
        \"Warmed:Terminated\",\
        \"Warmed:Stopped\",\
        \"Warmed:Running\",\
        \"Warmed:Hibernated\"\
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
          \"documentation\":\"<p>One of the following load balancer states:</p> <ul> <li> <p> <code>Adding</code> - The Auto Scaling instances are being registered with the load balancer.</p> </li> <li> <p> <code>Added</code> - All Auto Scaling instances are registered with the load balancer.</p> </li> <li> <p> <code>InService</code> - At least one Auto Scaling instance passed an <code>ELB</code> health check.</p> </li> <li> <p> <code>Removing</code> - The Auto Scaling instances are being deregistered from the load balancer. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p> </li> <li> <p> <code>Removed</code> - All Auto Scaling instances are deregistered from the load balancer.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the state of a Classic Load Balancer.</p>\"\
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
          \"documentation\":\"<p>The state of the target group.</p> <ul> <li> <p> <code>Adding</code> - The Auto Scaling instances are being registered with the target group.</p> </li> <li> <p> <code>Added</code> - All Auto Scaling instances are registered with the target group.</p> </li> <li> <p> <code>InService</code> - At least one Auto Scaling instance passed an <code>ELB</code> health check.</p> </li> <li> <p> <code>Removing</code> - The Auto Scaling instances are being deregistered from the target group. If connection draining is enabled, Elastic Load Balancing waits for in-flight requests to complete before deregistering the instances.</p> </li> <li> <p> <code>Removed</code> - All Auto Scaling instances are deregistered from the target group.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the state of a target group.</p>\"\
    },\
    \"LoadBalancerTargetGroupStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadBalancerTargetGroupState\"}\
    },\
    \"LoadForecast\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Timestamps\",\
        \"Values\",\
        \"MetricSpecification\"\
      ],\
      \"members\":{\
        \"Timestamps\":{\
          \"shape\":\"PredictiveScalingForecastTimestamps\",\
          \"documentation\":\"<p>The timestamps for the data points, in UTC format.</p>\"\
        },\
        \"Values\":{\
          \"shape\":\"PredictiveScalingForecastValues\",\
          \"documentation\":\"<p>The values of the data points.</p>\"\
        },\
        \"MetricSpecification\":{\
          \"shape\":\"PredictiveScalingMetricSpecification\",\
          \"documentation\":\"<p>The metric specification for the load forecast.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A <code>GetPredictiveScalingForecast</code> call returns the load forecast for a predictive scaling policy. This structure includes the data points for that load forecast, along with the timestamps of those data points and the metric specification. </p>\"\
    },\
    \"LoadForecasts\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LoadForecast\"}\
    },\
    \"LocalStorage\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"included\",\
        \"excluded\",\
        \"required\"\
      ]\
    },\
    \"LocalStorageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"hdd\",\
        \"ssd\"\
      ]\
    },\
    \"LocalStorageTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LocalStorageType\"}\
    },\
    \"MaxGroupPreparedCapacity\":{\
      \"type\":\"integer\",\
      \"min\":-1\
    },\
    \"MaxInstanceLifetime\":{\"type\":\"integer\"},\
    \"MaxNumberOfAutoScalingGroups\":{\"type\":\"integer\"},\
    \"MaxNumberOfLaunchConfigurations\":{\"type\":\"integer\"},\
    \"MaxRecords\":{\"type\":\"integer\"},\
    \"MemoryGiBPerVCpuRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveDouble\",\
          \"documentation\":\"<p>The memory minimum in GiB.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveDouble\",\
          \"documentation\":\"<p>The memory maximum in GiB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>MemoryGiBPerVCpu</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
    \"MemoryMiBRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Min\"],\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The memory minimum in MiB.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The memory maximum in MiB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>MemoryMiB</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
    \"Metric\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Namespace\",\
        \"MetricName\"\
      ],\
      \"members\":{\
        \"Namespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>The namespace of the metric. For more information, see the table in <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html\\\">Amazon Web Services services that publish CloudWatch metrics </a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
        },\
        \"MetricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"MetricDimensions\",\
          \"documentation\":\"<p>The dimensions for the metric. For the list of available dimensions, see the Amazon Web Services documentation available from the table in <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html\\\">Amazon Web Services services that publish CloudWatch metrics </a> in the <i>Amazon CloudWatch User Guide</i>. </p> <p>Conditional: If you published your metric with dimensions, you must specify the same dimensions in your scaling policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a specific metric. </p>\"\
    },\
    \"MetricCollectionType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>One of the following metrics:</p> <ul> <li> <p> <code>GroupMinSize</code> </p> </li> <li> <p> <code>GroupMaxSize</code> </p> </li> <li> <p> <code>GroupDesiredCapacity</code> </p> </li> <li> <p> <code>GroupInServiceInstances</code> </p> </li> <li> <p> <code>GroupPendingInstances</code> </p> </li> <li> <p> <code>GroupStandbyInstances</code> </p> </li> <li> <p> <code>GroupTerminatingInstances</code> </p> </li> <li> <p> <code>GroupTotalInstances</code> </p> </li> <li> <p> <code>GroupInServiceCapacity</code> </p> </li> <li> <p> <code>GroupPendingCapacity</code> </p> </li> <li> <p> <code>GroupStandbyCapacity</code> </p> </li> <li> <p> <code>GroupTerminatingCapacity</code> </p> </li> <li> <p> <code>GroupTotalCapacity</code> </p> </li> <li> <p> <code>WarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>WarmPoolWarmedCapacity</code> </p> </li> <li> <p> <code>WarmPoolPendingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTerminatingCapacity</code> </p> </li> <li> <p> <code>WarmPoolTotalCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolDesiredCapacity</code> </p> </li> <li> <p> <code>GroupAndWarmPoolTotalCapacity</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a metric.</p>\"\
    },\
    \"MetricCollectionTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricCollectionType\"}\
    },\
    \"MetricDataQueries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricDataQuery\"}\
    },\
    \"MetricDataQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>A short name that identifies the object's results in the response. This name must be unique among all <code>MetricDataQuery</code> objects specified for a single scaling policy. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscores. The first character must be a lowercase letter. </p>\"\
        },\
        \"Expression\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>The math expression to perform on the returned data, if this object is performing a math expression. This expression can use the <code>Id</code> of the other metrics to refer to those metrics, and can also use the <code>Id</code> of other expressions to use the result of those expressions. </p> <p>Conditional: Within each <code>MetricDataQuery</code> object, you must specify either <code>Expression</code> or <code>MetricStat</code>, but not both.</p>\"\
        },\
        \"MetricStat\":{\
          \"shape\":\"MetricStat\",\
          \"documentation\":\"<p>Information about the metric data to return.</p> <p>Conditional: Within each <code>MetricDataQuery</code> object, you must specify either <code>Expression</code> or <code>MetricStat</code>, but not both.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"XmlStringMetricLabel\",\
          \"documentation\":\"<p>A human-readable label for this metric or expression. This is especially useful if this is a math expression, so that you know what the value represents.</p>\"\
        },\
        \"ReturnData\":{\
          \"shape\":\"ReturnData\",\
          \"documentation\":\"<p>Indicates whether to return the timestamps and raw data values of this metric. </p> <p>If you use any math expressions, specify <code>true</code> for this value for only the final math expression that the metric specification is based on. You must specify <code>false</code> for <code>ReturnData</code> for all the other metrics and expressions used in the metric specification.</p> <p>If you are only retrieving metrics and not performing any math expressions, do not specify anything for <code>ReturnData</code>. This sets it to its default (<code>true</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The metric data to return. Also defines whether this call is returning data for one metric only, or whether it is performing a math expression on the values of returned metric statistics to create a new time series. A time series is a series of data points, each of which is associated with a timestamp.</p> <p>For more information and examples, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/predictive-scaling-customized-metric-specification.html\\\">Advanced predictive scaling policy configurations using custom metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
    \"MetricStat\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Metric\",\
        \"Stat\"\
      ],\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"Metric\",\
          \"documentation\":\"<p>The CloudWatch metric to return, including the metric name, namespace, and dimensions. To get the exact metric name, namespace, and dimensions, inspect the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html\\\">Metric</a> object that is returned by a call to <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html\\\">ListMetrics</a>.</p>\"\
        },\
        \"Stat\":{\
          \"shape\":\"XmlStringMetricStat\",\
          \"documentation\":\"<p>The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list of valid values, see the table in <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic\\\">Statistics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>The most commonly used metrics for predictive scaling are <code>Average</code> and <code>Sum</code>.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit to use for the returned data points. For a complete list of the units that CloudWatch supports, see the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html\\\">MetricDatum</a> data type in the <i>Amazon CloudWatch API Reference</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure defines the CloudWatch metric to return, along with the statistic, period, and unit.</p> <p>For more information about the CloudWatch terminology below, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html\\\">Amazon CloudWatch concepts</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
    },\
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
          \"documentation\":\"<p>One or more launch templates and the instance types (overrides) that are used to launch EC2 instances to fulfill On-Demand and Spot capacities.</p>\"\
        },\
        \"InstancesDistribution\":{\
          \"shape\":\"InstancesDistribution\",\
          \"documentation\":\"<p>The instances distribution.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Use this structure to launch multiple instance types and On-Demand Instances and Spot Instances within a single Auto Scaling group.</p> <p>A mixed instances policy contains information that Amazon EC2 Auto Scaling can use to launch instances and help optimize your costs. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"MonitoringEnabled\":{\"type\":\"boolean\"},\
    \"NetworkBandwidthGbpsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveDouble\",\
          \"documentation\":\"<p>The minimum amount of network bandwidth, in gigabits per second (Gbps).</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveDouble\",\
          \"documentation\":\"<p>The maximum amount of network bandwidth, in gigabits per second (Gbps).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>NetworkBandwidthGbps</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p> <note> <p>Setting the minimum bandwidth does not guarantee that your instance will achieve the minimum bandwidth. Amazon EC2 will identify instance types that support the specified minimum bandwidth, but the actual bandwidth of your instance might go below the specified minimum at times. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-network-bandwidth.html#available-instance-bandwidth\\\">Available instance bandwidth</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> </note>\"\
    },\
    \"NetworkInterfaceCountRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The minimum number of network interfaces.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The maximum number of network interfaces.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>NetworkInterfaceCount</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
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
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic.</p>\"\
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
    \"NullableBoolean\":{\"type\":\"boolean\"},\
    \"NullablePositiveDouble\":{\
      \"type\":\"double\",\
      \"min\":0\
    },\
    \"NullablePositiveInteger\":{\
      \"type\":\"integer\",\
      \"min\":0\
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
    \"PredefinedLoadMetricType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASGTotalCPUUtilization\",\
        \"ASGTotalNetworkIn\",\
        \"ASGTotalNetworkOut\",\
        \"ALBTargetGroupRequestCount\"\
      ]\
    },\
    \"PredefinedMetricPairType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASGCPUUtilization\",\
        \"ASGNetworkIn\",\
        \"ASGNetworkOut\",\
        \"ALBRequestCount\"\
      ]\
    },\
    \"PredefinedMetricSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"PredefinedMetricType\"],\
      \"members\":{\
        \"PredefinedMetricType\":{\
          \"shape\":\"MetricType\",\
          \"documentation\":\"<p>The metric type. The following predefined metrics are available:</p> <ul> <li> <p> <code>ASGAverageCPUUtilization</code> - Average CPU utilization of the Auto Scaling group.</p> </li> <li> <p> <code>ASGAverageNetworkIn</code> - Average number of bytes received on all network interfaces by the Auto Scaling group.</p> </li> <li> <p> <code>ASGAverageNetworkOut</code> - Average number of bytes sent out on all network interfaces by the Auto Scaling group.</p> </li> <li> <p> <code>ALBRequestCountPerTarget</code> - Average Application Load Balancer request count per target for your Auto Scaling group.</p> </li> </ul>\"\
        },\
        \"ResourceLabel\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the average request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p> <p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p> <p> <code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p> <p>Where:</p> <ul> <li> <p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p> </li> <li> <p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p> </li> </ul> <p>To find the ARN for an Application Load Balancer, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a predefined metric for a target tracking scaling policy to use with Amazon EC2 Auto Scaling.</p>\"\
    },\
    \"PredefinedScalingMetricType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ASGAverageCPUUtilization\",\
        \"ASGAverageNetworkIn\",\
        \"ASGAverageNetworkOut\",\
        \"ALBRequestCountPerTarget\"\
      ]\
    },\
    \"PredictiveScalingConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"MetricSpecifications\"],\
      \"members\":{\
        \"MetricSpecifications\":{\
          \"shape\":\"PredictiveScalingMetricSpecifications\",\
          \"documentation\":\"<p>This structure includes the metrics and target utilization to use for predictive scaling. </p> <p>This is an array, but we currently only support a single metric specification. That is, you can specify a target value and a single metric pair, or a target value and one scaling metric and one load metric.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"PredictiveScalingMode\",\
          \"documentation\":\"<p>The predictive scaling mode. Defaults to <code>ForecastOnly</code> if not specified.</p>\"\
        },\
        \"SchedulingBufferTime\":{\
          \"shape\":\"PredictiveScalingSchedulingBufferTime\",\
          \"documentation\":\"<p>The amount of time, in seconds, by which the instance launch time can be advanced. For example, the forecast says to add capacity at 10:00 AM, and you choose to pre-launch instances by 5 minutes. In that case, the instances will be launched at 9:55 AM. The intention is to give resources time to be provisioned. It can take a few minutes to launch an EC2 instance. The actual amount of time required depends on several factors, such as the size of the instance and whether there are startup scripts to complete. </p> <p>The value must be less than the forecast interval duration of 3600 seconds (60 minutes). Defaults to 300 seconds if not specified. </p>\"\
        },\
        \"MaxCapacityBreachBehavior\":{\
          \"shape\":\"PredictiveScalingMaxCapacityBreachBehavior\",\
          \"documentation\":\"<p>Defines the behavior that should be applied if the forecast capacity approaches or exceeds the maximum capacity of the Auto Scaling group. Defaults to <code>HonorMaxCapacity</code> if not specified.</p> <p>The following are possible values:</p> <ul> <li> <p> <code>HonorMaxCapacity</code> - Amazon EC2 Auto Scaling cannot scale out capacity higher than the maximum capacity. The maximum capacity is enforced as a hard limit. </p> </li> <li> <p> <code>IncreaseMaxCapacity</code> - Amazon EC2 Auto Scaling can scale out capacity higher than the maximum capacity when the forecast capacity is close to or exceeds the maximum capacity. The upper limit is determined by the forecasted capacity and the value for <code>MaxCapacityBuffer</code>.</p> </li> </ul>\"\
        },\
        \"MaxCapacityBuffer\":{\
          \"shape\":\"PredictiveScalingMaxCapacityBuffer\",\
          \"documentation\":\"<p>The size of the capacity buffer to use when the forecast capacity is close to or exceeds the maximum capacity. The value is specified as a percentage relative to the forecast capacity. For example, if the buffer is 10, this means a 10 percent buffer, such that if the forecast capacity is 50, and the maximum capacity is 40, then the effective maximum capacity is 55.</p> <p>If set to 0, Amazon EC2 Auto Scaling may scale capacity higher than the maximum capacity to equal but not exceed forecast capacity. </p> <p>Required if the <code>MaxCapacityBreachBehavior</code> property is set to <code>IncreaseMaxCapacity</code>, and cannot be used otherwise.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a predictive scaling policy configuration to use with Amazon EC2 Auto Scaling.</p>\"\
    },\
    \"PredictiveScalingCustomizedCapacityMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\"MetricDataQueries\"],\
      \"members\":{\
        \"MetricDataQueries\":{\
          \"shape\":\"MetricDataQueries\",\
          \"documentation\":\"<p>One or more metric data queries to provide the data points for a capacity metric. Use multiple metric data queries only if you are performing a math expression on returned data. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a customized capacity metric for a predictive scaling policy.</p>\"\
    },\
    \"PredictiveScalingCustomizedLoadMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\"MetricDataQueries\"],\
      \"members\":{\
        \"MetricDataQueries\":{\
          \"shape\":\"MetricDataQueries\",\
          \"documentation\":\"<p>One or more metric data queries to provide the data points for a load metric. Use multiple metric data queries only if you are performing a math expression on returned data. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a custom load metric for a predictive scaling policy.</p>\"\
    },\
    \"PredictiveScalingCustomizedScalingMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\"MetricDataQueries\"],\
      \"members\":{\
        \"MetricDataQueries\":{\
          \"shape\":\"MetricDataQueries\",\
          \"documentation\":\"<p>One or more metric data queries to provide the data points for a scaling metric. Use multiple metric data queries only if you are performing a math expression on returned data. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a custom scaling metric for a predictive scaling policy.</p>\"\
    },\
    \"PredictiveScalingForecastTimestamps\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TimestampType\"}\
    },\
    \"PredictiveScalingForecastValues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricScale\"}\
    },\
    \"PredictiveScalingMaxCapacityBreachBehavior\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HonorMaxCapacity\",\
        \"IncreaseMaxCapacity\"\
      ]\
    },\
    \"PredictiveScalingMaxCapacityBuffer\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"PredictiveScalingMetricSpecification\":{\
      \"type\":\"structure\",\
      \"required\":[\"TargetValue\"],\
      \"members\":{\
        \"TargetValue\":{\
          \"shape\":\"MetricScale\",\
          \"documentation\":\"<p>Specifies the target utilization.</p> <note> <p>Some metrics are based on a count instead of a percentage, such as the request count for an Application Load Balancer or the number of messages in an SQS queue. If the scaling policy specifies one of these metrics, specify the target utilization as the optimal average request or message count per instance during any one-minute interval. </p> </note>\"\
        },\
        \"PredefinedMetricPairSpecification\":{\
          \"shape\":\"PredictiveScalingPredefinedMetricPair\",\
          \"documentation\":\"<p>The predefined metric pair specification from which Amazon EC2 Auto Scaling determines the appropriate scaling metric and load metric to use.</p>\"\
        },\
        \"PredefinedScalingMetricSpecification\":{\
          \"shape\":\"PredictiveScalingPredefinedScalingMetric\",\
          \"documentation\":\"<p>The predefined scaling metric specification.</p>\"\
        },\
        \"PredefinedLoadMetricSpecification\":{\
          \"shape\":\"PredictiveScalingPredefinedLoadMetric\",\
          \"documentation\":\"<p>The predefined load metric specification.</p>\"\
        },\
        \"CustomizedScalingMetricSpecification\":{\
          \"shape\":\"PredictiveScalingCustomizedScalingMetric\",\
          \"documentation\":\"<p>The customized scaling metric specification.</p>\"\
        },\
        \"CustomizedLoadMetricSpecification\":{\
          \"shape\":\"PredictiveScalingCustomizedLoadMetric\",\
          \"documentation\":\"<p>The customized load metric specification.</p>\"\
        },\
        \"CustomizedCapacityMetricSpecification\":{\
          \"shape\":\"PredictiveScalingCustomizedCapacityMetric\",\
          \"documentation\":\"<p>The customized capacity metric specification.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure specifies the metrics and target utilization settings for a predictive scaling policy. </p> <p>You must specify either a metric pair, or a load metric and a scaling metric individually. Specifying a metric pair instead of individual metrics provides a simpler way to configure metrics for a scaling policy. You choose the metric pair, and the policy automatically knows the correct sum and average statistics to use for the load metric and the scaling metric.</p> <p>Example</p> <ul> <li> <p>You create a predictive scaling policy and specify <code>ALBRequestCount</code> as the value for the metric pair and <code>1000.0</code> as the target value. For this type of metric, you must provide the metric dimension for the corresponding target group, so you also provide a resource label for the Application Load Balancer target group that is attached to your Auto Scaling group.</p> </li> <li> <p>The number of requests the target group receives per minute provides the load metric, and the request count averaged between the members of the target group provides the scaling metric. In CloudWatch, this refers to the <code>RequestCount</code> and <code>RequestCountPerTarget</code> metrics, respectively.</p> </li> <li> <p>For optimal use of predictive scaling, you adhere to the best practice of using a dynamic scaling policy to automatically scale between the minimum capacity and maximum capacity in response to real-time changes in resource utilization.</p> </li> <li> <p>Amazon EC2 Auto Scaling consumes data points for the load metric over the last 14 days and creates an hourly load forecast for predictive scaling. (A minimum of 24 hours of data is required.)</p> </li> <li> <p>After creating the load forecast, Amazon EC2 Auto Scaling determines when to reduce or increase the capacity of your Auto Scaling group in each hour of the forecast period so that the average number of requests received by each instance is as close to 1000 requests per minute as possible at all times.</p> </li> </ul> <p>For information about using custom metrics with predictive scaling, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/predictive-scaling-customized-metric-specification.html\\\">Advanced predictive scaling policy configurations using custom metrics</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
    },\
    \"PredictiveScalingMetricSpecifications\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PredictiveScalingMetricSpecification\"}\
    },\
    \"PredictiveScalingMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ForecastAndScale\",\
        \"ForecastOnly\"\
      ]\
    },\
    \"PredictiveScalingPredefinedLoadMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\"PredefinedMetricType\"],\
      \"members\":{\
        \"PredefinedMetricType\":{\
          \"shape\":\"PredefinedLoadMetricType\",\
          \"documentation\":\"<p>The metric type.</p>\"\
        },\
        \"ResourceLabel\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p> <p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p> <p> <code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p> <p>Where:</p> <ul> <li> <p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p> </li> <li> <p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p> </li> </ul> <p>To find the ARN for an Application Load Balancer, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a load metric for a predictive scaling policy.</p> <p>When returned in the output of <code>DescribePolicies</code>, it indicates that a predictive scaling policy uses individually specified load and scaling metrics instead of a metric pair.</p>\"\
    },\
    \"PredictiveScalingPredefinedMetricPair\":{\
      \"type\":\"structure\",\
      \"required\":[\"PredefinedMetricType\"],\
      \"members\":{\
        \"PredefinedMetricType\":{\
          \"shape\":\"PredefinedMetricPairType\",\
          \"documentation\":\"<p>Indicates which metrics to use. There are two different types of metrics for each metric type: one is a load metric and one is a scaling metric. For example, if the metric type is <code>ASGCPUUtilization</code>, the Auto Scaling group's total CPU metric is used as the load metric, and the average CPU metric is used for the scaling metric.</p>\"\
        },\
        \"ResourceLabel\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the total and average request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p> <p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p> <p> <code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p> <p>Where:</p> <ul> <li> <p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p> </li> <li> <p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p> </li> </ul> <p>To find the ARN for an Application Load Balancer, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a metric pair for a predictive scaling policy. </p>\"\
    },\
    \"PredictiveScalingPredefinedScalingMetric\":{\
      \"type\":\"structure\",\
      \"required\":[\"PredefinedMetricType\"],\
      \"members\":{\
        \"PredefinedMetricType\":{\
          \"shape\":\"PredefinedScalingMetricType\",\
          \"documentation\":\"<p>The metric type.</p>\"\
        },\
        \"ResourceLabel\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>A label that uniquely identifies a specific Application Load Balancer target group from which to determine the average request count served by your Auto Scaling group. You can't specify a resource label unless the target group is attached to the Auto Scaling group.</p> <p>You create the resource label by appending the final portion of the load balancer ARN and the final portion of the target group ARN into a single value, separated by a forward slash (/). The format of the resource label is:</p> <p> <code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.</p> <p>Where:</p> <ul> <li> <p>app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion of the load balancer ARN</p> </li> <li> <p>targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final portion of the target group ARN.</p> </li> </ul> <p>To find the ARN for an Application Load Balancer, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> API operation. To find the ARN for the target group, use the <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> API operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a scaling metric for a predictive scaling policy.</p> <p>When returned in the output of <code>DescribePolicies</code>, it indicates that a predictive scaling policy uses individually specified load and scaling metrics instead of a metric pair.</p>\"\
    },\
    \"PredictiveScalingSchedulingBufferTime\":{\
      \"type\":\"integer\",\
      \"min\":0\
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
          \"documentation\":\"<p>The lifecycle transition. For Auto Scaling groups, there are two major lifecycle transitions.</p> <ul> <li> <p>To create a lifecycle hook for scale-out events, specify <code>autoscaling:EC2_INSTANCE_LAUNCHING</code>.</p> </li> <li> <p>To create a lifecycle hook for scale-in events, specify <code>autoscaling:EC2_INSTANCE_TERMINATING</code>.</p> </li> </ul> <p>Required for new lifecycle hooks, but optional when updating existing hooks.</p>\"\
        },\
        \"RoleARN\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target.</p> <p>Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue. Required for new lifecycle hooks, but optional when updating existing hooks.</p>\"\
        },\
        \"NotificationTargetARN\":{\
          \"shape\":\"NotificationTargetResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the notification target that Amazon EC2 Auto Scaling uses to notify you when an instance is in a wait state for the lifecycle hook. You can specify either an Amazon SNS topic or an Amazon SQS queue.</p> <p>If you specify an empty string, this overrides the current ARN.</p> <p>This operation uses the JSON format when sending notifications to an Amazon SQS queue, and an email key-value pair format when sending notifications to an Amazon SNS topic.</p> <p>When you specify a notification target, Amazon EC2 Auto Scaling sends it a test message. Test messages contain the following additional key-value pair: <code>\\\"Event\\\": \\\"autoscaling:TEST_NOTIFICATION\\\"</code>.</p>\"\
        },\
        \"NotificationMetadata\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>Additional information that you want to include any time Amazon EC2 Auto Scaling sends a message to the notification target.</p>\"\
        },\
        \"HeartbeatTimeout\":{\
          \"shape\":\"HeartbeatTimeout\",\
          \"documentation\":\"<p>The maximum time, in seconds, that can elapse before the lifecycle hook times out. The range is from <code>30</code> to <code>7200</code> seconds. The default value is <code>3600</code> seconds (1 hour).</p>\"\
        },\
        \"DefaultResult\":{\
          \"shape\":\"LifecycleActionResult\",\
          \"documentation\":\"<p>The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an unexpected failure occurs. The default value is <code>ABANDON</code>.</p> <p>Valid values: <code>CONTINUE</code> | <code>ABANDON</code> </p>\"\
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
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon SNS topic.</p>\"\
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
          \"documentation\":\"<p>One of the following policy types: </p> <ul> <li> <p> <code>TargetTrackingScaling</code> </p> </li> <li> <p> <code>StepScaling</code> </p> </li> <li> <p> <code>SimpleScaling</code> (default)</p> </li> <li> <p> <code>PredictiveScaling</code> </p> </li> </ul>\"\
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
          \"documentation\":\"<p>A cooldown period, in seconds, that applies to a specific simple scaling policy. When a cooldown period is specified here, it overrides the default cooldown.</p> <p>Valid only if the policy type is <code>SimpleScaling</code>. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Default: None</p>\"\
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
          \"documentation\":\"<p> <i>Not needed if the default instance warmup is defined for the group.</i> </p> <p>The estimated time, in seconds, until a newly launched instance can contribute to the CloudWatch metrics. This warm-up period applies to instances launched due to a specific target tracking or step scaling policy. When a warm-up period is specified here, it overrides the default instance warmup.</p> <p>Valid only if the policy type is <code>TargetTrackingScaling</code> or <code>StepScaling</code>.</p> <note> <p>The default is to use the value for the default instance warmup defined for the group. If default instance warmup is null, then <code>EstimatedInstanceWarmup</code> falls back to the value of default cooldown.</p> </note>\"\
        },\
        \"TargetTrackingConfiguration\":{\
          \"shape\":\"TargetTrackingConfiguration\",\
          \"documentation\":\"<p>A target tracking scaling policy. Provides support for predefined or custom metrics.</p> <p>The following predefined metrics are available:</p> <ul> <li> <p> <code>ASGAverageCPUUtilization</code> </p> </li> <li> <p> <code>ASGAverageNetworkIn</code> </p> </li> <li> <p> <code>ASGAverageNetworkOut</code> </p> </li> <li> <p> <code>ALBRequestCountPerTarget</code> </p> </li> </ul> <p>If you specify <code>ALBRequestCountPerTarget</code> for the metric, you must specify the <code>ResourceLabel</code> property with the <code>PredefinedMetricSpecification</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_TargetTrackingConfiguration.html\\\">TargetTrackingConfiguration</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p> <p>Required if the policy type is <code>TargetTrackingScaling</code>.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"ScalingPolicyEnabled\",\
          \"documentation\":\"<p>Indicates whether the scaling policy is enabled or disabled. The default is enabled. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enable-disable-scaling-policy.html\\\">Disabling a scaling policy for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"PredictiveScalingConfiguration\":{\
          \"shape\":\"PredictiveScalingConfiguration\",\
          \"documentation\":\"<p>A predictive scaling policy. Provides support for predefined and custom metrics.</p> <p>Predefined metrics include CPU utilization, network in/out, and the Application Load Balancer request count.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PredictiveScalingConfiguration.html\\\">PredictiveScalingConfiguration</a> in the <i>Amazon EC2 Auto Scaling API Reference</i>.</p> <p>Required if the policy type is <code>PredictiveScaling</code>.</p>\"\
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
          \"documentation\":\"<p>This property is no longer used.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for this action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only and in quotes (for example, <code>\\\"2021-06-01T00:00:00Z\\\"</code>).</p> <p>If you specify <code>Recurrence</code> and <code>StartTime</code>, Amazon EC2 Auto Scaling performs the action at this time, and then performs the action based on the specified recurrence.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time for the recurring schedule to end, in UTC. For example, <code>\\\"2021-06-01T00:00:00Z\\\"</code>.</p>\"\
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
          \"documentation\":\"<p>The desired capacity is the initial capacity of the Auto Scaling group after the scheduled action runs and the capacity it attempts to maintain. It can scale beyond this capacity if you add more scaling conditions. </p> <note> <p>You must specify at least one of the following properties: <code>MaxSize</code>, <code>MinSize</code>, or <code>DesiredCapacity</code>. </p> </note>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Specifies the time zone for a cron expression. If a time zone is not provided, UTC is used by default. </p> <p>Valid values are the canonical names of the IANA time zones, derived from the IANA Time Zone Database (such as <code>Etc/GMT+9</code> or <code>Pacific/Tahiti</code>). For more information, see <a href=\\\"https://en.wikipedia.org/wiki/List_of_tz_database_time_zones\\\">https://en.wikipedia.org/wiki/List_of_tz_database_time_zones</a>.</p>\"\
        }\
      }\
    },\
    \"PutWarmPoolAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"PutWarmPoolType\":{\
      \"type\":\"structure\",\
      \"required\":[\"AutoScalingGroupName\"],\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        },\
        \"MaxGroupPreparedCapacity\":{\
          \"shape\":\"MaxGroupPreparedCapacity\",\
          \"documentation\":\"<p>Specifies the maximum number of instances that are allowed to be in the warm pool or in any state except <code>Terminated</code> for the Auto Scaling group. This is an optional property. Specify it only if you do not want the warm pool size to be determined by the difference between the group's maximum capacity and its desired capacity. </p> <important> <p>If a value for <code>MaxGroupPreparedCapacity</code> is not specified, Amazon EC2 Auto Scaling launches and maintains the difference between the group's maximum capacity and its desired capacity. If you specify a value for <code>MaxGroupPreparedCapacity</code>, Amazon EC2 Auto Scaling uses the difference between the <code>MaxGroupPreparedCapacity</code> and the desired capacity instead. </p> <p>The size of the warm pool is dynamic. Only when <code>MaxGroupPreparedCapacity</code> and <code>MinSize</code> are set to the same value does the warm pool have an absolute size.</p> </important> <p>If the desired capacity of the Auto Scaling group is higher than the <code>MaxGroupPreparedCapacity</code>, the capacity of the warm pool is 0, unless you specify a value for <code>MinSize</code>. To remove a value that you previously set, include the property but specify -1 for the value. </p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"WarmPoolMinSize\",\
          \"documentation\":\"<p>Specifies the minimum number of instances to maintain in the warm pool. This helps you to ensure that there is always a certain number of warmed instances available to handle traffic spikes. Defaults to 0 if not specified.</p>\"\
        },\
        \"PoolState\":{\
          \"shape\":\"WarmPoolState\",\
          \"documentation\":\"<p>Sets the instance state to transition to after the lifecycle actions are complete. Default is <code>Stopped</code>.</p>\"\
        },\
        \"InstanceReusePolicy\":{\
          \"shape\":\"InstanceReusePolicy\",\
          \"documentation\":\"<p>Indicates whether instances in the Auto Scaling group can be returned to the warm pool on scale in. The default is to terminate instances in the Auto Scaling group when the group scales in.</p>\"\
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
          \"documentation\":\"<p>The amount of capacity in the Auto Scaling group that must pass your group's health checks to allow the operation to continue. The value is expressed as a percentage of the desired capacity of the Auto Scaling group (rounded up to the nearest integer). The default is <code>90</code>.</p> <p>Setting the minimum healthy percentage to 100 percent limits the rate of replacement to one instance at a time. In contrast, setting it to 0 percent has the effect of replacing all instances at the same time. </p>\"\
        },\
        \"InstanceWarmup\":{\
          \"shape\":\"RefreshInstanceWarmup\",\
          \"documentation\":\"<p>A time period, in seconds, during which an instance refresh waits before moving on to replacing the next instance after a new instance enters the <code>InService</code> state.</p> <p>This property is not required for normal usage. Instead, use the <code>DefaultInstanceWarmup</code> property of the Auto Scaling group. The <code>InstanceWarmup</code> and <code>DefaultInstanceWarmup</code> properties work the same way. Only specify this property if you must override the <code>DefaultInstanceWarmup</code> property. </p> <p> If you do not specify this property, the instance warmup by default is the value of the <code>DefaultInstanceWarmup</code> property, if defined (which is recommended in all cases), or the <code>HealthCheckGracePeriod</code> property otherwise.</p>\"\
        },\
        \"CheckpointPercentages\":{\
          \"shape\":\"CheckpointPercentages\",\
          \"documentation\":\"<p>(Optional) Threshold values for each checkpoint in ascending order. Each number must be unique. To replace all instances in the Auto Scaling group, the last number in the array must be <code>100</code>.</p> <p>For usage examples, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-adding-checkpoints-instance-refresh.html\\\">Adding checkpoints to an instance refresh</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CheckpointDelay\":{\
          \"shape\":\"CheckpointDelay\",\
          \"documentation\":\"<p>(Optional) The amount of time, in seconds, to wait after a checkpoint before continuing. This property is optional, but if you specify a value for it, you must also specify a value for <code>CheckpointPercentages</code>. If you specify a value for <code>CheckpointPercentages</code> and not for <code>CheckpointDelay</code>, the <code>CheckpointDelay</code> defaults to <code>3600</code> (1 hour). </p>\"\
        },\
        \"SkipMatching\":{\
          \"shape\":\"SkipMatching\",\
          \"documentation\":\"<p>(Optional) Indicates whether skip matching is enabled. If enabled (<code>true</code>), then Amazon EC2 Auto Scaling skips replacing instances that match the desired configuration. If no desired configuration is specified, then it skips replacing instances that have the same launch template and instance types that the Auto Scaling group was using before the start of the instance refresh. The default is <code>false</code>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh-skip-matching.html\\\">Use an instance refresh with skip matching</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"AutoRollback\":{\
          \"shape\":\"AutoRollback\",\
          \"documentation\":\"<p>(Optional) Indicates whether to roll back the Auto Scaling group to its previous configuration if the instance refresh fails. The default is <code>false</code>.</p> <p>A rollback is not supported in the following situations: </p> <ul> <li> <p>There is no desired configuration specified for the instance refresh.</p> </li> <li> <p>The Auto Scaling group has a launch template that uses an Amazon Web Services Systems Manager parameter instead of an AMI ID for the <code>ImageId</code> property.</p> </li> <li> <p>The Auto Scaling group uses the launch template's <code>$Latest</code> or <code>$Default</code> version.</p> </li> </ul>\"\
        },\
        \"ScaleInProtectedInstances\":{\
          \"shape\":\"ScaleInProtectedInstances\",\
          \"documentation\":\"<p>Choose the behavior that you want Amazon EC2 Auto Scaling to use if instances protected from scale in are found. </p> <p>The following lists the valid values:</p> <dl> <dt>Refresh</dt> <dd> <p>Amazon EC2 Auto Scaling replaces instances that are protected from scale in.</p> </dd> <dt>Ignore</dt> <dd> <p>Amazon EC2 Auto Scaling ignores instances that are protected from scale in and continues to replace instances that are not protected.</p> </dd> <dt>Wait (default)</dt> <dd> <p>Amazon EC2 Auto Scaling waits one hour for you to remove scale-in protection. Otherwise, the instance refresh will fail.</p> </dd> </dl>\"\
        },\
        \"StandbyInstances\":{\
          \"shape\":\"StandbyInstances\",\
          \"documentation\":\"<p>Choose the behavior that you want Amazon EC2 Auto Scaling to use if instances in <code>Standby</code> state are found.</p> <p>The following lists the valid values:</p> <dl> <dt>Terminate</dt> <dd> <p>Amazon EC2 Auto Scaling terminates instances that are in <code>Standby</code>.</p> </dd> <dt>Ignore</dt> <dd> <p>Amazon EC2 Auto Scaling ignores instances that are in <code>Standby</code> and continues to replace instances that are in the <code>InService</code> state.</p> </dd> <dt>Wait (default)</dt> <dd> <p>Amazon EC2 Auto Scaling waits one hour for you to return the instances to service. Otherwise, the instance refresh will fail.</p> </dd> </dl>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the preferences for an instance refresh.</p>\"\
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
    \"ReturnData\":{\"type\":\"boolean\"},\
    \"ReuseOnScaleIn\":{\"type\":\"boolean\"},\
    \"RollbackDetails\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RollbackReason\":{\
          \"shape\":\"XmlStringMaxLen1023\",\
          \"documentation\":\"<p>The reason for this instance refresh rollback (for example, whether a manual or automatic rollback was initiated).</p>\"\
        },\
        \"RollbackStartTime\":{\
          \"shape\":\"TimestampType\",\
          \"documentation\":\"<p>The date and time at which the rollback began.</p>\"\
        },\
        \"PercentageCompleteOnRollback\":{\
          \"shape\":\"IntPercent\",\
          \"documentation\":\"<p>Indicates the value of <code>PercentageComplete</code> at the time the rollback started.</p>\"\
        },\
        \"InstancesToUpdateOnRollback\":{\
          \"shape\":\"InstancesToUpdate\",\
          \"documentation\":\"<p>Indicates the value of <code>InstancesToUpdate</code> at the time the rollback started.</p>\"\
        },\
        \"ProgressDetailsOnRollback\":{\
          \"shape\":\"InstanceRefreshProgressDetails\",\
          \"documentation\":\"<p>Reports progress on replacing instances in an Auto Scaling group that has a warm pool. This includes separate details for instances in the warm pool and instances in the Auto Scaling group (the live pool).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about an instance refresh rollback.</p>\"\
    },\
    \"RollbackInstanceRefreshAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The instance refresh ID associated with the request. This is the unique ID assigned to the instance refresh when it was started.</p>\"\
        }\
      }\
    },\
    \"RollbackInstanceRefreshType\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AutoScalingGroupName\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
        }\
      }\
    },\
    \"ScaleInProtectedInstances\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Refresh\",\
        \"Ignore\",\
        \"Wait\"\
      ]\
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
        \"Cancelled\",\
        \"WaitingForConnectionDraining\"\
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
          \"documentation\":\"<p>One of the following policy types: </p> <ul> <li> <p> <code>TargetTrackingScaling</code> </p> </li> <li> <p> <code>StepScaling</code> </p> </li> <li> <p> <code>SimpleScaling</code> (default)</p> </li> <li> <p> <code>PredictiveScaling</code> </p> </li> </ul> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html\\\">Target tracking scaling policies</a> and <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html\\\">Step and simple scaling policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
        },\
        \"PredictiveScalingConfiguration\":{\
          \"shape\":\"PredictiveScalingConfiguration\",\
          \"documentation\":\"<p>A predictive scaling policy.</p>\"\
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
          \"documentation\":\"<p>One or more of the following processes:</p> <ul> <li> <p> <code>Launch</code> </p> </li> <li> <p> <code>Terminate</code> </p> </li> <li> <p> <code>AddToLoadBalancer</code> </p> </li> <li> <p> <code>AlarmNotification</code> </p> </li> <li> <p> <code>AZRebalance</code> </p> </li> <li> <p> <code>HealthCheck</code> </p> </li> <li> <p> <code>InstanceRefresh</code> </p> </li> <li> <p> <code>ReplaceUnhealthy</code> </p> </li> <li> <p> <code>ScheduledActions</code> </p> </li> </ul> <p>If you omit this property, all processes are specified.</p>\"\
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
          \"documentation\":\"<p>This property is no longer used.</p>\"\
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
    \"SkipMatching\":{\"type\":\"boolean\"},\
    \"SpotInstancePools\":{\"type\":\"integer\"},\
    \"SpotPrice\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"StandbyInstances\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Terminate\",\
        \"Ignore\",\
        \"Wait\"\
      ]\
    },\
    \"StartInstanceRefreshAnswer\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceRefreshId\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>A unique ID for tracking the progress of the instance refresh.</p>\"\
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
          \"documentation\":\"<p>The strategy to use for the instance refresh. The only valid value is <code>Rolling</code>.</p>\"\
        },\
        \"DesiredConfiguration\":{\
          \"shape\":\"DesiredConfiguration\",\
          \"documentation\":\"<p>The desired configuration. For example, the desired configuration can specify a new launch template or a new version of the current launch template.</p> <p>Once the instance refresh succeeds, Amazon EC2 Auto Scaling updates the settings of the Auto Scaling group to reflect the new desired configuration. </p> <note> <p>When you specify a new launch template or a new version of the current launch template for your desired configuration, consider enabling the <code>SkipMatching</code> property in preferences. If it's enabled, Amazon EC2 Auto Scaling skips replacing instances that already use the specified launch template and instance types. This can help you reduce the number of replacements that are required to apply updates. </p> </note>\"\
        },\
        \"Preferences\":{\
          \"shape\":\"RefreshPreferences\",\
          \"documentation\":\"<p>Sets your preferences for the instance refresh so that it performs as expected when you start it. Includes the instance warmup time, the minimum healthy percentage, and the behaviors that you want Amazon EC2 Auto Scaling to use if instances that are in <code>Standby</code> state or protected from scale in are found. You can also choose to enable additional features, such as the following:</p> <ul> <li> <p>Auto rollback</p> </li> <li> <p>Checkpoints</p> </li> <li> <p>Skip matching</p> </li> </ul>\"\
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
          \"documentation\":\"<p>The amount by which to scale, based on the specified adjustment type. A positive value adds to the current capacity while a negative number removes from the current capacity.</p> <p>The amount by which to scale. The adjustment is based on the value that you specified in the <code>AdjustmentType</code> property (either an absolute number or a percentage). A positive value adds to the current capacity and a negative number subtracts from the current capacity. </p>\"\
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
          \"documentation\":\"<p>The name of the Auto Scaling group.</p>\"\
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
          \"documentation\":\"<p>The target value for the metric.</p> <note> <p>Some metrics are based on a count instead of a percentage, such as the request count for an Application Load Balancer or the number of messages in an SQS queue. If the scaling policy specifies one of these metrics, specify the target utilization as the optimal average request or message count per instance during any one-minute interval. </p> </note>\"\
        },\
        \"DisableScaleIn\":{\
          \"shape\":\"DisableScaleIn\",\
          \"documentation\":\"<p>Indicates whether scaling in by the target tracking scaling policy is disabled. If scaling in is disabled, the target tracking scaling policy doesn't remove instances from the Auto Scaling group. Otherwise, the target tracking scaling policy can remove instances from the Auto Scaling group. The default is <code>false</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a target tracking scaling policy configuration to use with Amazon EC2 Auto Scaling.</p>\"\
    },\
    \"TargetTrackingMetricDataQueries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetTrackingMetricDataQuery\"}\
    },\
    \"TargetTrackingMetricDataQuery\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>A short name that identifies the object's results in the response. This name must be unique among all <code>TargetTrackingMetricDataQuery</code> objects specified for a single scaling policy. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscores. The first character must be a lowercase letter. </p>\"\
        },\
        \"Expression\":{\
          \"shape\":\"XmlStringMaxLen2047\",\
          \"documentation\":\"<p>The math expression to perform on the returned data, if this object is performing a math expression. This expression can use the <code>Id</code> of the other metrics to refer to those metrics, and can also use the <code>Id</code> of other expressions to use the result of those expressions. </p> <p>Conditional: Within each <code>TargetTrackingMetricDataQuery</code> object, you must specify either <code>Expression</code> or <code>MetricStat</code>, but not both.</p>\"\
        },\
        \"MetricStat\":{\
          \"shape\":\"TargetTrackingMetricStat\",\
          \"documentation\":\"<p>Information about the metric data to return.</p> <p>Conditional: Within each <code>TargetTrackingMetricDataQuery</code> object, you must specify either <code>Expression</code> or <code>MetricStat</code>, but not both.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"XmlStringMetricLabel\",\
          \"documentation\":\"<p>A human-readable label for this metric or expression. This is especially useful if this is a math expression, so that you know what the value represents.</p>\"\
        },\
        \"ReturnData\":{\
          \"shape\":\"ReturnData\",\
          \"documentation\":\"<p>Indicates whether to return the timestamps and raw data values of this metric. </p> <p>If you use any math expressions, specify <code>true</code> for this value for only the final math expression that the metric specification is based on. You must specify <code>false</code> for <code>ReturnData</code> for all the other metrics and expressions used in the metric specification.</p> <p>If you are only retrieving metrics and not performing any math expressions, do not specify anything for <code>ReturnData</code>. This sets it to its default (<code>true</code>).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The metric data to return. Also defines whether this call is returning data for one metric only, or whether it is performing a math expression on the values of returned metric statistics to create a new time series. A time series is a series of data points, each of which is associated with a timestamp.</p>\"\
    },\
    \"TargetTrackingMetricStat\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Metric\",\
        \"Stat\"\
      ],\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"Metric\",\
          \"documentation\":\"<p>The metric to use.</p>\"\
        },\
        \"Stat\":{\
          \"shape\":\"XmlStringMetricStat\",\
          \"documentation\":\"<p>The statistic to return. It can include any CloudWatch statistic or extended statistic. For a list of valid values, see the table in <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic\\\">Statistics</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>The most commonly used metric for scaling is <code>Average</code>.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"MetricUnit\",\
          \"documentation\":\"<p>The unit to use for the returned data points. For a complete list of the units that CloudWatch supports, see the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html\\\">MetricDatum</a> data type in the <i>Amazon CloudWatch API Reference</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure defines the CloudWatch metric to return, along with the statistic and unit.</p> <p>For more information about the CloudWatch terminology below, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html\\\">Amazon CloudWatch concepts</a> in the <i>Amazon CloudWatch User Guide</i>.</p>\"\
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
    \"TotalLocalStorageGBRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveDouble\",\
          \"documentation\":\"<p>The storage minimum in GB.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveDouble\",\
          \"documentation\":\"<p>The storage maximum in GB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>TotalLocalStorageGB</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
    \"TrafficSourceIdentifier\":{\
      \"type\":\"structure\",\
      \"required\":[\"Identifier\"],\
      \"members\":{\
        \"Identifier\":{\
          \"shape\":\"XmlStringMaxLen511\",\
          \"documentation\":\"<p>Identifies the traffic source.</p> <p>For Application Load Balancers, Gateway Load Balancers, Network Load Balancers, and VPC Lattice, this will be the Amazon Resource Name (ARN) for a target group in this account and Region. For Classic Load Balancers, this will be the name of the Classic Load Balancer in this account and Region.</p> <p>For example: </p> <ul> <li> <p>Application Load Balancer ARN: <code>arn:aws:elasticloadbalancing:us-west-2:123456789012:targetgroup/my-targets/1234567890123456</code> </p> </li> <li> <p>Classic Load Balancer name: <code>my-classic-load-balancer</code> </p> </li> <li> <p>VPC Lattice ARN: <code>arn:aws:vpc-lattice:us-west-2:123456789012:targetgroup/tg-1234567890123456</code> </p> </li> </ul> <p>To get the ARN of a target group for a Application Load Balancer, Gateway Load Balancer, or Network Load Balancer, or the name of a Classic Load Balancer, use the Elastic Load Balancing <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html\\\">DescribeTargetGroups</a> and <a href=\\\"https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html\\\">DescribeLoadBalancers</a> API operations.</p> <p>To get the ARN of a target group for VPC Lattice, use the VPC Lattice <a href=\\\"https://docs.aws.amazon.com/vpc-lattice/latest/APIReference/API_GetTargetGroup.html\\\">GetTargetGroup</a> API operation.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"XmlStringMaxLen511\",\
          \"documentation\":\"<p>Provides additional context for the value of <code>Identifier</code>.</p> <p>The following lists the valid values:</p> <ul> <li> <p> <code>elb</code> if <code>Identifier</code> is the name of a Classic Load Balancer.</p> </li> <li> <p> <code>elbv2</code> if <code>Identifier</code> is the ARN of an Application Load Balancer, Gateway Load Balancer, or Network Load Balancer target group.</p> </li> <li> <p> <code>vpc-lattice</code> if <code>Identifier</code> is the ARN of a VPC Lattice target group.</p> </li> </ul> <p>Required if the identifier is the name of a Classic Load Balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifying information for a traffic source.</p>\"\
    },\
    \"TrafficSourceState\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TrafficSource\":{\
          \"shape\":\"XmlStringMaxLen511\",\
          \"documentation\":\"<p>This is replaced by <code>Identifier</code>.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"TrafficSource has been replaced by Identifier\"\
        },\
        \"State\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>Describes the current state of a traffic source.</p> <p>The state values are as follows:</p> <ul> <li> <p> <code>Adding</code> - The Auto Scaling instances are being registered with the load balancer or target group.</p> </li> <li> <p> <code>Added</code> - All Auto Scaling instances are registered with the load balancer or target group.</p> </li> <li> <p> <code>InService</code> - For an Elastic Load Balancing load balancer or target group, at least one Auto Scaling instance passed an <code>ELB</code> health check. For VPC Lattice, at least one Auto Scaling instance passed an <code>VPC_LATTICE</code> health check.</p> </li> <li> <p> <code>Removing</code> - The Auto Scaling instances are being deregistered from the load balancer or target group. If connection draining (deregistration delay) is enabled, Elastic Load Balancing or VPC Lattice waits for in-flight requests to complete before deregistering the instances.</p> </li> <li> <p> <code>Removed</code> - All Auto Scaling instances are deregistered from the load balancer or target group.</p> </li> </ul>\"\
        },\
        \"Identifier\":{\
          \"shape\":\"XmlStringMaxLen511\",\
          \"documentation\":\"<p>The unique identifier of the traffic source.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"XmlStringMaxLen511\",\
          \"documentation\":\"<p>Provides additional context for the value of <code>Identifier</code>.</p> <p>The following lists the valid values:</p> <ul> <li> <p> <code>elb</code> if <code>Identifier</code> is the name of a Classic Load Balancer.</p> </li> <li> <p> <code>elbv2</code> if <code>Identifier</code> is the ARN of an Application Load Balancer, Gateway Load Balancer, or Network Load Balancer target group.</p> </li> <li> <p> <code>vpc-lattice</code> if <code>Identifier</code> is the ARN of a VPC Lattice target group.</p> </li> </ul> <p>Required if the identifier is the name of a Classic Load Balancer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the state of a traffic source.</p>\"\
    },\
    \"TrafficSourceStates\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrafficSourceState\"}\
    },\
    \"TrafficSources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TrafficSourceIdentifier\"}\
    },\
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
          \"documentation\":\"<p>The mixed instances policy. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html\\\">Auto Scaling groups with multiple instance types and purchase options</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
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
          \"documentation\":\"<p> <i>Only needed if you use simple scaling policies.</i> </p> <p>The amount of time, in seconds, between one scaling activity ending and another one starting due to simple scaling policies. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/Cooldown.html\\\">Scaling cooldowns for Amazon EC2 Auto Scaling</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"AvailabilityZones\":{\
          \"shape\":\"AvailabilityZones\",\
          \"documentation\":\"<p>One or more Availability Zones for the group.</p>\"\
        },\
        \"HealthCheckType\":{\
          \"shape\":\"XmlStringMaxLen32\",\
          \"documentation\":\"<p>A comma-separated value string of one or more health check types.</p> <p>The valid values are <code>EC2</code>, <code>ELB</code>, and <code>VPC_LATTICE</code>. <code>EC2</code> is the default health check and cannot be disabled. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/healthcheck.html\\\">Health checks for Auto Scaling instances</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Only specify <code>EC2</code> if you must clear a value that was previously set.</p>\"\
        },\
        \"HealthCheckGracePeriod\":{\
          \"shape\":\"HealthCheckGracePeriod\",\
          \"documentation\":\"<p>The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the health status of an EC2 instance that has come into service and marking it unhealthy due to a failed health check. This is useful if your instances do not immediately pass their health checks after they enter the <code>InService</code> state. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/health-check-grace-period.html\\\">Set the health check grace period for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"PlacementGroup\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The name of an existing placement group into which to launch your instances. For more information, see <a href=\\\"https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html\\\">Placement groups</a> in the <i>Amazon EC2 User Guide for Linux Instances</i>.</p> <note> <p>A <i>cluster</i> placement group is a logical grouping of instances within a single Availability Zone. You cannot specify multiple Availability Zones and a cluster placement group. </p> </note>\"\
        },\
        \"VPCZoneIdentifier\":{\
          \"shape\":\"XmlStringMaxLen2047\",\
          \"documentation\":\"<p>A comma-separated list of subnet IDs for a virtual private cloud (VPC). If you specify <code>VPCZoneIdentifier</code> with <code>AvailabilityZones</code>, the subnets that you specify must reside in those Availability Zones.</p>\"\
        },\
        \"TerminationPolicies\":{\
          \"shape\":\"TerminationPolicies\",\
          \"documentation\":\"<p>A policy or a list of policies that are used to select the instances to terminate. The policies are executed in the order that you list them. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html\\\">Work with Amazon EC2 Auto Scaling termination policies</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>Valid values: <code>Default</code> | <code>AllocationStrategy</code> | <code>ClosestToNextInstanceHour</code> | <code>NewestInstance</code> | <code>OldestInstance</code> | <code>OldestLaunchConfiguration</code> | <code>OldestLaunchTemplate</code> | <code>arn:aws:lambda:region:account-id:function:my-function:my-alias</code> </p>\"\
        },\
        \"NewInstancesProtectedFromScaleIn\":{\
          \"shape\":\"InstanceProtected\",\
          \"documentation\":\"<p>Indicates whether newly launched instances are protected from termination by Amazon EC2 Auto Scaling when scaling in. For more information about preventing instances from terminating on scale in, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html\\\">Using instance scale-in protection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"ServiceLinkedRoleARN\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group uses to call other Amazon Web Services on your behalf. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html\\\">Service-linked roles</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"MaxInstanceLifetime\":{\
          \"shape\":\"MaxInstanceLifetime\",\
          \"documentation\":\"<p>The maximum amount of time, in seconds, that an instance can be in service. The default is null. If specified, the value must be either 0 or a number equal to or greater than 86,400 seconds (1 day). To clear a previously set value, specify a new value of 0. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html\\\">Replacing Auto Scaling instances based on maximum instance lifetime</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"CapacityRebalance\":{\
          \"shape\":\"CapacityRebalanceEnabled\",\
          \"documentation\":\"<p>Enables or disables Capacity Rebalancing. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html\\\">Use Capacity Rebalancing to handle Amazon EC2 Spot Interruptions</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p>\"\
        },\
        \"Context\":{\
          \"shape\":\"Context\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"DesiredCapacityType\":{\
          \"shape\":\"XmlStringMaxLen255\",\
          \"documentation\":\"<p>The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto Scaling supports <code>DesiredCapacityType</code> for attribute-based instance type selection only. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-instance-type-requirements.html\\\">Creating an Auto Scaling group using attribute-based instance type selection</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <p>By default, Amazon EC2 Auto Scaling specifies <code>units</code>, which translates into number of instances.</p> <p>Valid values: <code>units</code> | <code>vcpu</code> | <code>memory-mib</code> </p>\"\
        },\
        \"DefaultInstanceWarmup\":{\
          \"shape\":\"DefaultInstanceWarmup\",\
          \"documentation\":\"<p>The amount of time, in seconds, until a new instance is considered to have finished initializing and resource consumption to become stable after it enters the <code>InService</code> state. </p> <p>During an instance refresh, Amazon EC2 Auto Scaling waits for the warm-up period after it replaces an instance before it moves on to replacing the next instance. Amazon EC2 Auto Scaling also waits for the warm-up period before aggregating the metrics for new instances with existing instances in the Amazon CloudWatch metrics that are used for scaling, resulting in more reliable usage data. For more information, see <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-default-instance-warmup.html\\\">Set the default instance warmup for an Auto Scaling group</a> in the <i>Amazon EC2 Auto Scaling User Guide</i>.</p> <important> <p>To manage various warm-up settings at the group level, we recommend that you set the default instance warmup, <i>even if it is set to 0 seconds</i>. To remove a value that you previously set, include the property but specify <code>-1</code> for the value. However, we strongly recommend keeping the default instance warmup enabled by specifying a value of <code>0</code> or other nominal value.</p> </important>\"\
        }\
      }\
    },\
    \"VCpuCountRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Min\"],\
      \"members\":{\
        \"Min\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The minimum number of vCPUs.</p>\"\
        },\
        \"Max\":{\
          \"shape\":\"NullablePositiveInteger\",\
          \"documentation\":\"<p>The maximum number of vCPUs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the minimum and maximum for the <code>VCpuCount</code> object when you specify <a>InstanceRequirements</a> for an Auto Scaling group.</p>\"\
    },\
    \"Values\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"XmlString\"}\
    },\
    \"WarmPoolConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxGroupPreparedCapacity\":{\
          \"shape\":\"MaxGroupPreparedCapacity\",\
          \"documentation\":\"<p>The maximum number of instances that are allowed to be in the warm pool or in any state except <code>Terminated</code> for the Auto Scaling group.</p>\"\
        },\
        \"MinSize\":{\
          \"shape\":\"WarmPoolMinSize\",\
          \"documentation\":\"<p>The minimum number of instances to maintain in the warm pool.</p>\"\
        },\
        \"PoolState\":{\
          \"shape\":\"WarmPoolState\",\
          \"documentation\":\"<p>The instance state to transition to after the lifecycle actions are complete.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"WarmPoolStatus\",\
          \"documentation\":\"<p>The status of a warm pool that is marked for deletion.</p>\"\
        },\
        \"InstanceReusePolicy\":{\
          \"shape\":\"InstanceReusePolicy\",\
          \"documentation\":\"<p>The instance reuse policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a warm pool configuration. </p>\"\
    },\
    \"WarmPoolMinSize\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"WarmPoolSize\":{\"type\":\"integer\"},\
    \"WarmPoolState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Stopped\",\
        \"Running\",\
        \"Hibernated\"\
      ]\
    },\
    \"WarmPoolStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\"PendingDelete\"]\
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
    \"XmlStringMetricLabel\":{\
      \"type\":\"string\",\
      \"max\":2047,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringMetricStat\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    },\
    \"XmlStringUserData\":{\
      \"type\":\"string\",\
      \"max\":21847,\
      \"pattern\":\"[\\\\u0020-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\uD800\\\\uDC00-\\\\uDBFF\\\\uDFFF\\\\r\\\\n\\\\t]*\"\
    }\
  },\
  \"documentation\":\"<fullname>Amazon EC2 Auto Scaling</fullname> <p>Amazon EC2 Auto Scaling is designed to automatically launch and terminate EC2 instances based on user-defined scaling policies, scheduled actions, and health checks.</p> <p>For more information, see the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/userguide/\\\">Amazon EC2 Auto Scaling User Guide</a> and the <a href=\\\"https://docs.aws.amazon.com/autoscaling/ec2/APIReference/Welcome.html\\\">Amazon EC2 Auto Scaling API Reference</a>.</p>\"\
}\
";
}

@end
