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

#import <Foundation/Foundation.h>
#import <AWSCore/AWSNetworking.h>
#import <AWSCore/AWSModel.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const AWSLocationErrorDomain;

typedef NS_ENUM(NSInteger, AWSLocationErrorType) {
    AWSLocationErrorUnknown,
    AWSLocationErrorAccessDenied,
    AWSLocationErrorConflict,
    AWSLocationErrorInternalServer,
    AWSLocationErrorResourceNotFound,
    AWSLocationErrorThrottling,
    AWSLocationErrorValidation,
};

typedef NS_ENUM(NSInteger, AWSLocationBatchItemErrorCode) {
    AWSLocationBatchItemErrorCodeUnknown,
    AWSLocationBatchItemErrorCodeAccessDeniedError,
    AWSLocationBatchItemErrorCodeConflictError,
    AWSLocationBatchItemErrorCodeInternalServerError,
    AWSLocationBatchItemErrorCodeResourceNotFoundError,
    AWSLocationBatchItemErrorCodeThrottlingError,
    AWSLocationBatchItemErrorCodeValidationError,
};

typedef NS_ENUM(NSInteger, AWSLocationDimensionUnit) {
    AWSLocationDimensionUnitUnknown,
    AWSLocationDimensionUnitMeters,
    AWSLocationDimensionUnitFeet,
};

typedef NS_ENUM(NSInteger, AWSLocationDistanceUnit) {
    AWSLocationDistanceUnitUnknown,
    AWSLocationDistanceUnitKilometers,
    AWSLocationDistanceUnitMiles,
};

typedef NS_ENUM(NSInteger, AWSLocationIntendedUse) {
    AWSLocationIntendedUseUnknown,
    AWSLocationIntendedUseSingleUse,
    AWSLocationIntendedUseStorage,
};

typedef NS_ENUM(NSInteger, AWSLocationPricingPlan) {
    AWSLocationPricingPlanUnknown,
    AWSLocationPricingPlanRequestBasedUsage,
    AWSLocationPricingPlanMobileAssetTracking,
    AWSLocationPricingPlanMobileAssetManagement,
};

typedef NS_ENUM(NSInteger, AWSLocationTravelMode) {
    AWSLocationTravelModeUnknown,
    AWSLocationTravelModeCar,
    AWSLocationTravelModeTruck,
    AWSLocationTravelModeWalking,
};

typedef NS_ENUM(NSInteger, AWSLocationValidationExceptionReason) {
    AWSLocationValidationExceptionReasonUnknown,
    AWSLocationValidationExceptionReasonUnknownOperation,
    AWSLocationValidationExceptionReasonMissing,
    AWSLocationValidationExceptionReasonCannotParse,
    AWSLocationValidationExceptionReasonFieldValidationFailed,
    AWSLocationValidationExceptionReasonOther,
};

typedef NS_ENUM(NSInteger, AWSLocationVehicleWeightUnit) {
    AWSLocationVehicleWeightUnitUnknown,
    AWSLocationVehicleWeightUnitKilograms,
    AWSLocationVehicleWeightUnitPounds,
};

@class AWSLocationAssociateTrackerConsumerRequest;
@class AWSLocationAssociateTrackerConsumerResponse;
@class AWSLocationBatchDeleteDevicePositionHistoryError;
@class AWSLocationBatchDeleteDevicePositionHistoryRequest;
@class AWSLocationBatchDeleteDevicePositionHistoryResponse;
@class AWSLocationBatchDeleteGeofenceError;
@class AWSLocationBatchDeleteGeofenceRequest;
@class AWSLocationBatchDeleteGeofenceResponse;
@class AWSLocationBatchEvaluateGeofencesError;
@class AWSLocationBatchEvaluateGeofencesRequest;
@class AWSLocationBatchEvaluateGeofencesResponse;
@class AWSLocationBatchGetDevicePositionError;
@class AWSLocationBatchGetDevicePositionRequest;
@class AWSLocationBatchGetDevicePositionResponse;
@class AWSLocationBatchItemError;
@class AWSLocationBatchPutGeofenceError;
@class AWSLocationBatchPutGeofenceRequest;
@class AWSLocationBatchPutGeofenceRequestEntry;
@class AWSLocationBatchPutGeofenceResponse;
@class AWSLocationBatchPutGeofenceSuccess;
@class AWSLocationBatchUpdateDevicePositionError;
@class AWSLocationBatchUpdateDevicePositionRequest;
@class AWSLocationBatchUpdateDevicePositionResponse;
@class AWSLocationCalculateRouteCarModeOptions;
@class AWSLocationCalculateRouteRequest;
@class AWSLocationCalculateRouteResponse;
@class AWSLocationCalculateRouteSummary;
@class AWSLocationCalculateRouteTruckModeOptions;
@class AWSLocationCreateGeofenceCollectionRequest;
@class AWSLocationCreateGeofenceCollectionResponse;
@class AWSLocationCreateMapRequest;
@class AWSLocationCreateMapResponse;
@class AWSLocationCreatePlaceIndexRequest;
@class AWSLocationCreatePlaceIndexResponse;
@class AWSLocationCreateRouteCalculatorRequest;
@class AWSLocationCreateRouteCalculatorResponse;
@class AWSLocationCreateTrackerRequest;
@class AWSLocationCreateTrackerResponse;
@class AWSLocationDataSourceConfiguration;
@class AWSLocationDeleteGeofenceCollectionRequest;
@class AWSLocationDeleteGeofenceCollectionResponse;
@class AWSLocationDeleteMapRequest;
@class AWSLocationDeleteMapResponse;
@class AWSLocationDeletePlaceIndexRequest;
@class AWSLocationDeletePlaceIndexResponse;
@class AWSLocationDeleteRouteCalculatorRequest;
@class AWSLocationDeleteRouteCalculatorResponse;
@class AWSLocationDeleteTrackerRequest;
@class AWSLocationDeleteTrackerResponse;
@class AWSLocationDescribeGeofenceCollectionRequest;
@class AWSLocationDescribeGeofenceCollectionResponse;
@class AWSLocationDescribeMapRequest;
@class AWSLocationDescribeMapResponse;
@class AWSLocationDescribePlaceIndexRequest;
@class AWSLocationDescribePlaceIndexResponse;
@class AWSLocationDescribeRouteCalculatorRequest;
@class AWSLocationDescribeRouteCalculatorResponse;
@class AWSLocationDescribeTrackerRequest;
@class AWSLocationDescribeTrackerResponse;
@class AWSLocationDevicePosition;
@class AWSLocationDevicePositionUpdate;
@class AWSLocationDisassociateTrackerConsumerRequest;
@class AWSLocationDisassociateTrackerConsumerResponse;
@class AWSLocationGeofenceGeometry;
@class AWSLocationGetDevicePositionHistoryRequest;
@class AWSLocationGetDevicePositionHistoryResponse;
@class AWSLocationGetDevicePositionRequest;
@class AWSLocationGetDevicePositionResponse;
@class AWSLocationGetGeofenceRequest;
@class AWSLocationGetGeofenceResponse;
@class AWSLocationGetMapGlyphsRequest;
@class AWSLocationGetMapGlyphsResponse;
@class AWSLocationGetMapSpritesRequest;
@class AWSLocationGetMapSpritesResponse;
@class AWSLocationGetMapStyleDescriptorRequest;
@class AWSLocationGetMapStyleDescriptorResponse;
@class AWSLocationGetMapTileRequest;
@class AWSLocationGetMapTileResponse;
@class AWSLocationLeg;
@class AWSLocationLegGeometry;
@class AWSLocationListDevicePositionsRequest;
@class AWSLocationListDevicePositionsResponse;
@class AWSLocationListDevicePositionsResponseEntry;
@class AWSLocationListGeofenceCollectionsRequest;
@class AWSLocationListGeofenceCollectionsResponse;
@class AWSLocationListGeofenceCollectionsResponseEntry;
@class AWSLocationListGeofenceResponseEntry;
@class AWSLocationListGeofencesRequest;
@class AWSLocationListGeofencesResponse;
@class AWSLocationListMapsRequest;
@class AWSLocationListMapsResponse;
@class AWSLocationListMapsResponseEntry;
@class AWSLocationListPlaceIndexesRequest;
@class AWSLocationListPlaceIndexesResponse;
@class AWSLocationListPlaceIndexesResponseEntry;
@class AWSLocationListRouteCalculatorsRequest;
@class AWSLocationListRouteCalculatorsResponse;
@class AWSLocationListRouteCalculatorsResponseEntry;
@class AWSLocationListTagsForResourceRequest;
@class AWSLocationListTagsForResourceResponse;
@class AWSLocationListTrackerConsumersRequest;
@class AWSLocationListTrackerConsumersResponse;
@class AWSLocationListTrackersRequest;
@class AWSLocationListTrackersResponse;
@class AWSLocationListTrackersResponseEntry;
@class AWSLocationMapConfiguration;
@class AWSLocationPlace;
@class AWSLocationPlaceGeometry;
@class AWSLocationPutGeofenceRequest;
@class AWSLocationPutGeofenceResponse;
@class AWSLocationSearchForPositionResult;
@class AWSLocationSearchForTextResult;
@class AWSLocationSearchPlaceIndexForPositionRequest;
@class AWSLocationSearchPlaceIndexForPositionResponse;
@class AWSLocationSearchPlaceIndexForPositionSummary;
@class AWSLocationSearchPlaceIndexForTextRequest;
@class AWSLocationSearchPlaceIndexForTextResponse;
@class AWSLocationSearchPlaceIndexForTextSummary;
@class AWSLocationStep;
@class AWSLocationTagResourceRequest;
@class AWSLocationTagResourceResponse;
@class AWSLocationTruckDimensions;
@class AWSLocationTruckWeight;
@class AWSLocationUntagResourceRequest;
@class AWSLocationUntagResourceResponse;
@class AWSLocationValidationExceptionField;

/**
 
 */
@interface AWSLocationAssociateTrackerConsumerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection to be associated to tracker resource. Used when you need to specify a resource across all AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable consumerArn;

/**
 <p>The name of the tracker resource to be associated with a geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationAssociateTrackerConsumerResponse : AWSModel


@end

/**
 <p>Contains the tracker resource details.</p>
 Required parameters: [DeviceId, Error]
 */
@interface AWSLocationBatchDeleteDevicePositionHistoryError : AWSModel


/**
 <p>The ID of the device for this position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains the batch request error details associated with the request.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

@end

/**
 
 */
@interface AWSLocationBatchDeleteDevicePositionHistoryRequest : AWSRequest


/**
 <p>Devices whose position history you want to delete.</p><ul><li><p>For example, for two devices: <code>“DeviceIds” : [DeviceId1,DeviceId2]</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deviceIds;

/**
 <p>The name of the tracker resource to delete the device position history from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationBatchDeleteDevicePositionHistoryResponse : AWSModel


/**
 <p>Contains error details for each device history that failed to delete.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchDeleteDevicePositionHistoryError *> * _Nullable errors;

@end

/**
 <p>Contains error details for each geofence that failed to delete from the geofence collection.</p>
 Required parameters: [Error, GeofenceId]
 */
@interface AWSLocationBatchDeleteGeofenceError : AWSModel


/**
 <p>Contains details associated to the batch error.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>The geofence associated with the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

@end

/**
 
 */
@interface AWSLocationBatchDeleteGeofenceRequest : AWSRequest


/**
 <p>The geofence collection storing the geofences to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The batch of geofences to be deleted.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable geofenceIds;

@end

/**
 
 */
@interface AWSLocationBatchDeleteGeofenceResponse : AWSModel


/**
 <p>Contains error details for each geofence that failed to delete.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchDeleteGeofenceError *> * _Nullable errors;

@end

/**
 <p>Contains error details for each device that failed to evaluate its position against the geofences in a given geofence collection.</p>
 Required parameters: [DeviceId, Error, SampleTime]
 */
@interface AWSLocationBatchEvaluateGeofencesError : AWSModel


/**
 <p>The device associated with the position evaluation error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains details associated to the batch error.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>Specifies a timestamp for when the error occurred in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationBatchEvaluateGeofencesRequest : AWSRequest


/**
 <p>The geofence collection used in evaluating the position of devices against its geofences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>Contains device details for each device to be evaluated against the given geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePositionUpdate *> * _Nullable devicePositionUpdates;

@end

/**
 
 */
@interface AWSLocationBatchEvaluateGeofencesResponse : AWSModel


/**
 <p>Contains error details for each device that failed to evaluate its position against the given geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchEvaluateGeofencesError *> * _Nullable errors;

@end

/**
 <p>Contains error details for each device that didn't return a position.</p>
 Required parameters: [DeviceId, Error]
 */
@interface AWSLocationBatchGetDevicePositionError : AWSModel


/**
 <p>The ID of the device that didn't return a position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains details related to the error code.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

@end

/**
 
 */
@interface AWSLocationBatchGetDevicePositionRequest : AWSRequest


/**
 <p>Devices whose position you want to retrieve.</p><ul><li><p>For example, for two devices: <code>device-ids=DeviceId1&amp;device-ids=DeviceId2</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable deviceIds;

/**
 <p>The tracker resource retrieving the device position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationBatchGetDevicePositionResponse : AWSModel


/**
 <p>Contains device position details such as the device ID, position, and timestamps for when the position was received and sampled.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePosition *> * _Nullable devicePositions;

/**
 <p>Contains error details for each device that failed to send its position to the tracker resource.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchGetDevicePositionError *> * _Nullable errors;

@end

/**
 <p>Contains the batch request error details associated with the request.</p>
 */
@interface AWSLocationBatchItemError : AWSModel


/**
 <p>The error code associated with the batch request error.</p>
 */
@property (nonatomic, assign) AWSLocationBatchItemErrorCode code;

/**
 <p>A message with the reason for the batch request error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

@end

/**
 <p>Contains error details for each geofence that failed to be stored in a given geofence collection.</p>
 Required parameters: [Error, GeofenceId]
 */
@interface AWSLocationBatchPutGeofenceError : AWSModel


/**
 <p>Contains details associated to the batch error.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>The geofence associated with the error message.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

@end

/**
 
 */
@interface AWSLocationBatchPutGeofenceRequest : AWSRequest


/**
 <p>The geofence collection storing the geofences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The batch of geofences to be stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchPutGeofenceRequestEntry *> * _Nullable entries;

@end

/**
 <p>Contains geofence geometry details. </p>
 Required parameters: [GeofenceId, Geometry]
 */
@interface AWSLocationBatchPutGeofenceRequestEntry : AWSModel


/**
 <p>The identifier for the geofence to be stored in a given geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Contains the polygon details to specify the position of the geofence.</p><note><p>Each <a href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html">geofence polygon</a> can have a maximum of 1,000 vertices.</p></note>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

@end

/**
 
 */
@interface AWSLocationBatchPutGeofenceResponse : AWSModel


/**
 <p>Contains additional error details for each geofence that failed to be stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchPutGeofenceError *> * _Nullable errors;

/**
 <p>Contains each geofence that was successfully stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchPutGeofenceSuccess *> * _Nullable successes;

@end

/**
 <p>Contains a summary of each geofence that was successfully stored in a given geofence collection.</p>
 Required parameters: [CreateTime, GeofenceId, UpdateTime]
 */
@interface AWSLocationBatchPutGeofenceSuccess : AWSModel


/**
 <p>The timestamp for when the geofence was stored in a geofence collection in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence successfully stored in a geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>The timestamp for when the geofence was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Contains error details for each device that failed to update its position.</p>
 Required parameters: [DeviceId, Error, SampleTime]
 */
@interface AWSLocationBatchUpdateDevicePositionError : AWSModel


/**
 <p>The device associated with the failed location update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Contains details related to the error code such as the error code and error message.</p>
 */
@property (nonatomic, strong) AWSLocationBatchItemError * _Nullable error;

/**
 <p>The timestamp at which the device position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationBatchUpdateDevicePositionRequest : AWSRequest


/**
 <p>The name of the tracker resource to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>Contains the position update details for each device.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePositionUpdate *> * _Nullable updates;

@end

/**
 
 */
@interface AWSLocationBatchUpdateDevicePositionResponse : AWSModel


/**
 <p>Contains error details for each device that failed to update its position.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationBatchUpdateDevicePositionError *> * _Nullable errors;

@end

/**
 <p>Contains details about additional route preferences for requests that specify <code>TravelMode</code> as <code>Car</code>.</p>
 */
@interface AWSLocationCalculateRouteCarModeOptions : AWSModel


/**
 <p>Avoids ferries when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidFerries;

/**
 <p>Avoids tolls when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidTolls;

@end

/**
 
 */
@interface AWSLocationCalculateRouteRequest : AWSRequest


/**
 <p>The name of the route calculator resource that you want to use to calculate a route. </p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>Specifies route preferences when traveling by <code>Car</code>, such as avoiding routes that use ferries or tolls.</p><p>Requirements: <code>TravelMode</code> must be specified as <code>Car</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteCarModeOptions * _Nullable carModeOptions;

/**
 <p>Sets the time of departure as the current time. Uses the current time to calculate a route. Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the route.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable departNow;

/**
 <p>The start position for the route. Defined in <a href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format: <code>[longitude, latitude]</code>.</p><ul><li><p>For example, <code>[-123.115, 49.285]</code></p></li></ul><note><p>If you specify a departure that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">moves the position to the nearest road</a>.</p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable departurePosition;

/**
 <p>Specifies the desired time of departure. Uses the given time to calculate a route. Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the route.</p><note><p>Setting a departure time in the past returns a <code>400 ValidationException</code> error.</p></note><ul><li><p>In <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable departureTime;

/**
 <p>The finish position for the route. Defined in <a href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format: <code>[longitude, latitude]</code>.</p><ul><li><p> For example, <code>[-122.339, 47.615]</code></p></li></ul><note><p>If you specify a destination that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">moves the position to the nearest road</a>. </p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable destinationPosition;

/**
 <p>Set the unit system to specify the distance.</p><p>Default Value: <code>Kilometers</code></p>
 */
@property (nonatomic, assign) AWSLocationDistanceUnit distanceUnit;

/**
 <p>Set to include the geometry details in the result for each path between a pair of positions.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable includeLegGeometry;

/**
 <p>Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and road compatibility.</p><p>The <code>TravelMode</code> you specify determines how you specify route preferences: </p><ul><li><p>If traveling by <code>Car</code> use the <code>CarModeOptions</code> parameter.</p></li><li><p>If traveling by <code>Truck</code> use the <code>TruckModeOptions</code> parameter.</p></li></ul><p>Default Value: <code>Car</code></p>
 */
@property (nonatomic, assign) AWSLocationTravelMode travelMode;

/**
 <p>Specifies route preferences when traveling by <code>Truck</code>, such as avoiding routes that use ferries or tolls, and truck specifications to consider when choosing an optimal road.</p><p>Requirements: <code>TravelMode</code> must be specified as <code>Truck</code>.</p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteTruckModeOptions * _Nullable truckModeOptions;

/**
 <p>Specifies an ordered list of up to 23 intermediate positions to include along a route between the departure position and destination position. </p><ul><li><p>For example, from the <code>DeparturePosition</code><code>[-123.115, 49.285]</code>, the route follows the order that the waypoint positions are given <code>[[-122.757, 49.0021],[-122.349, 47.620]]</code></p></li></ul><note><p>If you specify a waypoint position that's not located on a road, Amazon Location <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">moves the position to the nearest road</a>. </p><p>Specifying more than 23 waypoints returns a <code>400 ValidationException</code> error.</p></note><p>Valid Values: <code>[-180 to 180,-90 to 90]</code></p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable waypointPositions;

@end

/**
 <p>Returns the result of the route calculation. Metadata includes legs and route summary.</p>
 Required parameters: [Legs, Summary]
 */
@interface AWSLocationCalculateRouteResponse : AWSModel


/**
 <p>Contains details about each path between a pair of positions included along a route such as: <code>StartPosition</code>, <code>EndPosition</code>, <code>Distance</code>, <code>DurationSeconds</code>, <code>Geometry</code>, and <code>Steps</code>. The number of legs returned corresponds to one less than the total number of positions in the request. </p><p>For example, a route with a departure position and destination position returns one leg with the positions <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped to a nearby road</a>:</p><ul><li><p>The <code>StartPosition</code> is the departure position.</p></li><li><p>The <code>EndPosition</code> is the destination position.</p></li></ul><p>A route with a waypoint between the departure and destination position returns two legs with the positions snapped to a nearby road.:</p><ul><li><p>Leg 1: The <code>StartPosition</code> is the departure position . The <code>EndPosition</code> is the waypoint positon.</p></li><li><p>Leg 2: The <code>StartPosition</code> is the waypoint position. The <code>EndPosition</code> is the destination position.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<AWSLocationLeg *> * _Nullable legs;

/**
 <p>Contains information about the whole route, such as: <code>RouteBBox</code>, <code>DataSource</code>, <code>Distance</code>, <code>DistanceUnit</code>, and <code>DurationSeconds</code></p>
 */
@property (nonatomic, strong) AWSLocationCalculateRouteSummary * _Nullable summary;

@end

/**
 <p>A summary of the calculated route.</p>
 Required parameters: [DataSource, Distance, DistanceUnit, DurationSeconds, RouteBBox]
 */
@interface AWSLocationCalculateRouteSummary : AWSModel


/**
 <p>The data provider of traffic and road network data used to calculate the route. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The total distance covered by the route. The sum of the distance travelled between every stop on the route.</p><note><p>The route <code>distance</code> can't be greater than 250 km. If the route exceeds 250 km, the response returns a <code>400 RoutesValidationException</code> error.</p></note>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The unit of measurement for the distance.</p>
 */
@property (nonatomic, assign) AWSLocationDistanceUnit distanceUnit;

/**
 <p>The total travel time for the route measured in seconds. The sum of the travel time between every stop on the route.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>Specifies a geographical box surrounding a route. Used to zoom into a route when displaying it in a map. For example, <code>[min x, min y, max x, max y]</code></p><p>The first 2 <code>bbox</code> parameters describe the lower southwest corner: </p><ul><li><p>The first <code>bbox</code> position is the X coordinate or longitude of the lower southwest corner. </p></li><li><p>The second <code>bbox</code> position is the Y coordinate or latitude of the lower southwest corner. </p></li></ul><p>The next 2 <code>bbox</code> parameters describe the upper northeast corner: </p><ul><li><p>The third <code>bbox</code> position is the X coordinate, or longitude of the upper northeast corner. </p></li><li><p>The fourth <code>bbox</code> position is the Y coordinate, or longitude of the upper northeast corner. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable routeBBox;

@end

/**
 <p>Contains details about additional route preferences for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>
 */
@interface AWSLocationCalculateRouteTruckModeOptions : AWSModel


/**
 <p>Avoids ferries when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidFerries;

/**
 <p>Avoids ferries when calculating routes.</p><p>Default Value: <code>false</code></p><p>Valid Values: <code>false</code> | <code>true</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable avoidTolls;

/**
 <p>Specifies the truck's dimension specifications including length, height, width, and unit of measurement. Used to avoid roads that can't support the truck's dimensions.</p>
 */
@property (nonatomic, strong) AWSLocationTruckDimensions * _Nullable dimensions;

/**
 <p>Specifies the truck's weight specifications including total weight and unit of measurement. Used to avoid roads that can't support the truck's weight.</p>
 */
@property (nonatomic, strong) AWSLocationTruckWeight * _Nullable weight;

@end

/**
 
 */
@interface AWSLocationCreateGeofenceCollectionRequest : AWSRequest


/**
 <p>A custom name for the geofence collection.</p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_). </p></li><li><p>Must be a unique geofence collection name.</p></li><li><p>No spaces allowed. For example, <code>ExampleGeofenceCollection</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>An optional description for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or alias ARN. </p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the pricing plan for the geofence collection.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Specifies the data provider for the geofence collection.</p><ul><li><p>Required value for the following pricing plans: <code>MobileAssetTracking </code>| <code>MobileAssetManagement</code></p></li></ul><p>For more information about <a href="https://aws.amazon.com/location/data-providers/">Data Providers</a>, and <a href="https://aws.amazon.com/location/pricing/">Pricing plans</a>, see the Amazon Location Service product page.</p><note><p>Amazon Location Service only uses <code>PricingPlanDataSource</code> to calculate billing for your geofence collection. Your data won't be shared with the data provider, and will remain in your AWS account or Region unless you move it.</p></note><p>Valid Values: <code>Esri </code>| <code>Here</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Applies one or more tags to the geofence collection. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateGeofenceCollectionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all AWS. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionArn;

/**
 <p>The name for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The timestamp for when the geofence collection was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

@end

/**
 
 */
@interface AWSLocationCreateMapRequest : AWSRequest


/**
 <p>Specifies the map style selected from an available data provider.</p>
 */
@property (nonatomic, strong) AWSLocationMapConfiguration * _Nullable configuration;

/**
 <p>An optional description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name for the map resource.</p><p>Requirements:</p><ul><li><p>Must contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_). </p></li><li><p>Must be a unique map resource name. </p></li><li><p>No spaces allowed. For example, <code>ExampleMap</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>Specifies the pricing plan for your map resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Applies one or more tags to the map resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateMapResponse : AWSModel


/**
 <p>The timestamp for when the map resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The Amazon Resource Name (ARN) for the map resource. Used when you need to specify a resource across all AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapArn;

/**
 <p>The name of the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationCreatePlaceIndexRequest : AWSRequest


/**
 <p>Specifies the data provider of geospatial data.</p><note><p>This field is case-sensitive. Enter the valid values as shown. For example, entering <code>HERE</code> will return an error.</p></note><p>Valid values include:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Here</code></p><important><p>Place index resources using HERE as a data provider can't be used to <a href="https://docs.aws.amazon.com/location-places/latest/APIReference/API_DataSourceConfiguration.html">store</a> results for locations in Japan. For more information, see the <a href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for Amazon Location Service.</p></important></li></ul><p>For additional details on data providers, see the <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers page</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>Specifies the data storage option for requesting Places.</p>
 */
@property (nonatomic, strong) AWSLocationDataSourceConfiguration * _Nullable dataSourceConfiguration;

/**
 <p>The optional description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the place index resource. </p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A–Z, a–z, 0–9), hyphens (-), periods (.), and underscores (_).</p></li><li><p>Must be a unique place index resource name.</p></li><li><p>No spaces allowed. For example, <code>ExamplePlaceIndex</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>Specifies the pricing plan for your place index resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Applies one or more tags to the place index resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreatePlaceIndexResponse : AWSModel


/**
 <p>The timestamp for when the place index resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across all AWS. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSLocationCreateRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource. </p><p>Requirements:</p><ul><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9) , hyphens (-), periods (.), and underscores (_).</p></li><li><p>Must be a unique Route calculator resource name.</p></li><li><p>No spaces allowed. For example, <code>ExampleRouteCalculator</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>Specifies the data provider of traffic and road network data.</p><note><p>This field is case-sensitive. Enter the valid values as shown. For example, entering <code>HERE</code> returns an error.</p></note><p>Valid Values: <code>Esri</code> | <code>Here</code></p><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description for the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>Specifies the pricing plan for your route calculator resource.</p><p>For additional details and restrictions on each pricing plan option, see <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Applies one or more tags to the route calculator resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><ul><li><p>For example: { <code>"tag1" : "value1"</code>, <code>"tag2" : "value2"</code>}</p></li></ul><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationCreateRouteCalculatorResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the route calculator resource. Use the ARN when you specify a resource across all AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorArn;

/**
 <p>The name of the route calculator resource. </p><ul><li><p>For example, <code>ExampleRouteCalculator</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp when the route calculator resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

@end

/**
 
 */
@interface AWSLocationCreateTrackerRequest : AWSRequest


/**
 <p>An optional description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or alias ARN.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>Specifies the pricing plan for the tracker resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Specifies the data provider for the tracker resource.</p><ul><li><p>Required value for the following pricing plans: <code>MobileAssetTracking </code>| <code>MobileAssetManagement</code></p></li></ul><p>For more information about <a href="https://aws.amazon.com/location/data-providers/">Data Providers</a>, and <a href="https://aws.amazon.com/location/pricing/">Pricing plans</a>, see the Amazon Location Service product page.</p><note><p>Amazon Location Service only uses <code>PricingPlanDataSource</code> to calculate billing for your tracker resource. Your data will not be shared with the data provider, and will remain in your AWS account or Region unless you move it.</p></note><p>Valid Values: <code>Esri</code> | <code>Here</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Applies one or more tags to the tracker resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p><p>Format: <code>"key" : "value"</code></p><p>Restrictions:</p><ul><li><p>Maximum 50 tags per resource</p></li><li><p>Each resource tag must be unique with a maximum of one value.</p></li><li><p>Maximum key length: 128 Unicode characters in UTF-8</p></li><li><p>Maximum value length: 256 Unicode characters in UTF-8</p></li><li><p>Can use alphanumeric characters (A–Z, a–z, 0–9), and the following characters: + - = . _ : / @. </p></li></ul>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The name for the tracker resource.</p><p>Requirements:</p><ul><li><p>Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-), periods (.), and underscores (_).</p></li><li><p>Must be a unique tracker resource name.</p></li><li><p>No spaces allowed. For example, <code>ExampleTracker</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationCreateTrackerResponse : AWSModel


/**
 <p>The timestamp for when the tracker resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerArn;

/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 <p>Specifies the data storage option chosen for requesting Places.</p>
 */
@interface AWSLocationDataSourceConfiguration : AWSModel


/**
 <p>Specifies how the results of an operation will be stored by the caller. </p><p>Valid values include:</p><ul><li><p><code>SingleUse</code> specifies that the results won't be stored. </p></li><li><p><code>Storage</code> specifies that the result can be cached or stored in a database.</p><important><p>Place index resources using HERE as a data provider can't be configured to store results for locations in Japan when choosing <code>Storage</code> for the <code>IntendedUse</code> parameter.</p></important></li></ul><p>Default value: <code>SingleUse</code></p>
 */
@property (nonatomic, assign) AWSLocationIntendedUse intendedUse;

@end

/**
 
 */
@interface AWSLocationDeleteGeofenceCollectionRequest : AWSRequest


/**
 <p>The name of the geofence collection to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

@end

/**
 
 */
@interface AWSLocationDeleteGeofenceCollectionResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteMapRequest : AWSRequest


/**
 <p>The name of the map resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationDeleteMapResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeletePlaceIndexRequest : AWSRequest


/**
 <p>The name of the place index resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSLocationDeletePlaceIndexResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

@end

/**
 
 */
@interface AWSLocationDeleteRouteCalculatorResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDeleteTrackerRequest : AWSRequest


/**
 <p>The name of the tracker resource to be deleted.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationDeleteTrackerResponse : AWSModel


@end

/**
 
 */
@interface AWSLocationDescribeGeofenceCollectionRequest : AWSRequest


/**
 <p>The name of the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

@end

/**
 
 */
@interface AWSLocationDescribeGeofenceCollectionResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all AWS. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable collectionArn;

/**
 <p>The name of the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The timestamp for when the geofence resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The optional description for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS KMS customer managed key</a> assigned to the Amazon Location resource</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The pricing plan selected for the specified geofence collection.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The specified data provider for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Displays the key, value pairs of tags associated with this resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the geofence collection was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeMapRequest : AWSRequest


/**
 <p>The name of the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationDescribeMapResponse : AWSModel


/**
 <p>Specifies the map tile style selected from a partner data provider.</p>
 */
@property (nonatomic, strong) AWSLocationMapConfiguration * _Nullable configuration;

/**
 <p>The timestamp for when the map resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Specifies the data provider for the associated map tiles.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the map resource. Used when you need to specify a resource across all AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable mapArn;

/**
 <p>The map style selected from an available provider.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>The pricing plan selected for the specified map resource.</p><pre><code> &lt;p&gt;For additional details and restrictions on each pricing plan option, see the &lt;a href=&quot;https://aws.amazon.com/location/pricing/&quot;&gt;Amazon Location Service pricing page&lt;/a&gt;.&lt;/p&gt; </code></pre>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Tags associated with the map resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the map resource was last update in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribePlaceIndexRequest : AWSRequest


/**
 <p>The name of the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

@end

/**
 
 */
@interface AWSLocationDescribePlaceIndexResponse : AWSModel


/**
 <p>The timestamp for when the place index resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of geospatial data. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Here</code></p></li></ul><p>For additional details on data providers, see the <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers page</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The specified data storage option for requesting Places.</p>
 */
@property (nonatomic, strong) AWSLocationDataSourceConfiguration * _Nullable dataSourceConfiguration;

/**
 <p>The optional description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across all AWS. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable indexArn;

/**
 <p>The name of the place index resource being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The pricing plan selected for the specified place index resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Tags associated with place index resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp for when the place index resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeRouteCalculatorRequest : AWSRequest


/**
 <p>The name of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

@end

/**
 
 */
@interface AWSLocationDescribeRouteCalculatorResponse : AWSModel


/**
 <p>The Amazon Resource Name (ARN) for the Route calculator resource. Use the ARN when you specify a resource across AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorArn;

/**
 <p>The name of the route calculator resource being described.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp when the route calculator resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of traffic and road network data. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The pricing plan selected for the specified route calculator resource.</p><p>For additional details and restrictions on each pricing plan option, see <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>Tags associated with route calculator resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The timestamp when the route calculator resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationDescribeTrackerRequest : AWSRequest


/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationDescribeTrackerResponse : AWSModel


/**
 <p>The timestamp for when the tracker resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The optional description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>A key identifier for an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html">AWS KMS customer managed key</a> assigned to the Amazon Location resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable kmsKeyId;

/**
 <p>The pricing plan selected for the specified tracker resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The specified data provider for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>The tags associated with the tracker resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

/**
 <p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all AWS.</p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable trackerArn;

/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>The timestamp for when the tracker resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Contains the device position details.</p>
 Required parameters: [Position, ReceivedTime, SampleTime]
 */
@interface AWSLocationDevicePosition : AWSModel


/**
 <p>The device whose position you retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The last known device position.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The timestamp for when the tracker resource received the device position in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable receivedTime;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 <p>Contains the position update details for a device.</p>
 Required parameters: [DeviceId, Position, SampleTime]
 */
@interface AWSLocationDevicePositionUpdate : AWSModel


/**
 <p>The device associated to the position update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The latest device position defined in <a href="https://earth-info.nga.mil/GandG/wgs84/index.html">WGS 84</a> format: <code>[X or longitude, Y or latitude]</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationDisassociateTrackerConsumerRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) for the geofence collection to be disassociated from the tracker resource. Used when you need to specify a resource across all AWS. </p><ul><li><p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code></p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable consumerArn;

/**
 <p>The name of the tracker resource to be dissociated from the consumer.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationDisassociateTrackerConsumerResponse : AWSModel


@end

/**
 <p>Contains the geofence geometry details.</p><note><p>Amazon Location doesn't currently support polygons with holes, multipolygons, polygons that are wound clockwise, or that cross the antimeridian. </p></note>
 */
@interface AWSLocationGeofenceGeometry : AWSModel


/**
 <p>An array of 1 or more linear rings. A linear ring is an array of 4 or more vertices, where the first and last vertex are the same to form a closed boundary. Each vertex is a 2-dimensional point of the form: <code>[longitude, latitude]</code>. </p><p>The first linear ring is an outer ring, describing the polygon's boundary. Subsequent linear rings may be inner or outer rings to describe holes and islands. Outer rings must list their vertices in counter-clockwise order around the ring's center, where the left side is the polygon's exterior. Inner rings must list their vertices in clockwise order, where the left side is the polygon's interior.</p>
 */
@property (nonatomic, strong) NSArray<NSArray<NSArray<NSNumber *> *> *> * _Nullable polygon;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionHistoryRequest : AWSRequest


/**
 <p>The device whose position history you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>Specify the end time for the position history in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the value will be the time that the request is made.</p><p>Requirement:</p><ul><li><p>The time specified for <code>EndTimeExclusive</code> must be after the time for <code>StartTimeInclusive</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable endTimeExclusive;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>Specify the start time for the position history in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the value will be 24 hours prior to the time that the request is made.</p><p>Requirement:</p><ul><li><p>The time specified for <code>StartTimeInclusive</code> must be before <code>EndTimeExclusive</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable startTimeInclusive;

/**
 <p>The tracker resource receiving the request for the device position history.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionHistoryResponse : AWSModel


/**
 <p>Contains the position history details for the requested device.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationDevicePosition *> * _Nullable devicePositions;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionRequest : AWSRequest


/**
 <p>The device whose position you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The tracker resource receiving the position update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationGetDevicePositionResponse : AWSModel


/**
 <p>The device whose position you retrieved.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The last known device position.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The timestamp for when the tracker resource received the device position in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable receivedTime;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationGetGeofenceRequest : AWSRequest


/**
 <p>The geofence collection storing the target geofence.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The geofence you're retrieving details for.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

@end

/**
 
 */
@interface AWSLocationGetGeofenceResponse : AWSModel


/**
 <p>The timestamp for when the geofence collection was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Contains the geofence geometry details describing a polygon.</p>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

/**
 <p>Identifies the state of the geofence. A geofence will hold one of the following states:</p><ul><li><p><code>ACTIVE</code> — The geofence has been indexed by the system. </p></li><li><p><code>PENDING</code> — The geofence is being processed by the system.</p></li><li><p><code>FAILED</code> — The geofence failed to be indexed by the system.</p></li><li><p><code>DELETED</code> — The geofence has been deleted from the system index.</p></li><li><p><code>DELETING</code> — The geofence is being deleted from the system index.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The timestamp for when the geofence collection was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationGetMapGlyphsRequest : AWSRequest


/**
 <p>A comma-separated list of fonts to load glyphs from in order of preference.. For example, <code>Noto Sans, Arial Unicode</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fontStack;

/**
 <p>A Unicode range of characters to download glyphs for. Each response will contain 256 characters. For example, 0–255 includes all characters from range <code>U+0000</code> to <code>00FF</code>. Must be aligned to multiples of 256.</p>
 */
@property (nonatomic, strong) NSString * _Nullable fontUnicodeRange;

/**
 <p>The map resource associated with the glyph ﬁle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationGetMapGlyphsResponse : AWSModel


/**
 <p>The blob's content type.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The map glyph content type. For example, <code>application/octet-stream</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetMapSpritesRequest : AWSRequest


/**
 <p>The name of the sprite ﬁle. Use the following ﬁle names for the sprite sheet:</p><ul><li><p><code>sprites.png</code></p></li><li><p><code>sprites@2x.png</code> for high pixel density displays</p></li></ul><p>For the JSON document contain image offsets. Use the following ﬁle names:</p><ul><li><p><code>sprites.json</code></p></li><li><p><code>sprites@2x.json</code> for high pixel density displays</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable fileName;

/**
 <p>The map resource associated with the sprite ﬁle.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationGetMapSpritesResponse : AWSModel


/**
 <p>Contains the body of the sprite sheet or JSON offset ﬁle.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The content type of the sprite sheet and offsets. For example, the sprite sheet content type is <code>image/png</code>, and the sprite offset JSON document is <code>application/json</code>. </p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetMapStyleDescriptorRequest : AWSRequest


/**
 <p>The map resource to retrieve the style descriptor from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

@end

/**
 
 */
@interface AWSLocationGetMapStyleDescriptorResponse : AWSModel


/**
 <p>Contains the body of the style descriptor.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The style descriptor's content type. For example, <code>application/json</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 
 */
@interface AWSLocationGetMapTileRequest : AWSRequest


/**
 <p>The map resource to retrieve the map tiles from.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>The X axis value for the map tile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable X;

/**
 <p>The Y axis value for the map tile. </p>
 */
@property (nonatomic, strong) NSString * _Nullable Y;

/**
 <p>The zoom value for the map tile.</p>
 */
@property (nonatomic, strong) NSString * _Nullable Z;

@end

/**
 
 */
@interface AWSLocationGetMapTileResponse : AWSModel


/**
 <p>Contains Mapbox Vector Tile (MVT) data.</p>
 */
@property (nonatomic, strong) NSData * _Nullable blob;

/**
 <p>The map tile's content type. For example, <code>application/vnd.mapbox-vector-tile</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable contentType;

@end

/**
 <p>Contains the calculated route's details for each path between a pair of positions. The number of legs returned corresponds to one less than the total number of positions in the request. </p><p>For example, a route with a departure position and destination position returns one leg with the positions <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped to a nearby road</a>:</p><ul><li><p>The <code>StartPosition</code> is the departure position.</p></li><li><p>The <code>EndPosition</code> is the destination position.</p></li></ul><p>A route with a waypoint between the departure and destination position returns two legs with the positions snapped to a nearby road.:</p><ul><li><p>Leg 1: The <code>StartPosition</code> is the departure position . The <code>EndPosition</code> is the waypoint positon.</p></li><li><p>Leg 2: The <code>StartPosition</code> is the waypoint position. The <code>EndPosition</code> is the destination position.</p></li></ul>
 Required parameters: [Distance, DurationSeconds, EndPosition, StartPosition, Steps]
 */
@interface AWSLocationLeg : AWSModel


/**
 <p>The distance between the leg's <code>StartPosition</code> and <code>EndPosition</code> along a calculated route. </p><ul><li><p>The default measurement is <code>Kilometers</code> unless the request specifies a <code>DistanceUnit</code> of <code>Miles</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The estimated travel time between the leg's <code>StartPosition</code> and <code>EndPosition</code>. The travel mode and departure time that you specify in the request determines the calculated time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The terminating position of the leg. Follows the format <code>[longitude,latitude]</code>.</p><note><p>If the <code>EndPosition</code> isn't located on a road, it's <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped to a nearby road</a>. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable endPosition;

/**
 <p>Contains the calculated route's path as a linestring geometry.</p>
 */
@property (nonatomic, strong) AWSLocationLegGeometry * _Nullable geometry;

/**
 <p>The starting position of the leg. Follows the format <code>[longitude,latitude]</code>.</p><note><p>If the <code>StartPosition</code> isn't located on a road, it's <a href="https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road">snapped to a nearby road</a>. </p></note>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable startPosition;

/**
 <p>Contains a list of steps, which represent subsections of a leg. Each step provides instructions for how to move to the next step in the leg such as the step's start position, end position, travel distance, travel duration, and geometry offset.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationStep *> * _Nullable steps;

@end

/**
 <p>Contains the geometry details for each path between a pair of positions. Used in plotting a route leg on a map.</p>
 */
@interface AWSLocationLegGeometry : AWSModel


/**
 <p>An ordered list of positions used to plot a route on a map. </p><p>The first position is closest to the start position for the leg, and the last position is the closest to the end position for the leg.</p><ul><li><p>For example, <code>[[-123.117, 49.284],[-123.115, 49.285],[-123.115, 49.285]]</code></p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * _Nullable lineString;

@end

/**
 
 */
@interface AWSLocationListDevicePositionsRequest : AWSRequest


/**
 <p>An optional limit for the number of entries returned in a single call.</p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tracker resource containing the requested devices.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationListDevicePositionsResponse : AWSModel


/**
 <p>Contains details about each device's last known position. These details includes the device ID, the time when the position was sampled on the device, the time that the service received the update, and the most recent coordinates.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListDevicePositionsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the tracker resource details.</p>
 Required parameters: [DeviceId, Position, SampleTime]
 */
@interface AWSLocationListDevicePositionsResponseEntry : AWSModel


/**
 <p>The ID of the device for this position.</p>
 */
@property (nonatomic, strong) NSString * _Nullable deviceId;

/**
 <p>The last known device position. Empty if no positions currently stored.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

/**
 <p>The timestamp at which the device position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable sampleTime;

@end

/**
 
 */
@interface AWSLocationListGeofenceCollectionsRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListGeofenceCollectionsResponse : AWSModel


/**
 <p>Lists the geofence collections that exist in your AWS account.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListGeofenceCollectionsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the geofence collection details.</p>
 Required parameters: [CollectionName, CreateTime, Description, PricingPlan, UpdateTime]
 */
@interface AWSLocationListGeofenceCollectionsResponseEntry : AWSModel


/**
 <p>The name of the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The timestamp for when the geofence collection was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The description for the geofence collection</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The pricing plan for the specified geofence collection.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The specified data provider for the geofence collection.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>Specifies a timestamp for when the resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Contains a list of geofences stored in a given geofence collection.</p>
 Required parameters: [CreateTime, GeofenceId, Geometry, Status, UpdateTime]
 */
@interface AWSLocationListGeofenceResponseEntry : AWSModel


/**
 <p>The timestamp for when the geofence was stored in a geofence collection in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence identifier.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Contains the geofence geometry details describing a polygon.</p>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

/**
 <p>Identifies the state of the geofence. A geofence will hold one of the following states:</p><ul><li><p><code>ACTIVE</code> — The geofence has been indexed by the system. </p></li><li><p><code>PENDING</code> — The geofence is being processed by the system.</p></li><li><p><code>FAILED</code> — The geofence failed to be indexed by the system.</p></li><li><p><code>DELETED</code> — The geofence has been deleted from the system index.</p></li><li><p><code>DELETING</code> — The geofence is being deleted from the system index.</p></li></ul>
 */
@property (nonatomic, strong) NSString * _Nullable status;

/**
 <p>The timestamp for when the geofence was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListGeofencesRequest : AWSRequest


/**
 <p>The name of the geofence collection storing the list of geofences.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListGeofencesResponse : AWSModel


/**
 <p>Contains a list of geofences stored in the geofence collection.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListGeofenceResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListMapsRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListMapsResponse : AWSModel


/**
 <p>Contains a list of maps in your AWS account</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListMapsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains details of an existing map resource in your AWS account.</p>
 Required parameters: [CreateTime, DataSource, Description, MapName, PricingPlan, UpdateTime]
 */
@interface AWSLocationListMapsResponseEntry : AWSModel


/**
 <p>The timestamp for when the map resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>Specifies the data provider for the associated map tiles.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The description for the map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the associated map resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable mapName;

/**
 <p>The pricing plan for the specified map resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The timestamp for when the map resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListPlaceIndexesRequest : AWSRequest


/**
 <p>An optional limit for the maximum number of results returned in a single call.</p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListPlaceIndexesResponse : AWSModel


/**
 <p>Lists the place index resources that exist in your AWS account</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListPlaceIndexesResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A place index resource listed in your AWS account.</p>
 Required parameters: [CreateTime, DataSource, Description, IndexName, PricingPlan, UpdateTime]
 */
@interface AWSLocationListPlaceIndexesResponseEntry : AWSModel


/**
 <p>The timestamp for when the place index resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of geospatial data. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Here</code></p></li></ul><p>For additional details on data providers, see the <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers page</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description for the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The name of the place index resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>The pricing plan for the specified place index resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The timestamp for when the place index resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListRouteCalculatorsRequest : AWSRequest


/**
 <p>An optional maximum number of results returned in a single call.</p><p>Default Value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p><p>Default Value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListRouteCalculatorsResponse : AWSModel


/**
 <p>Lists the route calculator resources that exist in your AWS account</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListRouteCalculatorsResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a subsequent request to fetch the next set of results.</p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>A route calculator resource listed in your AWS account.</p>
 Required parameters: [CalculatorName, CreateTime, DataSource, Description, PricingPlan, UpdateTime]
 */
@interface AWSLocationListRouteCalculatorsResponseEntry : AWSModel


/**
 <p>The name of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable calculatorName;

/**
 <p>The timestamp when the route calculator resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The data provider of traffic and road network data. Indicates one of the available providers:</p><ul><li><p><code>Esri</code></p></li><li><p><code>Here</code></p></li></ul><p>For more information about data providers, see <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>The optional description of the route calculator resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The pricing plan for the specified route calculator resource.</p><p>For additional details and restrictions on each pricing plan option, see <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The timestamp when the route calculator resource was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p><ul><li><p>For example, <code>2020–07-2T12:15:20.000Z+01:00</code></p></li></ul>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 
 */
@interface AWSLocationListTagsForResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

@end

/**
 
 */
@interface AWSLocationListTagsForResourceResponse : AWSModel


/**
 <p>The mapping from tag key to tag value for each tag associated with the specified resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationListTrackerConsumersRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

/**
 <p>The tracker resource whose associated geofence collections you want to list.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

@end

/**
 
 */
@interface AWSLocationListTrackerConsumersResponse : AWSModel


/**
 <p>Contains the list of geofence collection ARNs associated to the tracker resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable consumerArns;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListTrackersRequest : AWSRequest


/**
 <p>An optional limit for the number of resources returned in a single call. </p><p>Default value: <code>100</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p><p>Default value: <code>null</code></p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 
 */
@interface AWSLocationListTrackersResponse : AWSModel


/**
 <p>Contains tracker resources in your AWS account. Details include tracker name, description and timestamps for when the tracker was created and last updated.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationListTrackersResponseEntry *> * _Nullable entries;

/**
 <p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>
 */
@property (nonatomic, strong) NSString * _Nullable nextToken;

@end

/**
 <p>Contains the tracker resource details.</p>
 Required parameters: [CreateTime, Description, PricingPlan, TrackerName, UpdateTime]
 */
@interface AWSLocationListTrackersResponseEntry : AWSModel


/**
 <p>The timestamp for when the tracker resource was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The description for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable detail;

/**
 <p>The pricing plan for the specified tracker resource.</p><p>For additional details and restrictions on each pricing plan option, see the <a href="https://aws.amazon.com/location/pricing/">Amazon Location Service pricing page</a>.</p>
 */
@property (nonatomic, assign) AWSLocationPricingPlan pricingPlan;

/**
 <p>The specified data provider for the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable pricingPlanDataSource;

/**
 <p>The name of the tracker resource.</p>
 */
@property (nonatomic, strong) NSString * _Nullable trackerName;

/**
 <p>The timestamp at which the device's position was determined. Uses <a href="https://www.iso.org/iso-8601-date-and-time-format.html"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Specifies the map tile style selected from an available provider.</p>
 Required parameters: [Style]
 */
@interface AWSLocationMapConfiguration : AWSModel


/**
 <p>Specifies the map style selected from an available data provider.</p><p>Valid styles: <code>RasterEsriImagery</code>, <code>VectorEsriStreets</code>, <code>VectorEsriTopographic</code>, <code>VectorEsriNavigation</code>, <code>VectorEsriDarkGrayCanvas</code>, <code>VectorEsriLightGrayCanvas</code>, <code>VectorHereBerlin</code>.</p><note><p>When using HERE as your data provider, and selecting the Style <code>VectorHereBerlin</code>, you may not use HERE Maps for Asset Management. See the <a href="https://aws.amazon.com/service-terms/">AWS Service Terms</a> for Amazon Location Service.</p></note>
 */
@property (nonatomic, strong) NSString * _Nullable style;

@end

/**
 <p>Contains details about addresses or points of interest that match the search criteria.</p>
 Required parameters: [Geometry]
 */
@interface AWSLocationPlace : AWSModel


/**
 <p>The numerical portion of an address, such as a building number. </p>
 */
@property (nonatomic, strong) NSString * _Nullable addressNumber;

/**
 <p>A country/region specified using <a href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit country/region code. For example, <code>CAN</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable country;

/**
 <p>Places uses a point geometry to specify a location or a Place.</p>
 */
@property (nonatomic, strong) AWSLocationPlaceGeometry * _Nullable geometry;

/**
 <p>The full name and address of the point of interest such as a city, region, or country. For example, <code>123 Any Street, Any Town, USA</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable label;

/**
 <p>A name for a local area, such as a city or town name. For example, <code>Toronto</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable municipality;

/**
 <p>The name of a community district. For example, <code>Downtown</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable neighborhood;

/**
 <p>A group of numbers and letters in a country-specific format, which accompanies the address for the purpose of identifying a location. </p>
 */
@property (nonatomic, strong) NSString * _Nullable postalCode;

/**
 <p>A name for an area or geographical division, such as a province or state name. For example, <code>British Columbia</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable region;

/**
 <p>The name for a street or a road to identify a location. For example, <code>Main Street</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable street;

/**
 <p>A country, or an area that's part of a larger region . For example, <code>Metro Vancouver</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable subRegion;

@end

/**
 <p>Places uses a point geometry to specify a location or a Place.</p>
 */
@interface AWSLocationPlaceGeometry : AWSModel


/**
 <p>A single point geometry specifies a location for a Place using <a href="https://gisgeography.com/wgs84-world-geodetic-system/">WGS 84</a> coordinates:</p><ul><li><p><i>x</i> — Specifies the x coordinate or longitude. </p></li><li><p><i>y</i> — Specifies the y coordinate or latitude. </p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable point;

@end

/**
 
 */
@interface AWSLocationPutGeofenceRequest : AWSRequest


/**
 <p>The geofence collection to store the geofence in.</p>
 */
@property (nonatomic, strong) NSString * _Nullable collectionName;

/**
 <p>An identifier for the geofence. For example, <code>ExampleGeofence-1</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>Contains the polygon details to specify the position of the geofence.</p><note><p>Each <a href="https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html">geofence polygon</a> can have a maximum of 1,000 vertices.</p></note>
 */
@property (nonatomic, strong) AWSLocationGeofenceGeometry * _Nullable geometry;

@end

/**
 
 */
@interface AWSLocationPutGeofenceResponse : AWSModel


/**
 <p>The timestamp for when the geofence was created in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable createTime;

/**
 <p>The geofence identifier entered in the request.</p>
 */
@property (nonatomic, strong) NSString * _Nullable geofenceId;

/**
 <p>The timestamp for when the geofence was last updated in <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code></p>
 */
@property (nonatomic, strong) NSDate * _Nullable updateTime;

@end

/**
 <p>Specifies a single point of interest, or Place as a result of a search query obtained from a dataset configured in the place index resource.</p>
 Required parameters: [Place]
 */
@interface AWSLocationSearchForPositionResult : AWSModel


/**
 <p>Contains details about the relevant point of interest.</p>
 */
@property (nonatomic, strong) AWSLocationPlace * _Nullable place;

@end

/**
 <p>Contains relevant Places returned by calling <code>SearchPlaceIndexForText</code>.</p>
 Required parameters: [Place]
 */
@interface AWSLocationSearchForTextResult : AWSModel


/**
 <p>Contains details about the relevant point of interest.</p>
 */
@property (nonatomic, strong) AWSLocationPlace * _Nullable place;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForPositionRequest : AWSRequest


/**
 <p>The name of the place index resource you want to use for the search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>An optional paramer. The maximum number of results returned per request. </p><p>Default value: <code>50</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>Specifies a coordinate for the query defined by a longitude, and latitude.</p><ul><li><p>The first position is the X coordinate, or longitude.</p></li><li><p>The second position is the Y coordinate, or latitude. </p></li></ul><p>For example, <code>position=xLongitude&amp;position=yLatitude</code> .</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForPositionResponse : AWSModel


/**
 <p>Returns a list of Places closest to the specified position. Each result contains additional information about the Places returned.</p>
 */
@property (nonatomic, strong) NSArray<AWSLocationSearchForPositionResult *> * _Nullable results;

/**
 <p>Contains a summary of the request.</p>
 */
@property (nonatomic, strong) AWSLocationSearchPlaceIndexForPositionSummary * _Nullable summary;

@end

/**
 <p>A summary of the reverse geocoding request sent using <code>SearchPlaceIndexForPosition</code>.</p>
 Required parameters: [DataSource, Position]
 */
@interface AWSLocationSearchPlaceIndexForPositionSummary : AWSModel


/**
 <p>The data provider of geospatial data. Indicates one of the available providers:</p><ul><li><p>Esri</p></li><li><p>HERE</p></li></ul><p>For additional details on data providers, see the <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers page</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>An optional parameter. The maximum number of results returned per request. </p><p>Default value: <code>50</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The position given in the reverse geocoding request.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable position;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForTextRequest : AWSRequest


/**
 <p>Searches for results closest to the given position. An optional parameter defined by longitude, and latitude.</p><ul><li><p>The first <code>bias</code> position is the X coordinate, or longitude.</p></li><li><p>The second <code>bias</code> position is the Y coordinate, or latitude. </p></li></ul><p>For example, <code>bias=xLongitude&amp;bias=yLatitude</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable biasPosition;

/**
 <p>Filters the results by returning only Places within the provided bounding box. An optional parameter.</p><p>The first 2 <code>bbox</code> parameters describe the lower southwest corner:</p><ul><li><p>The first <code>bbox</code> position is the X coordinate or longitude of the lower southwest corner.</p></li><li><p>The second <code>bbox</code> position is the Y coordinate or latitude of the lower southwest corner.</p></li></ul><p>For example, <code>bbox=xLongitudeSW&amp;bbox=yLatitudeSW</code>.</p><p>The next <code>bbox</code> parameters describe the upper northeast corner:</p><ul><li><p>The third <code>bbox</code> position is the X coordinate, or longitude of the upper northeast corner.</p></li><li><p>The fourth <code>bbox</code> position is the Y coordinate, or longitude of the upper northeast corner.</p></li></ul><p>For example, <code>bbox=xLongitudeNE&amp;bbox=yLatitudeNE</code></p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable filterBBox;

/**
 <p>Limits the search to the given a list of countries/regions. An optional parameter.</p><ul><li><p>Use the <a href="https://www.iso.org/iso-3166-country-codes.html">ISO 3166</a> 3-digit country code. For example, Australia uses three upper-case characters: <code>AUS</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCountries;

/**
 <p>The name of the place index resource you want to use for the search.</p>
 */
@property (nonatomic, strong) NSString * _Nullable indexName;

/**
 <p>An optional parameter. The maximum number of results returned per request. </p><p>The default: <code>50</code></p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>The address, name, city, or region to be used in the search. In free-form text format. For example, <code>123 Any Street</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 
 */
@interface AWSLocationSearchPlaceIndexForTextResponse : AWSModel


/**
 <p>A list of Places closest to the specified position. Each result contains additional information about the specific point of interest. </p>
 */
@property (nonatomic, strong) NSArray<AWSLocationSearchForTextResult *> * _Nullable results;

/**
 <p>Contains a summary of the request. Contains the <code>BiasPosition</code>, <code>DataSource</code>, <code>FilterBBox</code>, <code>FilterCountries</code>, <code>MaxResults</code>, <code>ResultBBox</code>, and <code>Text</code>.</p>
 */
@property (nonatomic, strong) AWSLocationSearchPlaceIndexForTextSummary * _Nullable summary;

@end

/**
 <p>A summary of the geocoding request sent using <code>SearchPlaceIndexForText</code>.</p>
 Required parameters: [DataSource, Text]
 */
@interface AWSLocationSearchPlaceIndexForTextSummary : AWSModel


/**
 <p>Contains the coordinates for the bias position entered in the geocoding request.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable biasPosition;

/**
 <p>The data provider of geospatial data. Indicates one of the available providers:</p><ul><li><p>Esri</p></li><li><p>HERE</p></li></ul><p>For additional details on data providers, see the <a href="https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html">Amazon Location Service data providers page</a>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable dataSource;

/**
 <p>Contains the coordinates for the optional bounding box coordinated entered in the geocoding request.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable filterBBox;

/**
 <p>Contains the country filter entered in the geocoding request.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterCountries;

/**
 <p>Contains the maximum number of results indicated for the request.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable maxResults;

/**
 <p>A bounding box that contains the search results within the specified area indicated by <code>FilterBBox</code>. A subset of bounding box specified using <code>FilterBBox</code>.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable resultBBox;

/**
 <p>The address, name, city or region to be used in the geocoding request. In free-form text format. For example, <code>Vancouver</code>.</p>
 */
@property (nonatomic, strong) NSString * _Nullable text;

@end

/**
 <p> Represents an element of a leg within a route. A step contains instructions for how to move to the next step in the leg. </p>
 Required parameters: [Distance, DurationSeconds, EndPosition, StartPosition]
 */
@interface AWSLocationStep : AWSModel


/**
 <p>The travel distance between the step's <code>StartPosition</code> and <code>EndPosition</code>.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable distance;

/**
 <p>The estimated travel time, in seconds, from the step's <code>StartPosition</code> to the <code>EndPosition</code>. . The travel mode and departure time that you specify in the request determines the calculated time.</p>
 */
@property (nonatomic, strong) NSNumber * _Nullable durationSeconds;

/**
 <p>The end position of a step. If the position the last step in the leg, this position is the same as the end position of the leg.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable endPosition;

/**
 <p>Represents the start position, or index, in a sequence of steps within the leg's line string geometry. For example, the index of the first step in a leg geometry is <code>0</code>. </p><p>Included in the response for queries that set <code>IncludeLegGeometry</code> to <code>True</code>. </p>
 */
@property (nonatomic, strong) NSNumber * _Nullable geometryOffset;

/**
 <p>The starting position of a step. If the position is the first step in the leg, this position is the same as the start position of the leg.</p>
 */
@property (nonatomic, strong) NSArray<NSNumber *> * _Nullable startPosition;

@end

/**
 
 */
@interface AWSLocationTagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource whose tags you want to update.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The mapping from tag key to tag value for each tag associated with the specified resource.</p>
 */
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> * _Nullable tags;

@end

/**
 
 */
@interface AWSLocationTagResourceResponse : AWSModel


@end

/**
 <p>Contains details about the truck dimensions in the unit of measurement that you specify. Used to filter out roads that can't support or allow the specified dimensions for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>
 */
@interface AWSLocationTruckDimensions : AWSModel


/**
 <p>The height of the truck.</p><ul><li><p>For example, <code>4.5</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable height;

/**
 <p>The length of the truck.</p><ul><li><p>For example, <code>15.5</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable length;

/**
 <p> Specifies the unit of measurement for the truck dimensions.</p><p>Default Value: <code>Meters</code></p>
 */
@property (nonatomic, assign) AWSLocationDimensionUnit unit;

/**
 <p>The width of the truck.</p><ul><li><p>For example, <code>4.5</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable width;

@end

/**
 <p>Contains details about the truck's weight specifications. Used to avoid roads that can't support or allow the total weight for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>
 */
@interface AWSLocationTruckWeight : AWSModel


/**
 <p>The total weight of the truck. </p><ul><li><p>For example, <code>3500</code>.</p></li></ul>
 */
@property (nonatomic, strong) NSNumber * _Nullable total;

/**
 <p>The unit of measurement to use for the truck weight.</p><p>Default Value: <code>Kilograms</code></p>
 */
@property (nonatomic, assign) AWSLocationVehicleWeightUnit unit;

@end

/**
 
 */
@interface AWSLocationUntagResourceRequest : AWSRequest


/**
 <p>The Amazon Resource Name (ARN) of the resource from which you want to remove tags.</p>
 */
@property (nonatomic, strong) NSString * _Nullable resourceArn;

/**
 <p>The list of tag keys to remove from the resource.</p>
 */
@property (nonatomic, strong) NSArray<NSString *> * _Nullable tagKeys;

@end

/**
 
 */
@interface AWSLocationUntagResourceResponse : AWSModel


@end

/**
 <p>The input failed to meet the constraints specified by the AWS service in a specified field. </p>
 Required parameters: [Message, Name]
 */
@interface AWSLocationValidationExceptionField : AWSModel


/**
 <p>A message with the reason for the validation exception error.</p>
 */
@property (nonatomic, strong) NSString * _Nullable message;

/**
 <p>The field name where the invalid entry was detected.</p>
 */
@property (nonatomic, strong) NSString * _Nullable name;

@end

NS_ASSUME_NONNULL_END
