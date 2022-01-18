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

#import "AWSRekognitionResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSRekognitionResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSRekognitionResources

+ (instancetype)sharedInstance {
    static AWSRekognitionResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSRekognitionResources new];
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
    \"apiVersion\":\"2016-06-27\",\
    \"endpointPrefix\":\"rekognition\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Rekognition\",\
    \"serviceId\":\"Rekognition\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"RekognitionService\",\
    \"uid\":\"rekognition-2016-06-27\"\
  },\
  \"operations\":{\
    \"CompareFaces\":{\
      \"name\":\"CompareFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CompareFacesRequest\"},\
      \"output\":{\"shape\":\"CompareFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Compares a face in the <i>source</i> input image with each of the 100 largest faces detected in the <i>target</i> input image. </p> <p> If the source image contains multiple faces, the service detects the largest face and compares it with each face detected in the target image. </p> <note> <p>CompareFaces uses machine learning algorithms, which are probabilistic. A false negative is an incorrect prediction that a face in the target image has a low similarity confidence score when compared to the face in the source image. To reduce the probability of false negatives, we recommend that you compare the target image against multiple source images. If you plan to use <code>CompareFaces</code> to make a decision that impacts an individual's rights, privacy, or access to services, we recommend that you pass the result to a human for review and further validation before taking action.</p> </note> <p>You pass the input and target images either as base64-encoded image bytes or as references to images in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. </p> <p>In response, the operation returns an array of face matches ordered by similarity score in descending order. For each face match, the response provides a bounding box of the face, facial landmarks, pose details (pitch, roll, and yaw), quality (brightness and sharpness), and confidence value (indicating the level of confidence that the bounding box contains a face). The response also provides a similarity score, which indicates how closely the faces match. </p> <note> <p>By default, only faces with a similarity score of greater than or equal to 80% are returned in the response. You can change this value by specifying the <code>SimilarityThreshold</code> parameter.</p> </note> <p> <code>CompareFaces</code> also returns an array of faces that don't match the source image. For each face, it returns a bounding box, confidence value, landmarks, pose details, and quality. The response also returns information about the face in the source image, including the bounding box of the face and confidence value.</p> <p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that donât meet a required quality bar. The quality bar is based on a variety of common use cases. Use <code>QualityFilter</code> to set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. The default value is <code>NONE</code>. </p> <p>If the image doesn't contain Exif metadata, <code>CompareFaces</code> returns orientation information for the source and target images. Use these values to display the images with the correct image orientation.</p> <p>If no faces are detected in the source or target images, <code>CompareFaces</code> returns an <code>InvalidParameterException</code> error. </p> <note> <p> This is a stateless API operation. That is, data returned by this operation doesn't persist.</p> </note> <p>For an example, see Comparing Faces in Images in the Amazon Rekognition Developer Guide.</p> <p>This operation requires permissions to perform the <code>rekognition:CompareFaces</code> action.</p>\"\
    },\
    \"CreateCollection\":{\
      \"name\":\"CreateCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCollectionRequest\"},\
      \"output\":{\"shape\":\"CreateCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a collection in an AWS Region. You can add faces to the collection using the <a>IndexFaces</a> operation. </p> <p>For example, you might create collections, one for each of your application users. A user can then index faces using the <code>IndexFaces</code> operation and persist results in a specific collection. Then, a user can search the collection for faces in the user-specific container. </p> <p>When you create a collection, it is associated with the latest version of the face model version.</p> <note> <p>Collection names are case-sensitive.</p> </note> <p>This operation requires permissions to perform the <code>rekognition:CreateCollection</code> action. If you want to tag your collection, you also require permission to perform the <code>rekognition:TagResource</code> operation.</p>\"\
    },\
    \"CreateDataset\":{\
      \"name\":\"CreateDataset\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDatasetRequest\"},\
      \"output\":{\"shape\":\"CreateDatasetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Amazon Rekognition Custom Labels dataset. You can create a dataset by using an Amazon Sagemaker format manifest file or by copying an existing Amazon Rekognition Custom Labels dataset.</p> <p>To create a training dataset for a project, specify <code>train</code> for the value of <code>DatasetType</code>. To create the test dataset for a project, specify <code>test</code> for the value of <code>DatasetType</code>. </p> <p>The response from <code>CreateDataset</code> is the Amazon Resource Name (ARN) for the dataset. Creating a dataset takes a while to complete. Use <a>DescribeDataset</a> to check the current status. The dataset created successfully if the value of <code>Status</code> is <code>CREATE_COMPLETE</code>. </p> <p>To check if any non-terminal errors occurred, call <a>ListDatasetEntries</a> and check for the presence of <code>errors</code> lists in the JSON Lines.</p> <p>Dataset creation fails if a terminal error occurs (<code>Status</code> = <code>CREATE_FAILED</code>). Currently, you can't access the terminal error information. </p> <p>For more information, see Creating dataset in the <i>Amazon Rekognition Custom Labels Developer Guide</i>.</p> <p>This operation requires permissions to perform the <code>rekognition:CreateDataset</code> action. If you want to copy an existing dataset, you also require permission to perform the <code>rekognition:ListDatasetEntries</code> action.</p>\"\
    },\
    \"CreateProject\":{\
      \"name\":\"CreateProject\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateProjectRequest\"},\
      \"output\":{\"shape\":\"CreateProjectResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Amazon Rekognition Custom Labels project. A project is a group of resources (datasets, model versions) that you use to create and manage Amazon Rekognition Custom Labels models. </p> <p>This operation requires permissions to perform the <code>rekognition:CreateProject</code> action.</p>\"\
    },\
    \"CreateProjectVersion\":{\
      \"name\":\"CreateProjectVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateProjectVersionRequest\"},\
      \"output\":{\"shape\":\"CreateProjectVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a new version of a model and begins training. Models are managed as part of an Amazon Rekognition Custom Labels project. The response from <code>CreateProjectVersion</code> is an Amazon Resource Name (ARN) for the version of the model. </p> <p>Training uses the training and test datasets associated with the project. For more information, see Creating training and test dataset in the <i>Amazon Rekognition Custom Labels Developer Guide</i>. </p> <note> <p>You can train a modelin a project that doesn't have associated datasets by specifying manifest files in the <code>TrainingData</code> and <code>TestingData</code> fields. </p> <p>If you open the console after training a model with manifest files, Amazon Rekognition Custom Labels creates the datasets for you using the most recent manifest files. You can no longer train a model version for the project by specifying manifest files. </p> <p>Instead of training with a project without associated datasets, we recommend that you use the manifest files to create training and test datasets for the project.</p> </note> <p>Training takes a while to complete. You can get the current status by calling <a>DescribeProjectVersions</a>. Training completed successfully if the value of the <code>Status</code> field is <code>TRAINING_COMPLETED</code>.</p> <p>If training fails, see Debugging a failed model training in the <i>Amazon Rekognition Custom Labels</i> developer guide. </p> <p>Once training has successfully completed, call <a>DescribeProjectVersions</a> to get the training results and evaluate the model. For more information, see Improving a trained Amazon Rekognition Custom Labels model in the <i>Amazon Rekognition Custom Labels</i> developers guide. </p> <p>After evaluating the model, you start the model by calling <a>StartProjectVersion</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:CreateProjectVersion</code> action.</p>\"\
    },\
    \"CreateStreamProcessor\":{\
      \"name\":\"CreateStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"CreateStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces in a streaming video.</p> <p>Amazon Rekognition Video is a consumer of live video from Amazon Kinesis Video Streams. Amazon Rekognition Video sends analysis results to Amazon Kinesis Data Streams.</p> <p>You provide as input a Kinesis video stream (<code>Input</code>) and a Kinesis data stream (<code>Output</code>) stream. You also specify the face recognition criteria in <code>Settings</code>. For example, the collection containing faces that you want to recognize. Use <code>Name</code> to assign an identifier for the stream processor. You use <code>Name</code> to manage the stream processor. For example, you can start processing the source video by calling <a>StartStreamProcessor</a> with the <code>Name</code> field. </p> <p>After you have finished analyzing a streaming video, use <a>StopStreamProcessor</a> to stop processing. You can delete the stream processor by calling <a>DeleteStreamProcessor</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:CreateStreamProcessor</code> action. If you want to tag your stream processor, you also require permission to perform the <code>rekognition:TagResource</code> operation.</p>\"\
    },\
    \"DeleteCollection\":{\
      \"name\":\"DeleteCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCollectionRequest\"},\
      \"output\":{\"shape\":\"DeleteCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified collection. Note that this operation removes all faces in the collection. For an example, see <a>delete-collection-procedure</a>.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteCollection</code> action.</p>\"\
    },\
    \"DeleteDataset\":{\
      \"name\":\"DeleteDataset\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDatasetRequest\"},\
      \"output\":{\"shape\":\"DeleteDatasetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing Amazon Rekognition Custom Labels dataset. Deleting a dataset might take while. Use <a>DescribeDataset</a> to check the current status. The dataset is still deleting if the value of <code>Status</code> is <code>DELETE_IN_PROGRESS</code>. If you try to access the dataset after it is deleted, you get a <code>ResourceNotFoundException</code> exception. </p> <p>You can't delete a dataset while it is creating (<code>Status</code> = <code>CREATE_IN_PROGRESS</code>) or if the dataset is updating (<code>Status</code> = <code>UPDATE_IN_PROGRESS</code>).</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteDataset</code> action.</p>\"\
    },\
    \"DeleteFaces\":{\
      \"name\":\"DeleteFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteFacesRequest\"},\
      \"output\":{\"shape\":\"DeleteFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove from the collection.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteFaces</code> action.</p>\"\
    },\
    \"DeleteProject\":{\
      \"name\":\"DeleteProject\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteProjectRequest\"},\
      \"output\":{\"shape\":\"DeleteProjectResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon Rekognition Custom Labels project. To delete a project you must first delete all models associated with the project. To delete a model, see <a>DeleteProjectVersion</a>.</p> <p> <code>DeleteProject</code> is an asynchronous operation. To check if the project is deleted, call <a>DescribeProjects</a>. The project is deleted when the project no longer appears in the response.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteProject</code> action. </p>\"\
    },\
    \"DeleteProjectVersion\":{\
      \"name\":\"DeleteProjectVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteProjectVersionRequest\"},\
      \"output\":{\"shape\":\"DeleteProjectVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon Rekognition Custom Labels model. </p> <p>You can't delete a model if it is running or if it is training. To check the status of a model, use the <code>Status</code> field returned from <a>DescribeProjectVersions</a>. To stop a running model call <a>StopProjectVersion</a>. If the model is training, wait until it finishes.</p> <p>This operation requires permissions to perform the <code>rekognition:DeleteProjectVersion</code> action. </p>\"\
    },\
    \"DeleteStreamProcessor\":{\
      \"name\":\"DeleteStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"DeleteStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Deletes the stream processor identified by <code>Name</code>. You assign the value for <code>Name</code> when you create the stream processor with <a>CreateStreamProcessor</a>. You might not be able to use the same name for a stream processor for a few seconds after calling <code>DeleteStreamProcessor</code>.</p>\"\
    },\
    \"DescribeCollection\":{\
      \"name\":\"DescribeCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeCollectionRequest\"},\
      \"output\":{\"shape\":\"DescribeCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified collection. You can use <code>DescribeCollection</code> to get information, such as the number of faces indexed into a collection and the version of the model used by the collection for face detection.</p> <p>For more information, see Describing a Collection in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"DescribeDataset\":{\
      \"name\":\"DescribeDataset\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDatasetRequest\"},\
      \"output\":{\"shape\":\"DescribeDatasetResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p> Describes an Amazon Rekognition Custom Labels dataset. You can get information such as the current status of a dataset and statistics about the images and labels in a dataset. </p> <p>This operation requires permissions to perform the <code>rekognition:DescribeDataset</code> action.</p>\"\
    },\
    \"DescribeProjectVersions\":{\
      \"name\":\"DescribeProjectVersions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeProjectVersionsRequest\"},\
      \"output\":{\"shape\":\"DescribeProjectVersionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Lists and describes the versions of a model in an Amazon Rekognition Custom Labels project. You can specify up to 10 model versions in <code>ProjectVersionArns</code>. If you don't specify a value, descriptions for all model versions in the project are returned.</p> <p>This operation requires permissions to perform the <code>rekognition:DescribeProjectVersions</code> action.</p>\"\
    },\
    \"DescribeProjects\":{\
      \"name\":\"DescribeProjects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeProjectsRequest\"},\
      \"output\":{\"shape\":\"DescribeProjectsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets information about your Amazon Rekognition Custom Labels projects. </p> <p>This operation requires permissions to perform the <code>rekognition:DescribeProjects</code> action.</p>\"\
    },\
    \"DescribeStreamProcessor\":{\
      \"name\":\"DescribeStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"DescribeStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Provides information about a stream processor created by <a>CreateStreamProcessor</a>. You can get information about the input and output streams, the input parameters for the face recognition being performed, and the current status of the stream processor.</p>\"\
    },\
    \"DetectCustomLabels\":{\
      \"name\":\"DetectCustomLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectCustomLabelsRequest\"},\
      \"output\":{\"shape\":\"DetectCustomLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceNotReadyException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects custom labels in a supplied image by using an Amazon Rekognition Custom Labels model. </p> <p>You specify which version of a model version to use by using the <code>ProjectVersionArn</code> input parameter. </p> <p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p> For each object that the model version detects on an image, the API returns a (<code>CustomLabel</code>) object in an array (<code>CustomLabels</code>). Each <code>CustomLabel</code> object provides the label name (<code>Name</code>), the level of confidence that the image contains the object (<code>Confidence</code>), and object location information, if it exists, for the label on the image (<code>Geometry</code>). </p> <p>To filter labels that are returned, specify a value for <code>MinConfidence</code>. <code>DetectCustomLabelsLabels</code> only returns labels with a confidence that's higher than the specified value. The value of <code>MinConfidence</code> maps to the assumed threshold values created during training. For more information, see <i>Assumed threshold</i> in the Amazon Rekognition Custom Labels Developer Guide. Amazon Rekognition Custom Labels metrics expresses an assumed threshold as a floating point value between 0-1. The range of <code>MinConfidence</code> normalizes the threshold value to a percentage value (0-100). Confidence responses from <code>DetectCustomLabels</code> are also returned as a percentage. You can use <code>MinConfidence</code> to change the precision and recall or your model. For more information, see <i>Analyzing an image</i> in the Amazon Rekognition Custom Labels Developer Guide. </p> <p>If you don't specify a value for <code>MinConfidence</code>, <code>DetectCustomLabels</code> returns labels based on the assumed threshold of each label.</p> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectCustomLabels</code> action. </p> <p>For more information, see <i>Analyzing an image</i> in the Amazon Rekognition Custom Labels Developer Guide. </p>\"\
    },\
    \"DetectFaces\":{\
      \"name\":\"DetectFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectFacesRequest\"},\
      \"output\":{\"shape\":\"DetectFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects faces within an image that is provided as input.</p> <p> <code>DetectFaces</code> detects the 100 largest faces in the image. For each face detected, the operation returns face details. These details include a bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed set of attributes such as facial landmarks (for example, coordinates of eye and mouth), presence of beard, sunglasses, and so on. </p> <p>The face-detection algorithm is most effective on frontal faces. For non-frontal or obscured faces, the algorithm might not detect the faces or might detect faces with lower confidence. </p> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <note> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> </note> <p>This operation requires permissions to perform the <code>rekognition:DetectFaces</code> action. </p>\"\
    },\
    \"DetectLabels\":{\
      \"name\":\"DetectLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectLabelsRequest\"},\
      \"output\":{\"shape\":\"DetectLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; and concepts like landscape, evening, and nature. </p> <p>For an example, see Analyzing Images Stored in an Amazon S3 Bucket in the Amazon Rekognition Developer Guide.</p> <note> <p> <code>DetectLabels</code> does not support the detection of activities. However, activity detection is supported for label detection in videos. For more information, see StartLabelDetection in the Amazon Rekognition Developer Guide.</p> </note> <p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p> For each object, scene, and concept the API returns one or more labels. Each label provides the object name, and the level of confidence that the image contains the object. For example, suppose the input image has a lighthouse, the sea, and a rock. The response includes all three labels, one for each object. </p> <p> <code>{Name: lighthouse, Confidence: 98.4629}</code> </p> <p> <code>{Name: rock,Confidence: 79.2097}</code> </p> <p> <code> {Name: sea,Confidence: 75.061}</code> </p> <p>In the preceding example, the operation returns one label for each of the three objects. The operation can also return multiple labels for the same object in the image. For example, if the input image shows a flower (for example, a tulip), the operation might return the following three labels. </p> <p> <code>{Name: flower,Confidence: 99.0562}</code> </p> <p> <code>{Name: plant,Confidence: 99.0562}</code> </p> <p> <code>{Name: tulip,Confidence: 99.0562}</code> </p> <p>In this example, the detection algorithm more precisely identifies the flower as a tulip.</p> <p>In response, the API returns an array of labels. In addition, the response also includes the orientation correction. Optionally, you can specify <code>MinConfidence</code> to control the confidence threshold for the labels returned. The default is 55%. You can also add the <code>MaxLabels</code> parameter to limit the number of labels returned. </p> <note> <p>If the object detected is a person, the operation doesn't provide the same facial details that the <a>DetectFaces</a> operation provides.</p> </note> <p> <code>DetectLabels</code> returns bounding boxes for instances of common object labels in an array of <a>Instance</a> objects. An <code>Instance</code> object contains a <a>BoundingBox</a> object, for the location of the label on the image. It also includes the confidence by which the bounding box was detected.</p> <p> <code>DetectLabels</code> also returns a hierarchical taxonomy of detected labels. For example, a detected car might be assigned the label <i>car</i>. The label <i>car</i> has two parent labels: <i>Vehicle</i> (its parent) and <i>Transportation</i> (its grandparent). The response returns the entire list of ancestors for a label. Each ancestor is a unique label in the response. In the previous example, <i>Car</i>, <i>Vehicle</i>, and <i>Transportation</i> are returned as unique labels in the response. </p> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectLabels</code> action. </p>\"\
    },\
    \"DetectModerationLabels\":{\
      \"name\":\"DetectModerationLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectModerationLabelsRequest\"},\
      \"output\":{\"shape\":\"DetectModerationLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"},\
        {\"shape\":\"HumanLoopQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Detects unsafe content in a specified JPEG or PNG format image. Use <code>DetectModerationLabels</code> to moderate images depending on your requirements. For example, you might want to filter images that contain nudity, but not images containing suggestive content.</p> <p>To filter images, use the labels returned by <code>DetectModerationLabels</code> to determine which types of content are appropriate.</p> <p>For information about moderation labels, see Detecting Unsafe Content in the Amazon Rekognition Developer Guide.</p> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p>\"\
    },\
    \"DetectProtectiveEquipment\":{\
      \"name\":\"DetectProtectiveEquipment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectProtectiveEquipmentRequest\"},\
      \"output\":{\"shape\":\"DetectProtectiveEquipmentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects Personal Protective Equipment (PPE) worn by people detected in an image. Amazon Rekognition can detect the following types of PPE.</p> <ul> <li> <p>Face cover</p> </li> <li> <p>Hand cover</p> </li> <li> <p>Head cover</p> </li> </ul> <p>You pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. The image must be either a PNG or JPG formatted file. </p> <p> <code>DetectProtectiveEquipment</code> detects PPE worn by up to 15 persons detected in an image.</p> <p>For each person detected in the image the API returns an array of body parts (face, head, left-hand, right-hand). For each body part, an array of detected items of PPE is returned, including an indicator of whether or not the PPE covers the body part. The API returns the confidence it has in each detection (person, PPE, body part and body part coverage). It also returns a bounding box (<a>BoundingBox</a>) for each detected person and each detected item of PPE. </p> <p>You can optionally request a summary of detected PPE items with the <code>SummarizationAttributes</code> input parameter. The summary provides the following information. </p> <ul> <li> <p>The persons detected as wearing all of the types of PPE that you specify.</p> </li> <li> <p>The persons detected as not wearing all of the types PPE that you specify.</p> </li> <li> <p>The persons detected where PPE adornment could not be determined. </p> </li> </ul> <p>This is a stateless API operation. That is, the operation does not persist any data.</p> <p>This operation requires permissions to perform the <code>rekognition:DetectProtectiveEquipment</code> action. </p>\"\
    },\
    \"DetectText\":{\
      \"name\":\"DetectText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectTextRequest\"},\
      \"output\":{\"shape\":\"DetectTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Detects text in the input image and converts it into machine-readable text.</p> <p>Pass the input image as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or .jpeg formatted file. </p> <p>The <code>DetectText</code> operation returns text in an array of <a>TextDetection</a> elements, <code>TextDetections</code>. Each <code>TextDetection</code> element provides information about a single word or line of text that was detected in the image. </p> <p>A word is one or more script characters that are not separated by spaces. <code>DetectText</code> can detect up to 100 words in an image.</p> <p>A line is a string of equally spaced words. A line isn't necessarily a complete sentence. For example, a driver's license number is detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there is a large gap between words, relative to the length of the words. This means, depending on the gap between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction. Periods don't represent the end of a line. If a sentence spans multiple lines, the <code>DetectText</code> operation returns multiple lines.</p> <p>To determine whether a <code>TextDetection</code> element is a line of text or a word, use the <code>TextDetection</code> object <code>Type</code> field. </p> <p>To be detected, text must be within +/- 90 degrees orientation of the horizontal axis.</p> <p>For more information, see DetectText in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"DistributeDatasetEntries\":{\
      \"name\":\"DistributeDatasetEntries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DistributeDatasetEntriesRequest\"},\
      \"output\":{\"shape\":\"DistributeDatasetEntriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Distributes the entries (images) in a training dataset across the training dataset and the test dataset for a project. <code>DistributeDatasetEntries</code> moves 20% of the training dataset images to the test dataset. An entry is a JSON Line that describes an image. </p> <p>You supply the Amazon Resource Names (ARN) of a project's training dataset and test dataset. The training dataset must contain the images that you want to split. The test dataset must be empty. The datasets must belong to the same project. To create training and test datasets for a project, call <a>CreateDataset</a>.</p> <p>Distributing a dataset takes a while to complete. To check the status call <code>DescribeDataset</code>. The operation is complete when the <code>Status</code> field for the training dataset and the test dataset is <code>UPDATE_COMPLETE</code>. If the dataset split fails, the value of <code>Status</code> is <code>UPDATE_FAILED</code>.</p> <p>This operation requires permissions to perform the <code>rekognition:DistributeDatasetEntries</code> action.</p>\"\
    },\
    \"GetCelebrityInfo\":{\
      \"name\":\"GetCelebrityInfo\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCelebrityInfoRequest\"},\
      \"output\":{\"shape\":\"GetCelebrityInfoResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets the name and additional information about a celebrity based on their Amazon Rekognition ID. The additional information is returned as an array of URLs. If there is no additional information about the celebrity, this list is empty.</p> <p>For more information, see Recognizing Celebrities in an Image in the Amazon Rekognition Developer Guide.</p> <p>This operation requires permissions to perform the <code>rekognition:GetCelebrityInfo</code> action. </p>\"\
    },\
    \"GetCelebrityRecognition\":{\
      \"name\":\"GetCelebrityRecognition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCelebrityRecognitionRequest\"},\
      \"output\":{\"shape\":\"GetCelebrityRecognitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the celebrity recognition results for a Amazon Rekognition Video analysis started by <a>StartCelebrityRecognition</a>.</p> <p>Celebrity recognition in a video is an asynchronous operation. Analysis is started by a call to <a>StartCelebrityRecognition</a> which returns a job identifier (<code>JobId</code>). </p> <p>When the celebrity recognition operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartCelebrityRecognition</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetCelebrityDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityDetection</code>. </p> <p>For more information, see Working With Stored Videos in the Amazon Rekognition Developer Guide.</p> <p> <code>GetCelebrityRecognition</code> returns detected celebrities and the time(s) they are detected in an array (<code>Celebrities</code>) of <a>CelebrityRecognition</a> objects. Each <code>CelebrityRecognition</code> contains information about the celebrity in a <a>CelebrityDetail</a> object and the time, <code>Timestamp</code>, the celebrity was detected. This <a>CelebrityDetail</a> object stores information about the detected celebrity's face attributes, a face bounding box, known gender, the celebrity's name, and a confidence estimate.</p> <note> <p> <code>GetCelebrityRecognition</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The <code>BoundingBox</code> field only applies to the detected face instance. The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. </p> </note> <p>By default, the <code>Celebrities</code> array is sorted by time (milliseconds from the start of the video). You can also sort the array by celebrity by specifying the value <code>ID</code> in the <code>SortBy</code> input parameter.</p> <p>The <code>CelebrityDetail</code> object includes the celebrity identifer and additional information urls. If you don't store the additional information urls, you can get them later by calling <a>GetCelebrityInfo</a> with the celebrity identifer.</p> <p>No information is returned for faces not recognized as celebrities.</p> <p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetCelebrityDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetCelebrityRecognition</code>.</p>\"\
    },\
    \"GetContentModeration\":{\
      \"name\":\"GetContentModeration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetContentModerationRequest\"},\
      \"output\":{\"shape\":\"GetContentModerationResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the inappropriate, unwanted, or offensive content analysis results for a Amazon Rekognition Video analysis started by <a>StartContentModeration</a>. For a list of moderation labels in Amazon Rekognition, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/moderation.html#moderation-api\\\">Using the image and video moderation APIs</a>.</p> <p>Amazon Rekognition Video inappropriate or offensive content detection in a stored video is an asynchronous operation. You start analysis by calling <a>StartContentModeration</a> which returns a job identifier (<code>JobId</code>). When analysis finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartContentModeration</code>. To get the results of the content analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetContentModeration</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. </p> <p>For more information, see Working with Stored Videos in the Amazon Rekognition Devlopers Guide.</p> <p> <code>GetContentModeration</code> returns detected inappropriate, unwanted, or offensive content moderation labels, and the time they are detected, in an array, <code>ModerationLabels</code>, of <a>ContentModerationDetection</a> objects. </p> <p>By default, the moderated labels are returned sorted by time, in milliseconds from the start of the video. You can also sort them by moderated label by specifying <code>NAME</code> for the <code>SortBy</code> input parameter. </p> <p>Since video analysis can return a large number of results, use the <code>MaxResults</code> parameter to limit the number of labels returned in a single call to <code>GetContentModeration</code>. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetContentModeration</code> and populate the <code>NextToken</code> request parameter with the value of <code>NextToken</code> returned from the previous call to <code>GetContentModeration</code>.</p> <p>For more information, see Content moderation in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"GetFaceDetection\":{\
      \"name\":\"GetFaceDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetFaceDetectionRequest\"},\
      \"output\":{\"shape\":\"GetFaceDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets face detection results for a Amazon Rekognition Video analysis started by <a>StartFaceDetection</a>.</p> <p>Face detection with Amazon Rekognition Video is an asynchronous operation. You start face detection by calling <a>StartFaceDetection</a> which returns a job identifier (<code>JobId</code>). When the face detection operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceDetection</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p> <p> <code>GetFaceDetection</code> returns an array of detected faces (<code>Faces</code>) sorted by the time the faces were detected. </p> <p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetFaceDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetFaceDetection</code>.</p>\"\
    },\
    \"GetFaceSearch\":{\
      \"name\":\"GetFaceSearch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetFaceSearchRequest\"},\
      \"output\":{\"shape\":\"GetFaceSearchResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the face search results for Amazon Rekognition Video face search started by <a>StartFaceSearch</a>. The search returns faces in a collection that match the faces of persons detected in a video. It also includes the time(s) that faces are matched in the video.</p> <p>Face search in a video is an asynchronous operation. You start face search by calling to <a>StartFaceSearch</a> which returns a job identifier (<code>JobId</code>). When the search operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartFaceSearch</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <code>GetFaceSearch</code> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>.</p> <p>For more information, see Searching Faces in a Collection in the Amazon Rekognition Developer Guide.</p> <p>The search results are retured in an array, <code>Persons</code>, of <a>PersonMatch</a> objects. Each<code>PersonMatch</code> element contains details about the matching faces in the input collection, person information (facial attributes, bounding boxes, and person identifer) for the matched person, and the time the person was matched in the video.</p> <note> <p> <code>GetFaceSearch</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. </p> </note> <p>By default, the <code>Persons</code> array is sorted by the time, in milliseconds from the start of the video, persons are matched. You can also sort by persons by specifying <code>INDEX</code> for the <code>SORTBY</code> input parameter.</p>\"\
    },\
    \"GetLabelDetection\":{\
      \"name\":\"GetLabelDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLabelDetectionRequest\"},\
      \"output\":{\"shape\":\"GetLabelDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the label detection results of a Amazon Rekognition Video analysis started by <a>StartLabelDetection</a>. </p> <p>The label detection operation is started by a call to <a>StartLabelDetection</a> which returns a job identifier (<code>JobId</code>). When the label detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartlabelDetection</code>. To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p> <p> <code>GetLabelDetection</code> returns an array of detected labels (<code>Labels</code>) sorted by the time the labels were detected. You can also sort by the label name by specifying <code>NAME</code> for the <code>SortBy</code> input parameter.</p> <p>The labels returned include the label name, the percentage confidence in the accuracy of the detected label, and the time the label was detected in the video.</p> <p>The returned labels also include bounding box information for common objects, a hierarchical taxonomy of detected labels, and the version of the label model used for detection.</p> <p>Use MaxResults parameter to limit the number of labels returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetlabelDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetLabelDetection</code>.</p>\"\
    },\
    \"GetPersonTracking\":{\
      \"name\":\"GetPersonTracking\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetPersonTrackingRequest\"},\
      \"output\":{\"shape\":\"GetPersonTrackingResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the path tracking results of a Amazon Rekognition Video analysis started by <a>StartPersonTracking</a>.</p> <p>The person path tracking operation is started by a call to <code>StartPersonTracking</code> which returns a job identifier (<code>JobId</code>). When the operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartPersonTracking</code>.</p> <p>To get the results of the person path tracking operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p> <p> <code>GetPersonTracking</code> returns an array, <code>Persons</code>, of tracked persons and the time(s) their paths were tracked in the video. </p> <note> <p> <code>GetPersonTracking</code> only returns the default facial attributes (<code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>). The other facial attributes listed in the <code>Face</code> object of the following response syntax are not returned. </p> <p>For more information, see FaceDetail in the Amazon Rekognition Developer Guide.</p> </note> <p>By default, the array is sorted by the time(s) a person's path is tracked in the video. You can sort by tracked persons by specifying <code>INDEX</code> for the <code>SortBy</code> input parameter.</p> <p>Use the <code>MaxResults</code> parameter to limit the number of items returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetPersonTracking</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetPersonTracking</code>.</p>\"\
    },\
    \"GetSegmentDetection\":{\
      \"name\":\"GetSegmentDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetSegmentDetectionRequest\"},\
      \"output\":{\"shape\":\"GetSegmentDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the segment detection results of a Amazon Rekognition Video analysis started by <a>StartSegmentDetection</a>.</p> <p>Segment detection with Amazon Rekognition Video is an asynchronous operation. You start segment detection by calling <a>StartSegmentDetection</a> which returns a job identifier (<code>JobId</code>). When the segment detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartSegmentDetection</code>. To get the results of the segment detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <code>GetSegmentDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call of <code>StartSegmentDetection</code>.</p> <p> <code>GetSegmentDetection</code> returns detected segments in an array (<code>Segments</code>) of <a>SegmentDetection</a> objects. <code>Segments</code> is sorted by the segment types specified in the <code>SegmentTypes</code> input parameter of <code>StartSegmentDetection</code>. Each element of the array includes the detected segment, the precentage confidence in the acuracy of the detected segment, the type of the segment, and the frame in which the segment was detected.</p> <p>Use <code>SelectedSegmentTypes</code> to find out the type of segment detection requested in the call to <code>StartSegmentDetection</code>.</p> <p>Use the <code>MaxResults</code> parameter to limit the number of segment detections returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetSegmentDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetSegmentDetection</code>.</p> <p>For more information, see Detecting Video Segments in Stored Video in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"GetTextDetection\":{\
      \"name\":\"GetTextDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTextDetectionRequest\"},\
      \"output\":{\"shape\":\"GetTextDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Gets the text detection results of a Amazon Rekognition Video analysis started by <a>StartTextDetection</a>.</p> <p>Text detection with Amazon Rekognition Video is an asynchronous operation. You start text detection by calling <a>StartTextDetection</a> which returns a job identifier (<code>JobId</code>) When the text detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered in the initial call to <code>StartTextDetection</code>. To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <code>GetTextDetection</code> and pass the job identifier (<code>JobId</code>) from the initial call of <code>StartLabelDetection</code>.</p> <p> <code>GetTextDetection</code> returns an array of detected text (<code>TextDetections</code>) sorted by the time the text was detected, up to 50 words per frame of video.</p> <p>Each element of the array includes the detected text, the precentage confidence in the acuracy of the detected text, the time the text was detected, bounding box information for where the text was located, and unique identifiers for words and their lines.</p> <p>Use MaxResults parameter to limit the number of text detections returned. If there are more results than specified in <code>MaxResults</code>, the value of <code>NextToken</code> in the operation response contains a pagination token for getting the next set of results. To get the next page of results, call <code>GetTextDetection</code> and populate the <code>NextToken</code> request parameter with the token value returned from the previous call to <code>GetTextDetection</code>.</p>\"\
    },\
    \"IndexFaces\":{\
      \"name\":\"IndexFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"IndexFacesRequest\"},\
      \"output\":{\"shape\":\"IndexFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidImageFormatException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Detects faces in the input image and adds them to the specified collection. </p> <p>Amazon Rekognition doesn't save the actual faces that are detected. Instead, the underlying detection algorithm first detects the faces in the input image. For each face, the algorithm extracts facial features into a feature vector, and stores it in the backend database. Amazon Rekognition uses feature vectors when it performs face match and search operations using the <a>SearchFaces</a> and <a>SearchFacesByImage</a> operations.</p> <p>For more information, see Adding Faces to a Collection in the Amazon Rekognition Developer Guide.</p> <p>To get the number of faces in a collection, call <a>DescribeCollection</a>. </p> <p>If you're using version 1.0 of the face detection model, <code>IndexFaces</code> indexes the 15 largest faces in the input image. Later versions of the face detection model index the 100 largest faces in the input image. </p> <p>If you're using version 4 or later of the face model, image orientation information is not returned in the <code>OrientationCorrection</code> field. </p> <p>To determine which version of the model you're using, call <a>DescribeCollection</a> and supply the collection ID. You can also get the model version from the value of <code>FaceModelVersion</code> in the response from <code>IndexFaces</code> </p> <p>For more information, see Model Versioning in the Amazon Rekognition Developer Guide.</p> <p>If you provide the optional <code>ExternalImageId</code> for the input image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you call the <a>ListFaces</a> operation, the response returns the external ID. You can use this external image ID to create a client-side index to associate the faces with each image. You can then use the index to find all faces in an image.</p> <p>You can specify the maximum number of faces to index with the <code>MaxFaces</code> input parameter. This is useful when you want to index the largest faces in an image and don't want to index smaller faces, such as those belonging to people standing in the background.</p> <p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that donât meet a required quality bar. The quality bar is based on a variety of common use cases. By default, <code>IndexFaces</code> chooses the quality bar that's used to filter faces. You can also explicitly choose the quality bar. Use <code>QualityFilter</code>, to set the quality bar by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. </p> <note> <p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p> </note> <p>Information about faces detected in an image, but not indexed, is returned in an array of <a>UnindexedFace</a> objects, <code>UnindexedFaces</code>. Faces aren't indexed for reasons such as:</p> <ul> <li> <p>The number of faces detected exceeds the value of the <code>MaxFaces</code> request parameter.</p> </li> <li> <p>The face is too small compared to the image dimensions.</p> </li> <li> <p>The face is too blurry.</p> </li> <li> <p>The image is too dark.</p> </li> <li> <p>The face has an extreme pose.</p> </li> <li> <p>The face doesnât have enough detail to be suitable for face search.</p> </li> </ul> <p>In response, the <code>IndexFaces</code> operation returns an array of metadata for all detected faces, <code>FaceRecords</code>. This includes: </p> <ul> <li> <p>The bounding box, <code>BoundingBox</code>, of the detected face. </p> </li> <li> <p>A confidence value, <code>Confidence</code>, which indicates the confidence that the bounding box contains a face.</p> </li> <li> <p>A face ID, <code>FaceId</code>, assigned by the service for each face that's detected and stored.</p> </li> <li> <p>An image ID, <code>ImageId</code>, assigned by the service for the input image.</p> </li> </ul> <p>If you request all facial attributes (by using the <code>detectionAttributes</code> parameter), Amazon Rekognition returns detailed facial attributes, such as facial landmarks (for example, location of eye and mouth) and other facial attributes. If you provide the same image, specify the same collection, use the same external ID, and use the same model version in the <code>IndexFaces</code> operation, Amazon Rekognition doesn't save duplicate face metadata.</p> <p/> <p>The input image is passed either as base64-encoded image bytes, or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. </p> <p>This operation requires permissions to perform the <code>rekognition:IndexFaces</code> action.</p>\"\
    },\
    \"ListCollections\":{\
      \"name\":\"ListCollections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCollectionsRequest\"},\
      \"output\":{\"shape\":\"ListCollectionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns list of collection IDs in your account. If the result is truncated, the response also provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p> <p>For an example, see Listing Collections in the Amazon Rekognition Developer Guide.</p> <p>This operation requires permissions to perform the <code>rekognition:ListCollections</code> action.</p>\"\
    },\
    \"ListDatasetEntries\":{\
      \"name\":\"ListDatasetEntries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDatasetEntriesRequest\"},\
      \"output\":{\"shape\":\"ListDatasetEntriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotReadyException\"}\
      ],\
      \"documentation\":\"<p> Lists the entries (images) within a dataset. An entry is a JSON Line that contains the information for a single image, including the image location, assigned labels, and object location bounding boxes. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/md-manifest-files.html\\\">Creating a manifest file</a>.</p> <p>JSON Lines in the response include information about non-terminal errors found in the dataset. Non terminal errors are reported in <code>errors</code> lists within each JSON Line. The same information is reported in the training and testing validation result manifests that Amazon Rekognition Custom Labels creates during model training. </p> <p>You can filter the response in variety of ways, such as choosing which labels to return and returning JSON Lines created after a specific date. </p> <p>This operation requires permissions to perform the <code>rekognition:ListDatasetEntries</code> action.</p>\"\
    },\
    \"ListDatasetLabels\":{\
      \"name\":\"ListDatasetLabels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDatasetLabelsRequest\"},\
      \"output\":{\"shape\":\"ListDatasetLabelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceNotReadyException\"}\
      ],\
      \"documentation\":\"<p>Lists the labels in a dataset. Amazon Rekognition Custom Labels uses labels to describe images. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/customlabels-dg/md-labeling-images.html\\\">Labeling images</a>. </p> <p> Lists the labels in a dataset. Amazon Rekognition Custom Labels uses labels to describe images. For more information, see Labeling images in the <i>Amazon Rekognition Custom Labels Developer Guide</i>. </p>\"\
    },\
    \"ListFaces\":{\
      \"name\":\"ListFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListFacesRequest\"},\
      \"output\":{\"shape\":\"ListFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns metadata for faces in the specified collection. This metadata includes information such as the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID. For an example, see Listing Faces in a Collection in the Amazon Rekognition Developer Guide.</p> <p>This operation requires permissions to perform the <code>rekognition:ListFaces</code> action.</p>\"\
    },\
    \"ListStreamProcessors\":{\
      \"name\":\"ListStreamProcessors\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListStreamProcessorsRequest\"},\
      \"output\":{\"shape\":\"ListStreamProcessorsResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidPaginationTokenException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of stream processors that you have created with <a>CreateStreamProcessor</a>. </p>\"\
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
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p> Returns a list of tags in an Amazon Rekognition collection, stream processor, or Custom Labels model. </p> <p>This operation requires permissions to perform the <code>rekognition:ListTagsForResource</code> action. </p>\"\
    },\
    \"RecognizeCelebrities\":{\
      \"name\":\"RecognizeCelebrities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"RecognizeCelebritiesRequest\"},\
      \"output\":{\"shape\":\"RecognizeCelebritiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidImageFormatException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>Returns an array of celebrities recognized in the input image. For more information, see Recognizing Celebrities in the Amazon Rekognition Developer Guide. </p> <p> <code>RecognizeCelebrities</code> returns the 64 largest faces in the image. It lists the recognized celebrities in the <code>CelebrityFaces</code> array and any unrecognized faces in the <code>UnrecognizedFaces</code> array. <code>RecognizeCelebrities</code> doesn't return celebrities whose faces aren't among the largest 64 faces in the image.</p> <p>For each celebrity recognized, <code>RecognizeCelebrities</code> returns a <code>Celebrity</code> object. The <code>Celebrity</code> object contains the celebrity name, ID, URL links to additional information, match confidence, and a <code>ComparedFace</code> object that you can use to locate the celebrity's face on the image.</p> <p>Amazon Rekognition doesn't retain information about which images a celebrity has been recognized in. Your application must store this information and use the <code>Celebrity</code> ID property as a unique identifier for the celebrity. If you don't store the celebrity name or additional information URLs returned by <code>RecognizeCelebrities</code>, you will need the ID to identify the celebrity in a call to the <a>GetCelebrityInfo</a> operation.</p> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p>For an example, see Recognizing Celebrities in an Image in the Amazon Rekognition Developer Guide.</p> <p>This operation requires permissions to perform the <code>rekognition:RecognizeCelebrities</code> operation.</p>\"\
    },\
    \"SearchFaces\":{\
      \"name\":\"SearchFaces\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchFacesRequest\"},\
      \"output\":{\"shape\":\"SearchFacesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>For a given input face ID, searches for matching faces in the collection the face belongs to. You get a face ID when you add a face to the collection using the <a>IndexFaces</a> operation. The operation compares the features of the input face with faces in the specified collection. </p> <note> <p>You can also search faces without indexing faces by using the <code>SearchFacesByImage</code> operation.</p> </note> <p> The operation response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match that is found. Along with the metadata, the response also includes a <code>confidence</code> value for each face match, indicating the confidence that the specific face matches the input face. </p> <p>For an example, see Searching for a Face Using Its Face ID in the Amazon Rekognition Developer Guide.</p> <p>This operation requires permissions to perform the <code>rekognition:SearchFaces</code> action.</p>\"\
    },\
    \"SearchFacesByImage\":{\
      \"name\":\"SearchFacesByImage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"SearchFacesByImageRequest\"},\
      \"output\":{\"shape\":\"SearchFacesByImageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ImageTooLargeException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidImageFormatException\"}\
      ],\
      \"documentation\":\"<p>For a given input image, first detects the largest face in the image, and then searches the specified collection for matching faces. The operation compares the features of the input face with faces in the specified collection. </p> <note> <p>To search for all faces in an input image, you might first call the <a>IndexFaces</a> operation, and then use the face IDs returned in subsequent calls to the <a>SearchFaces</a> operation. </p> <p> You can also call the <code>DetectFaces</code> operation and use the bounding boxes in the response to make face crops, which then you can pass in to the <code>SearchFacesByImage</code> operation. </p> </note> <p>You pass the input image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. </p> <p> The response returns an array of faces that match, ordered by similarity score with the highest similarity first. More specifically, it is an array of metadata for each face match found. Along with the metadata, the response also includes a <code>similarity</code> indicating how similar the face is to the input face. In the response, the operation also returns the bounding box (and a confidence level that the bounding box contains a face) of the face that Amazon Rekognition used for the input image. </p> <p>If no faces are detected in the input image, <code>SearchFacesByImage</code> returns an <code>InvalidParameterException</code> error. </p> <p>For an example, Searching for a Face Using an Image in the Amazon Rekognition Developer Guide.</p> <p>The <code>QualityFilter</code> input parameter allows you to filter out detected faces that donât meet a required quality bar. The quality bar is based on a variety of common use cases. Use <code>QualityFilter</code> to set the quality bar for filtering by specifying <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>. If you do not want to filter detected faces, specify <code>NONE</code>. The default value is <code>NONE</code>.</p> <note> <p>To use quality filtering, you need a collection associated with version 3 of the face model or higher. To get the version of the face model associated with a collection, call <a>DescribeCollection</a>. </p> </note> <p>This operation requires permissions to perform the <code>rekognition:SearchFacesByImage</code> action.</p>\"\
    },\
    \"StartCelebrityRecognition\":{\
      \"name\":\"StartCelebrityRecognition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartCelebrityRecognitionRequest\"},\
      \"output\":{\"shape\":\"StartCelebrityRecognitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous recognition of celebrities in a stored video.</p> <p>Amazon Rekognition Video can detect celebrities in a video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartCelebrityRecognition</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When celebrity recognition analysis is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the celebrity recognition analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetCelebrityRecognition</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartCelebrityRecognition</code>. </p> <p>For more information, see Recognizing Celebrities in the Amazon Rekognition Developer Guide.</p>\",\
      \"idempotent\":true\
    },\
    \"StartContentModeration\":{\
      \"name\":\"StartContentModeration\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartContentModerationRequest\"},\
      \"output\":{\"shape\":\"StartContentModerationResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> Starts asynchronous detection of inappropriate, unwanted, or offensive content in a stored video. For a list of moderation labels in Amazon Rekognition, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/moderation.html#moderation-api\\\">Using the image and video moderation APIs</a>.</p> <p>Amazon Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartContentModeration</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the analysis. When content analysis is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p> <p>To get the results of the content analysis, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetContentModeration</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartContentModeration</code>. </p> <p>For more information, see Content moderation in the Amazon Rekognition Developer Guide.</p>\",\
      \"idempotent\":true\
    },\
    \"StartFaceDetection\":{\
      \"name\":\"StartFaceDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartFaceDetectionRequest\"},\
      \"output\":{\"shape\":\"StartFaceDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous detection of faces in a stored video.</p> <p>Amazon Rekognition Video can detect faces in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceDetection</code> returns a job identifier (<code>JobId</code>) that you use to get the results of the operation. When face detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the results of the face detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceDetection</code>.</p> <p>For more information, see Detecting Faces in a Stored Video in the Amazon Rekognition Developer Guide.</p>\",\
      \"idempotent\":true\
    },\
    \"StartFaceSearch\":{\
      \"name\":\"StartFaceSearch\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartFaceSearchRequest\"},\
      \"output\":{\"shape\":\"StartFaceSearchResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts the asynchronous search for faces in a collection that match the faces of persons detected in a stored video.</p> <p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartFaceSearch</code> returns a job identifier (<code>JobId</code>) which you use to get the search results once the search has completed. When searching is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. To get the search results, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetFaceSearch</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartFaceSearch</code>. For more information, see <a>procedure-person-search-videos</a>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartLabelDetection\":{\
      \"name\":\"StartLabelDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartLabelDetectionRequest\"},\
      \"output\":{\"shape\":\"StartLabelDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous detection of labels in a stored video.</p> <p>Amazon Rekognition Video can detect labels in a video. Labels are instances of real-world entities. This includes objects like flower, tree, and table; events like wedding, graduation, and birthday party; concepts like landscape, evening, and nature; and activities like a person getting out of a car or a person skiing.</p> <p>The video must be stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartLabelDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p> <p>To get the results of the label detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetLabelDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartLabelDetection</code>.</p> <p/>\",\
      \"idempotent\":true\
    },\
    \"StartPersonTracking\":{\
      \"name\":\"StartPersonTracking\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartPersonTrackingRequest\"},\
      \"output\":{\"shape\":\"StartPersonTrackingResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts the asynchronous tracking of a person's path in a stored video.</p> <p>Amazon Rekognition Video can track the path of people in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartPersonTracking</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When label detection is finished, Amazon Rekognition publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>. </p> <p>To get the results of the person detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. If so, call <a>GetPersonTracking</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartPersonTracking</code>.</p>\",\
      \"idempotent\":true\
    },\
    \"StartProjectVersion\":{\
      \"name\":\"StartProjectVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartProjectVersionRequest\"},\
      \"output\":{\"shape\":\"StartProjectVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts the running of the version of a model. Starting a model takes a while to complete. To check the current state of the model, use <a>DescribeProjectVersions</a>.</p> <p>Once the model is running, you can detect custom labels in new images by calling <a>DetectCustomLabels</a>.</p> <note> <p>You are charged for the amount of time that the model is running. To stop a running model, call <a>StopProjectVersion</a>.</p> </note> <p>This operation requires permissions to perform the <code>rekognition:StartProjectVersion</code> action.</p>\"\
    },\
    \"StartSegmentDetection\":{\
      \"name\":\"StartSegmentDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartSegmentDetectionRequest\"},\
      \"output\":{\"shape\":\"StartSegmentDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous detection of segment detection in a stored video.</p> <p>Amazon Rekognition Video can detect segments in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartSegmentDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When segment detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p> <p>You can use the <code>Filters</code> (<a>StartSegmentDetectionFilters</a>) input parameter to specify the minimum detection confidence returned in the response. Within <code>Filters</code>, use <code>ShotFilter</code> (<a>StartShotDetectionFilter</a>) to filter detected shots. Use <code>TechnicalCueFilter</code> (<a>StartTechnicalCueDetectionFilter</a>) to filter technical cues. </p> <p>To get the results of the segment detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <a>GetSegmentDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartSegmentDetection</code>. </p> <p>For more information, see Detecting Video Segments in Stored Video in the Amazon Rekognition Developer Guide.</p>\",\
      \"idempotent\":true\
    },\
    \"StartStreamProcessor\":{\
      \"name\":\"StartStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"StartStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Starts processing a stream processor. You create a stream processor by calling <a>CreateStreamProcessor</a>. To tell <code>StartStreamProcessor</code> which stream processor to start, use the value of the <code>Name</code> field specified in the call to <code>CreateStreamProcessor</code>.</p>\"\
    },\
    \"StartTextDetection\":{\
      \"name\":\"StartTextDetection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTextDetectionRequest\"},\
      \"output\":{\"shape\":\"StartTextDetectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"IdempotentParameterMismatchException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidS3ObjectException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"VideoTooLargeException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Starts asynchronous detection of text in a stored video.</p> <p>Amazon Rekognition Video can detect text in a video stored in an Amazon S3 bucket. Use <a>Video</a> to specify the bucket name and the filename of the video. <code>StartTextDetection</code> returns a job identifier (<code>JobId</code>) which you use to get the results of the operation. When text detection is finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that you specify in <code>NotificationChannel</code>.</p> <p>To get the results of the text detection operation, first check that the status value published to the Amazon SNS topic is <code>SUCCEEDED</code>. if so, call <a>GetTextDetection</a> and pass the job identifier (<code>JobId</code>) from the initial call to <code>StartTextDetection</code>. </p>\",\
      \"idempotent\":true\
    },\
    \"StopProjectVersion\":{\
      \"name\":\"StopProjectVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopProjectVersionRequest\"},\
      \"output\":{\"shape\":\"StopProjectVersionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Stops a running model. The operation might take a while to complete. To check the current status, call <a>DescribeProjectVersions</a>. </p>\"\
    },\
    \"StopStreamProcessor\":{\
      \"name\":\"StopStreamProcessor\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopStreamProcessorRequest\"},\
      \"output\":{\"shape\":\"StopStreamProcessorResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p>Stops a running stream processor that was created by <a>CreateStreamProcessor</a>.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p> Adds one or more key-value tags to an Amazon Rekognition collection, stream processor, or Custom Labels model. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging AWS Resources</a>. </p> <p>This operation requires permissions to perform the <code>rekognition:TagResource</code> action. </p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"}\
      ],\
      \"documentation\":\"<p> Removes one or more tags from an Amazon Rekognition collection, stream processor, or Custom Labels model. </p> <p>This operation requires permissions to perform the <code>rekognition:UntagResource</code> action. </p>\"\
    },\
    \"UpdateDatasetEntries\":{\
      \"name\":\"UpdateDatasetEntries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateDatasetEntriesRequest\"},\
      \"output\":{\"shape\":\"UpdateDatasetEntriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerError\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ProvisionedThroughputExceededException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Adds or updates one or more entries (images) in a dataset. An entry is a JSON Line which contains the information for a single image, including the image location, assigned labels, and object location bounding boxes. For more information, see Image-Level labels in manifest files and Object localization in manifest files in the <i>Amazon Rekognition Custom Labels Developer Guide</i>. </p> <p>If the <code>source-ref</code> field in the JSON line references an existing image, the existing image in the dataset is updated. If <code>source-ref</code> field doesn't reference an existing image, the image is added as a new image to the dataset. </p> <p>You specify the changes that you want to make in the <code>Changes</code> input parameter. There isn't a limit to the number JSON Lines that you can change, but the size of <code>Changes</code> must be less than 5MB.</p> <p> <code>UpdateDatasetEntries</code> returns immediatly, but the dataset update might take a while to complete. Use <a>DescribeDataset</a> to check the current status. The dataset updated successfully if the value of <code>Status</code> is <code>UPDATE_COMPLETE</code>. </p> <p>To check if any non-terminal errors occured, call <a>ListDatasetEntries</a> and check for the presence of <code>errors</code> lists in the JSON Lines.</p> <p>Dataset update fails if a terminal error occurs (<code>Status</code> = <code>UPDATE_FAILED</code>). Currently, you can't access the terminal error information from the Amazon Rekognition Custom Labels SDK. </p> <p>This operation requires permissions to perform the <code>rekognition:UpdateDatasetEntries</code> action.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You are not authorized to perform the action.</p>\",\
      \"exception\":true\
    },\
    \"AgeRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Low\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The lowest estimated age.</p>\"\
        },\
        \"High\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The highest estimated age.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing the estimated age range, in years, for a face.</p> <p>Amazon Rekognition estimates an age range for faces detected in the input image. Estimated age ranges can overlap. A face of a 5-year-old might have an estimated range of 4-6, while the face of a 6-year-old might have an estimated range of 4-8.</p>\"\
    },\
    \"Asset\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroundTruthManifest\":{\"shape\":\"GroundTruthManifest\"}\
      },\
      \"documentation\":\"<p>Assets are the images that you use to train and evaluate a model version. Assets can also contain validation information that you use to debug a failed model training. </p>\"\
    },\
    \"Assets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Asset\"}\
    },\
    \"Attribute\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"ALL\"\
      ]\
    },\
    \"Attributes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Attribute\"}\
    },\
    \"AudioMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Codec\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The audio codec used to encode or decode the audio stream. </p>\"\
        },\
        \"DurationMillis\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>The duration of the audio stream in milliseconds.</p>\"\
        },\
        \"SampleRate\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>The sample rate for the audio stream.</p>\"\
        },\
        \"NumberOfChannels\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>The number of audio channels in the segment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metadata information about an audio stream. An array of <code>AudioMetadata</code> objects for the audio streams found in a stored video is returned by <a>GetSegmentDetection</a>. </p>\"\
    },\
    \"AudioMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AudioMetadata\"}\
    },\
    \"Beard\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face has beard or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>\"\
    },\
    \"BlackFrame\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxPixelThreshold\":{\
          \"shape\":\"MaxPixelThreshold\",\
          \"documentation\":\"<p> A threshold used to determine the maximum luminance value for a pixel to be considered black. In a full color range video, luminance values range from 0-255. A pixel value of 0 is pure black, and the most strict filter. The maximum black pixel value is computed as follows: max_black_pixel_value = minimum_luminance + MaxPixelThreshold *luminance_range. </p> <p>For example, for a full range video with BlackPixelThreshold = 0.1, max_black_pixel_value is 0 + 0.1 * (255-0) = 25.5.</p> <p>The default value of MaxPixelThreshold is 0.2, which maps to a max_black_pixel_value of 51 for a full range video. You can lower this threshold to be more strict on black levels.</p>\"\
        },\
        \"MinCoveragePercentage\":{\
          \"shape\":\"MinCoveragePercentage\",\
          \"documentation\":\"<p> The minimum percentage of pixels in a frame that need to have a luminance below the max_black_pixel_value for a frame to be considered a black frame. Luminance is calculated using the BT.709 matrix. </p> <p>The default value is 99, which means at least 99% of all pixels in the frame are black pixels as per the <code>MaxPixelThreshold</code> set. You can reduce this value to allow more noise on the black frame.</p>\"\
        }\
      },\
      \"documentation\":\"<p> A filter that allows you to control the black frame detection by specifying the black levels and pixel coverage of black pixels in a frame. As videos can come from multiple sources, formats, and time periods, they may contain different standards and varying noise levels for black frames that need to be accounted for. For more information, see <a>StartSegmentDetection</a>. </p>\"\
    },\
    \"BodyPart\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FACE\",\
        \"HEAD\",\
        \"LEFT_HAND\",\
        \"RIGHT_HAND\"\
      ]\
    },\
    \"BodyParts\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProtectiveEquipmentBodyPart\"}\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BoundingBox\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Width\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Width of the bounding box as a ratio of the overall image width.</p>\"\
        },\
        \"Height\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Height of the bounding box as a ratio of the overall image height.</p>\"\
        },\
        \"Left\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Left coordinate of the bounding box as a ratio of overall image width.</p>\"\
        },\
        \"Top\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Top coordinate of the bounding box as a ratio of overall image height.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the bounding box around the label, face, text or personal protective equipment. The <code>left</code> (x-coordinate) and <code>top</code> (y-coordinate) are coordinates representing the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p> <p>The <code>top</code> and <code>left</code> values returned are ratios of the overall image size. For example, if the input image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API returns a <code>left</code> value of 0.5 (350/700) and a <code>top</code> value of 0.25 (50/200).</p> <p>The <code>width</code> and <code>height</code> values represent the dimensions of the bounding box as a ratio of the overall image dimension. For example, if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is 0.1. </p> <note> <p> The bounding box coordinates can have negative values. For example, if Amazon Rekognition is able to detect a face that is at the image edge and is only partially visible, the service can return coordinates that are outside the image bounds and, depending on the image edge, you might get negative values or values greater than 1 for the <code>left</code> or <code>top</code> values. </p> </note>\"\
    },\
    \"BoundingBoxHeight\":{\
      \"type\":\"float\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"BoundingBoxWidth\":{\
      \"type\":\"float\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"Celebrity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Urls\":{\
          \"shape\":\"Urls\",\
          \"documentation\":\"<p>An array of URLs pointing to additional information about the celebrity. If there is no additional information about the celebrity, this list is empty.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the celebrity.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"RekognitionUniqueId\",\
          \"documentation\":\"<p>A unique identifier for the celebrity. </p>\"\
        },\
        \"Face\":{\
          \"shape\":\"ComparedFace\",\
          \"documentation\":\"<p>Provides information about the celebrity's face, such as its location on the image.</p>\"\
        },\
        \"MatchConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence, in percentage, that Amazon Rekognition has that the recognized face is the celebrity.</p>\"\
        },\
        \"KnownGender\":{\"shape\":\"KnownGender\"}\
      },\
      \"documentation\":\"<p>Provides information about a celebrity recognized by the <a>RecognizeCelebrities</a> operation.</p>\"\
    },\
    \"CelebrityDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Urls\":{\
          \"shape\":\"Urls\",\
          \"documentation\":\"<p>An array of URLs pointing to additional celebrity information. </p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the celebrity.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"RekognitionUniqueId\",\
          \"documentation\":\"<p>The unique identifier for the celebrity. </p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence, in percentage, that Amazon Rekognition has that the recognized face is the celebrity. </p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box around the body of a celebrity.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>Face details for the recognized celebrity.</p>\"\
        },\
        \"KnownGender\":{\
          \"shape\":\"KnownGender\",\
          \"documentation\":\"<p>Retrieves the known gender for the celebrity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a recognized celebrity.</p>\"\
    },\
    \"CelebrityList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Celebrity\"}\
    },\
    \"CelebrityRecognition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the start of the video, that the celebrity was recognized.</p>\"\
        },\
        \"Celebrity\":{\
          \"shape\":\"CelebrityDetail\",\
          \"documentation\":\"<p>Information about a recognized celebrity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a detected celebrity and the time the celebrity was detected in a stored video. For more information, see GetCelebrityRecognition in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"CelebrityRecognitionSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ID\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"CelebrityRecognitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CelebrityRecognition\"}\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"CollectionId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"CollectionIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CollectionId\"}\
    },\
    \"CompareFacesMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Similarity\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence that the faces match.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"ComparedFace\",\
          \"documentation\":\"<p>Provides face metadata (bounding box and confidence that the bounding box actually contains a face).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a face in a target image that matches the source image face analyzed by <code>CompareFaces</code>. The <code>Face</code> property contains the bounding box of the face in the target image. The <code>Similarity</code> property is the confidence that the source image face matches the face in the bounding box.</p>\"\
    },\
    \"CompareFacesMatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CompareFacesMatch\"}\
    },\
    \"CompareFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SourceImage\",\
        \"TargetImage\"\
      ],\
      \"members\":{\
        \"SourceImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"TargetImage\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The target image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"SimilarityThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The minimum level of confidence in the face matches that a match must meet to be included in the <code>FaceMatches</code> array.</p>\"\
        },\
        \"QualityFilter\":{\
          \"shape\":\"QualityFilter\",\
          \"documentation\":\"<p>A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't compared. If you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>, filtering removes all faces that donât meet the chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify <code>NONE</code>, no filtering is performed. The default value is <code>NONE</code>. </p> <p>To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.</p>\"\
        }\
      }\
    },\
    \"CompareFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SourceImageFace\":{\
          \"shape\":\"ComparedSourceImageFace\",\
          \"documentation\":\"<p>The face in the source image that was used for comparison.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"CompareFacesMatchList\",\
          \"documentation\":\"<p>An array of faces in the target image that match the source image face. Each <code>CompareFacesMatch</code> object provides the bounding box, the confidence level that the bounding box contains a face, and the similarity score for the face in the bounding box and the face in the source image.</p>\"\
        },\
        \"UnmatchedFaces\":{\
          \"shape\":\"CompareFacesUnmatchList\",\
          \"documentation\":\"<p>An array of faces in the target image that did not match the source image face.</p>\"\
        },\
        \"SourceImageOrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The value of <code>SourceImageOrientationCorrection</code> is always null.</p> <p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p> <p>Amazon Rekognition doesnât perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>\"\
        },\
        \"TargetImageOrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The value of <code>TargetImageOrientationCorrection</code> is always null.</p> <p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p> <p>Amazon Rekognition doesnât perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>\"\
        }\
      }\
    },\
    \"CompareFacesUnmatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ComparedFace\"}\
    },\
    \"ComparedFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence that what the bounding box contains is a face.</p>\"\
        },\
        \"Landmarks\":{\
          \"shape\":\"Landmarks\",\
          \"documentation\":\"<p>An array of facial landmarks.</p>\"\
        },\
        \"Pose\":{\
          \"shape\":\"Pose\",\
          \"documentation\":\"<p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>\"\
        },\
        \"Quality\":{\
          \"shape\":\"ImageQuality\",\
          \"documentation\":\"<p>Identifies face image brightness and sharpness. </p>\"\
        },\
        \"Emotions\":{\
          \"shape\":\"Emotions\",\
          \"documentation\":\"<p> The emotions that appear to be expressed on the face, and the confidence level in the determination. Valid values include \\\"Happy\\\", \\\"Sad\\\", \\\"Angry\\\", \\\"Confused\\\", \\\"Disgusted\\\", \\\"Surprised\\\", \\\"Calm\\\", \\\"Unknown\\\", and \\\"Fear\\\". </p>\"\
        },\
        \"Smile\":{\
          \"shape\":\"Smile\",\
          \"documentation\":\"<p> Indicates whether or not the face is smiling, and the confidence level in the determination. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides face metadata for target image faces that are analyzed by <code>CompareFaces</code> and <code>RecognizeCelebrities</code>.</p>\"\
    },\
    \"ComparedFaceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ComparedFace\"}\
    },\
    \"ComparedSourceImageFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the selected bounding box contains a face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Type that describes the face Amazon Rekognition chose to compare with the faces in the target. This contains a bounding box for the selected face and confidence level that the bounding box contains a face. Note that Amazon Rekognition selects the largest face in the source image for this comparison. </p>\"\
    },\
    \"ContentClassifier\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FreeOfPersonallyIdentifiableInformation\",\
        \"FreeOfAdultContent\"\
      ]\
    },\
    \"ContentClassifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContentClassifier\"},\
      \"max\":256\
    },\
    \"ContentModerationDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time, in milliseconds from the beginning of the video, that the content moderation label was detected.</p>\"\
        },\
        \"ModerationLabel\":{\
          \"shape\":\"ModerationLabel\",\
          \"documentation\":\"<p>The content moderation label detected by in the stored video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an inappropriate, unwanted, or offensive content label detection in a stored video.</p>\"\
    },\
    \"ContentModerationDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContentModerationDetection\"}\
    },\
    \"ContentModerationSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NAME\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"CoversBodyPart\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has in the value of <code>Value</code>.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>True if the PPE covers the corresponding body part, otherwise false.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an item of Personal Protective Equipment covering a corresponding body part. For more information, see <a>DetectProtectiveEquipment</a>.</p>\"\
    },\
    \"CreateCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID for the collection that you are creating.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> A set of tags (key-value pairs) that you want to attach to the collection. </p>\"\
        }\
      }\
    },\
    \"CreateCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>HTTP status code indicating the result of the operation.</p>\"\
        },\
        \"CollectionArn\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Amazon Resource Name (ARN) of the collection. You can use this to manage permissions on your resources. </p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Latest face model being used with the collection. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/face-detection-model.html\\\">Model versioning</a>.</p>\"\
        }\
      }\
    },\
    \"CreateDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DatasetType\",\
        \"ProjectArn\"\
      ],\
      \"members\":{\
        \"DatasetSource\":{\
          \"shape\":\"DatasetSource\",\
          \"documentation\":\"<p> The source files for the dataset. You can specify the ARN of an existing dataset or specify the Amazon S3 bucket location of an Amazon Sagemaker format manifest file. If you don't specify <code>datasetSource</code>, an empty dataset is created. To add labeled images to the dataset, You can use the console or call <a>UpdateDatasetEntries</a>. </p>\"\
        },\
        \"DatasetType\":{\
          \"shape\":\"DatasetType\",\
          \"documentation\":\"<p> The type of the dataset. Specify <code>train</code> to create a training dataset. Specify <code>test</code> to create a test dataset. </p>\"\
        },\
        \"ProjectArn\":{\
          \"shape\":\"ProjectArn\",\
          \"documentation\":\"<p> The ARN of the Amazon Rekognition Custom Labels project to which you want to asssign the dataset. </p>\"\
        }\
      }\
    },\
    \"CreateDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The ARN of the created Amazon Rekognition Custom Labels dataset. </p>\"\
        }\
      }\
    },\
    \"CreateProjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProjectName\"],\
      \"members\":{\
        \"ProjectName\":{\
          \"shape\":\"ProjectName\",\
          \"documentation\":\"<p>The name of the project to create.</p>\"\
        }\
      }\
    },\
    \"CreateProjectResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectArn\":{\
          \"shape\":\"ProjectArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the new project. You can use the ARN to configure IAM access to the project. </p>\"\
        }\
      }\
    },\
    \"CreateProjectVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProjectArn\",\
        \"VersionName\",\
        \"OutputConfig\"\
      ],\
      \"members\":{\
        \"ProjectArn\":{\
          \"shape\":\"ProjectArn\",\
          \"documentation\":\"<p>The ARN of the Amazon Rekognition Custom Labels project that manages the model that you want to train.</p>\"\
        },\
        \"VersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>A name for the version of the model. This value must be unique.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"OutputConfig\",\
          \"documentation\":\"<p>The Amazon S3 bucket location to store the results of training. The S3 bucket can be in any AWS account as long as the caller has <code>s3:PutObject</code> permissions on the S3 bucket.</p>\"\
        },\
        \"TrainingData\":{\
          \"shape\":\"TrainingData\",\
          \"documentation\":\"<p>Specifies an external manifest that the services uses to train the model. If you specify <code>TrainingData</code> you must also specify <code>TestingData</code>. The project must not have any associated datasets. </p>\"\
        },\
        \"TestingData\":{\
          \"shape\":\"TestingData\",\
          \"documentation\":\"<p>Specifies an external manifest that the service uses to test the model. If you specify <code>TestingData</code> you must also specify <code>TrainingData</code>. The project must not have any associated datasets.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> A set of tags (key-value pairs) that you want to attach to the model. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS key, or an alias ARN. The key is used to encrypt training and test images copied into the service for model training. Your source images are unaffected. The key is also used to encrypt training results and manifest files written to the output Amazon S3 bucket (<code>OutputConfig</code>).</p> <p>If you choose to use your own KMS key, you need the following permissions on the KMS key.</p> <ul> <li> <p>kms:CreateGrant</p> </li> <li> <p>kms:DescribeKey</p> </li> <li> <p>kms:GenerateDataKey</p> </li> <li> <p>kms:Decrypt</p> </li> </ul> <p>If you don't specify a value for <code>KmsKeyId</code>, images copied into the service are encrypted using a key that AWS owns and manages.</p>\"\
        }\
      }\
    },\
    \"CreateProjectVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectVersionArn\":{\
          \"shape\":\"ProjectVersionArn\",\
          \"documentation\":\"<p>The ARN of the model version that was created. Use <code>DescribeProjectVersion</code> to get the current status of the training operation.</p>\"\
        }\
      }\
    },\
    \"CreateStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Input\",\
        \"Output\",\
        \"Name\",\
        \"Settings\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"Input\":{\
          \"shape\":\"StreamProcessorInput\",\
          \"documentation\":\"<p>Kinesis video stream stream that provides the source streaming video. If you are using the AWS CLI, the parameter name is <code>StreamProcessorInput</code>.</p>\"\
        },\
        \"Output\":{\
          \"shape\":\"StreamProcessorOutput\",\
          \"documentation\":\"<p>Kinesis data stream stream to which Amazon Rekognition Video puts the analysis results. If you are using the AWS CLI, the parameter name is <code>StreamProcessorOutput</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>An identifier you assign to the stream processor. You can use <code>Name</code> to manage the stream processor. For example, you can get the current status of the stream processor by calling <a>DescribeStreamProcessor</a>. <code>Name</code> is idempotent. </p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"StreamProcessorSettings\",\
          \"documentation\":\"<p>Face recognition input parameters to be used by the stream processor. Includes the collection to use for face recognition and the face attributes to detect.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>ARN of the IAM role that allows access to the stream processor.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> A set of tags (key-value pairs) that you want to attach to the stream processor. </p>\"\
        }\
      }\
    },\
    \"CreateStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamProcessorArn\":{\
          \"shape\":\"StreamProcessorArn\",\
          \"documentation\":\"<p>ARN for the newly create stream processor.</p>\"\
        }\
      }\
    },\
    \"CustomLabel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the custom label.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that the model has in the detection of the custom label. The range is 0-100. A higher value indicates a higher confidence.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"Geometry\",\
          \"documentation\":\"<p>The location of the detected object on the image that corresponds to the custom label. Includes an axis aligned coarse bounding box surrounding the object and a finer grain polygon for more accurate spatial information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A custom label detected in an image by a call to <a>DetectCustomLabels</a>.</p>\"\
    },\
    \"CustomLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomLabel\"}\
    },\
    \"DatasetArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"(^arn:[a-z\\\\d-]+:rekognition:[a-z\\\\d-]+:\\\\d{12}:project\\\\/[a-zA-Z0-9_.\\\\-]{1,255}\\\\/dataset\\\\/(train|test)\\\\/[0-9]+$)\"\
    },\
    \"DatasetChanges\":{\
      \"type\":\"structure\",\
      \"required\":[\"GroundTruth\"],\
      \"members\":{\
        \"GroundTruth\":{\
          \"shape\":\"GroundTruthBlob\",\
          \"documentation\":\"<p>A Base64-encoded binary data object containing one or JSON lines that either update the dataset or are additions to the dataset. You change a dataset by calling <a>UpdateDatasetEntries</a>. If you are using an AWS SDK to call <code>UpdateDatasetEntries</code>, you don't need to encode <code>Changes</code> as the SDK encodes the data for you. </p> <p>For example JSON lines, see Image-Level labels in manifest files and and Object localization in manifest files in the <i>Amazon Rekognition Custom Labels Developer Guide</i>. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes updates or additions to a dataset. A Single update or addition is an entry (JSON Line) that provides information about a single image. To update an existing entry, you match the <code>source-ref</code> field of the update entry with the <code>source-ref</code> filed of the entry that you want to update. If the <code>source-ref</code> field doesn't match an existing entry, the entry is added to dataset as a new entry. </p>\"\
    },\
    \"DatasetDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p> The Unix timestamp for the time and date that the dataset was created. </p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p> The Unix timestamp for the date and time that the dataset was last updated. </p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DatasetStatus\",\
          \"documentation\":\"<p> The status of the dataset. </p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p> The status message for the dataset. </p>\"\
        },\
        \"StatusMessageCode\":{\
          \"shape\":\"DatasetStatusMessageCode\",\
          \"documentation\":\"<p> The status message code for the dataset operation. If a service error occurs, try the API call again later. If a client error occurs, check the input parameters to the dataset API call that failed. </p>\"\
        },\
        \"DatasetStats\":{\
          \"shape\":\"DatasetStats\",\
          \"documentation\":\"<p> The status message code for the dataset. </p>\"\
        }\
      },\
      \"documentation\":\"<p> A description for a dataset. For more information, see <a>DescribeDataset</a>.</p> <p>The status fields <code>Status</code>, <code>StatusMessage</code>, and <code>StatusMessageCode</code> reflect the last operation on the dataset. </p>\"\
    },\
    \"DatasetEntries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DatasetEntry\"}\
    },\
    \"DatasetEntry\":{\
      \"type\":\"string\",\
      \"max\":100000,\
      \"min\":1,\
      \"pattern\":\"^\\\\{.*\\\\}$\"\
    },\
    \"DatasetLabel\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\".{1,}\"\
    },\
    \"DatasetLabelDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LabelName\":{\
          \"shape\":\"DatasetLabel\",\
          \"documentation\":\"<p> The name of the label. </p>\"\
        },\
        \"LabelStats\":{\
          \"shape\":\"DatasetLabelStats\",\
          \"documentation\":\"<p> Statistics about the label. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes a dataset label. For more information, see <a>ListDatasetLabels</a>. </p>\"\
    },\
    \"DatasetLabelDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DatasetLabelDescription\"}\
    },\
    \"DatasetLabelStats\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntryCount\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p> The total number of images that use the label. </p>\"\
        },\
        \"BoundingBoxCount\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p> The total number of images that have the label assigned to a bounding box. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Statistics about a label used in a dataset. For more information, see <a>DatasetLabelDescription</a>. </p>\"\
    },\
    \"DatasetLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DatasetLabel\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"DatasetMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p> The Unix timestamp for the date and time that the dataset was created. </p>\"\
        },\
        \"DatasetType\":{\
          \"shape\":\"DatasetType\",\
          \"documentation\":\"<p> The type of the dataset. </p>\"\
        },\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for the dataset. </p>\"\
        },\
        \"Status\":{\
          \"shape\":\"DatasetStatus\",\
          \"documentation\":\"<p> The status for the dataset. </p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p> The status message for the dataset. </p>\"\
        },\
        \"StatusMessageCode\":{\
          \"shape\":\"DatasetStatusMessageCode\",\
          \"documentation\":\"<p> The status message code for the dataset operation. If a service error occurs, try the API call again later. If a client error occurs, check the input parameters to the dataset API call that failed. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Summary information for an Amazon Rekognition Custom Labels dataset. For more information, see <a>ProjectDescription</a>. </p>\"\
    },\
    \"DatasetMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DatasetMetadata\"}\
    },\
    \"DatasetSource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"GroundTruthManifest\":{\"shape\":\"GroundTruthManifest\"},\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The ARN of an Amazon Rekognition Custom Labels dataset that you want to copy. </p>\"\
        }\
      },\
      \"documentation\":\"<p> The source that Amazon Rekognition Custom Labels uses to create a dataset. To use an Amazon Sagemaker format manifest file, specify the S3 bucket location in the <code>GroundTruthManifest</code> field. The S3 bucket must be in your AWS account. To create a copy of an existing dataset, specify the Amazon Resource Name (ARN) of an existing dataset in <code>DatasetArn</code>.</p> <p>You need to specify a value for <code>DatasetArn</code> or <code>GroundTruthManifest</code>, but not both. if you supply both values, or if you don't specify any values, an InvalidParameterException exception occurs. </p> <p>For more information, see <a>CreateDataset</a>.</p>\"\
    },\
    \"DatasetStats\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LabeledEntries\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p> The total number of images in the dataset that have labels. </p>\"\
        },\
        \"TotalEntries\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p> The total number of images in the dataset. </p>\"\
        },\
        \"TotalLabels\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p> The total number of labels declared in the dataset. </p>\"\
        },\
        \"ErrorEntries\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p> The total number of entries that contain at least one error. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Provides statistics about a dataset. For more information, see <a>DescribeDataset</a>. </p>\"\
    },\
    \"DatasetStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATE_IN_PROGRESS\",\
        \"CREATE_COMPLETE\",\
        \"CREATE_FAILED\",\
        \"UPDATE_IN_PROGRESS\",\
        \"UPDATE_COMPLETE\",\
        \"UPDATE_FAILED\",\
        \"DELETE_IN_PROGRESS\"\
      ]\
    },\
    \"DatasetStatusMessageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUCCESS\",\
        \"SERVICE_ERROR\",\
        \"CLIENT_ERROR\"\
      ]\
    },\
    \"DatasetType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRAIN\",\
        \"TEST\"\
      ]\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"Degree\":{\
      \"type\":\"float\",\
      \"max\":180,\
      \"min\":-180\
    },\
    \"DeleteCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>HTTP status code that indicates the result of the operation.</p>\"\
        }\
      }\
    },\
    \"DeleteDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DatasetArn\"],\
      \"members\":{\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The ARN of the Amazon Rekognition Custom Labels dataset that you want to delete. </p>\"\
        }\
      }\
    },\
    \"DeleteDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"FaceIds\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>Collection from which to remove the specific faces.</p>\"\
        },\
        \"FaceIds\":{\
          \"shape\":\"FaceIdList\",\
          \"documentation\":\"<p>An array of face IDs to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DeletedFaces\":{\
          \"shape\":\"FaceIdList\",\
          \"documentation\":\"<p>An array of strings (face IDs) of the faces that were deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteProjectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProjectArn\"],\
      \"members\":{\
        \"ProjectArn\":{\
          \"shape\":\"ProjectArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the project that you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteProjectResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ProjectStatus\",\
          \"documentation\":\"<p>The current status of the delete project operation.</p>\"\
        }\
      }\
    },\
    \"DeleteProjectVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProjectVersionArn\"],\
      \"members\":{\
        \"ProjectVersionArn\":{\
          \"shape\":\"ProjectVersionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model version that you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteProjectVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ProjectVersionStatus\",\
          \"documentation\":\"<p>The status of the deletion operation.</p>\"\
        }\
      }\
    },\
    \"DeleteStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>The name of the stream processor you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>The ID of the collection to describe.</p>\"\
        }\
      }\
    },\
    \"DescribeCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceCount\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>The number of faces that are indexed into the collection. To index faces into a collection, use <a>IndexFaces</a>.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version of the face model that's used by the collection for face detection.</p> <p>For more information, see Model Versioning in the Amazon Rekognition Developer Guide.</p>\"\
        },\
        \"CollectionARN\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the collection.</p>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The number of milliseconds since the Unix epoch time until the creation of the collection. The Unix epoch time is 00:00:00 Coordinated Universal Time (UTC), Thursday, 1 January 1970.</p>\"\
        }\
      }\
    },\
    \"DescribeDatasetRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DatasetArn\"],\
      \"members\":{\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the dataset that you want to describe. </p>\"\
        }\
      }\
    },\
    \"DescribeDatasetResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DatasetDescription\":{\
          \"shape\":\"DatasetDescription\",\
          \"documentation\":\"<p> The description for the dataset. </p>\"\
        }\
      }\
    },\
    \"DescribeProjectVersionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProjectArn\"],\
      \"members\":{\
        \"ProjectArn\":{\
          \"shape\":\"ProjectArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the project that contains the models you want to describe.</p>\"\
        },\
        \"VersionNames\":{\
          \"shape\":\"VersionNames\",\
          \"documentation\":\"<p>A list of model version names that you want to describe. You can add up to 10 model version names to the list. If you don't specify a value, all model descriptions are returned. A version name is part of a model (ProjectVersion) ARN. For example, <code>my-model.2020-01-21T09.10.15</code> is the version name in the following ARN. <code>arn:aws:rekognition:us-east-1:123456789012:project/getting-started/version/<i>my-model.2020-01-21T09.10.15</i>/1234567890123</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ProjectVersionsPageSize\",\
          \"documentation\":\"<p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>\"\
        }\
      }\
    },\
    \"DescribeProjectVersionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectVersionDescriptions\":{\
          \"shape\":\"ProjectVersionDescriptions\",\
          \"documentation\":\"<p>A list of model descriptions. The list is sorted by the creation date and time of the model versions, latest to earliest.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        }\
      }\
    },\
    \"DescribeProjectsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ProjectsPageSize\",\
          \"documentation\":\"<p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>\"\
        },\
        \"ProjectNames\":{\
          \"shape\":\"ProjectNames\",\
          \"documentation\":\"<p>A list of the projects that you want Amazon Rekognition Custom Labels to describe. If you don't specify a value, the response includes descriptions for all the projects in your AWS account.</p>\"\
        }\
      }\
    },\
    \"DescribeProjectsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectDescriptions\":{\
          \"shape\":\"ProjectDescriptions\",\
          \"documentation\":\"<p>A list of project descriptions. The list is sorted by the date and time the projects are created.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        }\
      }\
    },\
    \"DescribeStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>Name of the stream processor for which you want information.</p>\"\
        }\
      }\
    },\
    \"DescribeStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>Name of the stream processor. </p>\"\
        },\
        \"StreamProcessorArn\":{\
          \"shape\":\"StreamProcessorArn\",\
          \"documentation\":\"<p>ARN of the stream processor.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StreamProcessorStatus\",\
          \"documentation\":\"<p>Current status of the stream processor.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Detailed status message about the stream processor.</p>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>Date and time the stream processor was created</p>\"\
        },\
        \"LastUpdateTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time, in Unix format, the stream processor was last updated. For example, when the stream processor moves from a running state to a failed state, or when the user starts or stops the stream processor.</p>\"\
        },\
        \"Input\":{\
          \"shape\":\"StreamProcessorInput\",\
          \"documentation\":\"<p>Kinesis video stream that provides the source streaming video.</p>\"\
        },\
        \"Output\":{\
          \"shape\":\"StreamProcessorOutput\",\
          \"documentation\":\"<p>Kinesis data stream to which Amazon Rekognition Video puts the analysis results.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>ARN of the IAM role that allows access to the stream processor.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"StreamProcessorSettings\",\
          \"documentation\":\"<p>Face recognition input parameters that are being used by the stream processor. Includes the collection to use for face recognition and the face attributes to detect.</p>\"\
        }\
      }\
    },\
    \"DetectCustomLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProjectVersionArn\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"ProjectVersionArn\":{\
          \"shape\":\"ProjectVersionArn\",\
          \"documentation\":\"<p>The ARN of the model version that you want to use.</p>\"\
        },\
        \"Image\":{\"shape\":\"Image\"},\
        \"MaxResults\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>Maximum number of results you want the service to return in the response. The service returns the specified number of highest confidence labels ranked from highest confidence to lowest.</p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence level for the labels to return. <code>DetectCustomLabels</code> doesn't return any labels with a confidence value that's lower than this specified value. If you specify a value of 0, <code>DetectCustomLabels</code> returns all labels, regardless of the assumed threshold applied to each label. If you don't specify a value for <code>MinConfidence</code>, <code>DetectCustomLabels</code> returns labels based on the assumed threshold of each label.</p>\"\
        }\
      }\
    },\
    \"DetectCustomLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CustomLabels\":{\
          \"shape\":\"CustomLabels\",\
          \"documentation\":\"<p>An array of custom labels detected in the input image.</p>\"\
        }\
      }\
    },\
    \"DetectFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>An array of facial attributes you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>[\\\"DEFAULT\\\"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code>, and <code>Landmarks</code>. If you provide <code>[\\\"ALL\\\"]</code>, all facial attributes are returned, but the operation takes longer to complete.</p> <p>If you provide both, <code>[\\\"ALL\\\", \\\"DEFAULT\\\"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>\"\
        }\
      }\
    },\
    \"DetectFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceDetails\":{\
          \"shape\":\"FaceDetailList\",\
          \"documentation\":\"<p>Details of each face found in the image. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The value of <code>OrientationCorrection</code> is always null.</p> <p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p> <p>Amazon Rekognition doesnât perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>\"\
        }\
      }\
    },\
    \"DetectLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. Images stored in an S3 Bucket do not need to be base64-encoded.</p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"MaxLabels\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>Maximum number of labels you want the service to return in the response. The service returns the specified number of highest confidence labels. </p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with confidence lower than this specified value.</p> <p>If <code>MinConfidence</code> is not specified, the operation returns labels with a confidence values greater than or equal to 55 percent.</p>\"\
        }\
      }\
    },\
    \"DetectLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Labels\":{\
          \"shape\":\"Labels\",\
          \"documentation\":\"<p>An array of labels for the real-world objects detected. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>The value of <code>OrientationCorrection</code> is always null.</p> <p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction. The bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata.</p> <p>Amazon Rekognition doesnât perform image correction for images in .png format and .jpeg images without orientation information in the image Exif metadata. The bounding box coordinates aren't translated and represent the object locations before the image is rotated. </p>\"\
        },\
        \"LabelModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the label detection model that was used to detect labels.</p>\"\
        }\
      }\
    },\
    \"DetectModerationLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return any labels with a confidence level lower than this specified value.</p> <p>If you don't specify <code>MinConfidence</code>, the operation returns labels with confidence values greater than or equal to 50 percent.</p>\"\
        },\
        \"HumanLoopConfig\":{\
          \"shape\":\"HumanLoopConfig\",\
          \"documentation\":\"<p>Sets up the configuration for human evaluation, including the FlowDefinition the image will be sent to.</p>\"\
        }\
      }\
    },\
    \"DetectModerationLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModerationLabels\":{\
          \"shape\":\"ModerationLabels\",\
          \"documentation\":\"<p>Array of detected Moderation labels and the time, in milliseconds from the start of the video, they were detected.</p>\"\
        },\
        \"ModerationModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the moderation detection model that was used to detect unsafe content.</p>\"\
        },\
        \"HumanLoopActivationOutput\":{\
          \"shape\":\"HumanLoopActivationOutput\",\
          \"documentation\":\"<p>Shows the results of the human in the loop evaluation.</p>\"\
        }\
      }\
    },\
    \"DetectProtectiveEquipmentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The image in which you want to detect PPE on detected persons. The image can be passed as image bytes or you can reference an image stored in an Amazon S3 bucket. </p>\"\
        },\
        \"SummarizationAttributes\":{\
          \"shape\":\"ProtectiveEquipmentSummarizationAttributes\",\
          \"documentation\":\"<p>An array of PPE types that you want to summarize.</p>\"\
        }\
      }\
    },\
    \"DetectProtectiveEquipmentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProtectiveEquipmentModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version number of the PPE detection model used to detect PPE in the image.</p>\"\
        },\
        \"Persons\":{\
          \"shape\":\"ProtectiveEquipmentPersons\",\
          \"documentation\":\"<p>An array of persons detected in the image (including persons not wearing PPE).</p>\"\
        },\
        \"Summary\":{\
          \"shape\":\"ProtectiveEquipmentSummary\",\
          \"documentation\":\"<p>Summary information for the types of PPE specified in the <code>SummarizationAttributes</code> input parameter.</p>\"\
        }\
      }\
    },\
    \"DetectTextFilters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WordFilter\":{\"shape\":\"DetectionFilter\"},\
        \"RegionsOfInterest\":{\
          \"shape\":\"RegionsOfInterest\",\
          \"documentation\":\"<p> A Filter focusing on a certain area of the image. Uses a <code>BoundingBox</code> object to set the region of the image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A set of optional parameters that you can use to set the criteria that the text must meet to be included in your response. <code>WordFilter</code> looks at a wordâs height, width, and minimum confidence. <code>RegionOfInterest</code> lets you set a specific region of the image to look for text in. </p>\"\
    },\
    \"DetectTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call Amazon Rekognition operations, you can't pass image bytes. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"DetectTextFilters\",\
          \"documentation\":\"<p>Optional parameters that let you set the criteria that the text must meet to be included in your response.</p>\"\
        }\
      }\
    },\
    \"DetectTextResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TextDetections\":{\
          \"shape\":\"TextDetectionList\",\
          \"documentation\":\"<p>An array of text that was detected in the input image.</p>\"\
        },\
        \"TextModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The model version used to detect text.</p>\"\
        }\
      }\
    },\
    \"DetectionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Sets the confidence of word detection. Words with detection confidence below this will be excluded from the result. Values should be between 50 and 100 as Text in Video will not return any result below 50.</p>\"\
        },\
        \"MinBoundingBoxHeight\":{\
          \"shape\":\"BoundingBoxHeight\",\
          \"documentation\":\"<p>Sets the minimum height of the word bounding box. Words with bounding box heights lesser than this value will be excluded from the result. Value is relative to the video frame height.</p>\"\
        },\
        \"MinBoundingBoxWidth\":{\
          \"shape\":\"BoundingBoxWidth\",\
          \"documentation\":\"<p>Sets the minimum width of the word bounding box. Words with bounding boxes widths lesser than this value will be excluded from the result. Value is relative to the video frame width.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A set of parameters that allow you to filter out certain results from your returned results.</p>\"\
    },\
    \"DistributeDataset\":{\
      \"type\":\"structure\",\
      \"required\":[\"Arn\"],\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dataset that you want to use. </p>\"\
        }\
      },\
      \"documentation\":\"<p> A training dataset or a test dataset used in a dataset distribution operation. For more information, see <a>DistributeDatasetEntries</a>. </p>\"\
    },\
    \"DistributeDatasetEntriesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Datasets\"],\
      \"members\":{\
        \"Datasets\":{\
          \"shape\":\"DistributeDatasetMetadataList\",\
          \"documentation\":\"<p>The ARNS for the training dataset and test dataset that you want to use. The datasets must belong to the same project. The test dataset must be empty. </p>\"\
        }\
      }\
    },\
    \"DistributeDatasetEntriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DistributeDatasetMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DistributeDataset\"},\
      \"max\":2,\
      \"min\":2\
    },\
    \"Emotion\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"EmotionName\",\
          \"documentation\":\"<p>Type of emotion detected.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The emotions that appear to be expressed on the face, and the confidence level in the determination. The API is only making a determination of the physical appearance of a person's face. It is not a determination of the personâs internal emotional state and should not be used in such a way. For example, a person pretending to have a sad face might not be sad emotionally.</p>\"\
    },\
    \"EmotionName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"HAPPY\",\
        \"SAD\",\
        \"ANGRY\",\
        \"CONFUSED\",\
        \"DISGUSTED\",\
        \"SURPRISED\",\
        \"CALM\",\
        \"UNKNOWN\",\
        \"FEAR\"\
      ]\
    },\
    \"Emotions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Emotion\"}\
    },\
    \"EquipmentDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>A bounding box surrounding the item of detected PPE.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has that the bounding box (<code>BoundingBox</code>) contains an item of PPE.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ProtectiveEquipmentType\",\
          \"documentation\":\"<p>The type of detected PPE.</p>\"\
        },\
        \"CoversBodyPart\":{\
          \"shape\":\"CoversBodyPart\",\
          \"documentation\":\"<p>Information about the body part covered by the detected PPE.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about an item of Personal Protective Equipment (PPE) detected by <a>DetectProtectiveEquipment</a>. For more information, see <a>DetectProtectiveEquipment</a>.</p>\"\
    },\
    \"EquipmentDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EquipmentDetection\"}\
    },\
    \"EvaluationResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"F1Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The F1 score for the evaluation of all labels. The F1 score metric evaluates the overall precision and recall performance of the model as a single value. A higher value indicates better precision and recall performance. A lower score indicates that precision, recall, or both are performing poorly. </p>\"\
        },\
        \"Summary\":{\
          \"shape\":\"Summary\",\
          \"documentation\":\"<p>The S3 bucket that contains the training summary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The evaluation results for the training of a model.</p>\"\
    },\
    \"ExtendedPaginationToken\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"ExternalImageId\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-:]+\"\
    },\
    \"EyeOpen\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the eyes on the face are open.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>\"\
    },\
    \"Eyeglasses\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is wearing eye glasses or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>\"\
    },\
    \"Face\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>Unique identifier that Amazon Rekognition assigns to the face.</p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face.</p>\"\
        },\
        \"ImageId\":{\
          \"shape\":\"ImageId\",\
          \"documentation\":\"<p>Unique identifier that Amazon Rekognition assigns to the input image.</p>\"\
        },\
        \"ExternalImageId\":{\
          \"shape\":\"ExternalImageId\",\
          \"documentation\":\"<p>Identifier that you assign to all the faces in the input image.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the bounding box contains a face (and not a different object such as a tree).</p>\"\
        },\
        \"IndexFacesModelVersion\":{\
          \"shape\":\"IndexFacesModelVersion\",\
          \"documentation\":\"<p> The version of the face detect and storage model that was used when indexing the face vector. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the input image, and external image ID that you assigned. </p>\"\
    },\
    \"FaceAttributes\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DEFAULT\",\
        \"ALL\"\
      ]\
    },\
    \"FaceDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box of the face. Default attribute.</p>\"\
        },\
        \"AgeRange\":{\
          \"shape\":\"AgeRange\",\
          \"documentation\":\"<p>The estimated age range, in years, for the face. Low represents the lowest estimated age and High represents the highest estimated age.</p>\"\
        },\
        \"Smile\":{\
          \"shape\":\"Smile\",\
          \"documentation\":\"<p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>\"\
        },\
        \"Eyeglasses\":{\
          \"shape\":\"Eyeglasses\",\
          \"documentation\":\"<p>Indicates whether or not the face is wearing eye glasses, and the confidence level in the determination.</p>\"\
        },\
        \"Sunglasses\":{\
          \"shape\":\"Sunglasses\",\
          \"documentation\":\"<p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>\"\
        },\
        \"Gender\":{\
          \"shape\":\"Gender\",\
          \"documentation\":\"<p>The predicted gender of a detected face. </p>\"\
        },\
        \"Beard\":{\
          \"shape\":\"Beard\",\
          \"documentation\":\"<p>Indicates whether or not the face has a beard, and the confidence level in the determination.</p>\"\
        },\
        \"Mustache\":{\
          \"shape\":\"Mustache\",\
          \"documentation\":\"<p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>\"\
        },\
        \"EyesOpen\":{\
          \"shape\":\"EyeOpen\",\
          \"documentation\":\"<p>Indicates whether or not the eyes on the face are open, and the confidence level in the determination.</p>\"\
        },\
        \"MouthOpen\":{\
          \"shape\":\"MouthOpen\",\
          \"documentation\":\"<p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>\"\
        },\
        \"Emotions\":{\
          \"shape\":\"Emotions\",\
          \"documentation\":\"<p>The emotions that appear to be expressed on the face, and the confidence level in the determination. The API is only making a determination of the physical appearance of a person's face. It is not a determination of the personâs internal emotional state and should not be used in such a way. For example, a person pretending to have a sad face might not be sad emotionally.</p>\"\
        },\
        \"Landmarks\":{\
          \"shape\":\"Landmarks\",\
          \"documentation\":\"<p>Indicates the location of landmarks on the face. Default attribute.</p>\"\
        },\
        \"Pose\":{\
          \"shape\":\"Pose\",\
          \"documentation\":\"<p>Indicates the pose of the face as determined by its pitch, roll, and yaw. Default attribute.</p>\"\
        },\
        \"Quality\":{\
          \"shape\":\"ImageQuality\",\
          \"documentation\":\"<p>Identifies image brightness and sharpness. Default attribute.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence level that the bounding box contains a face (and not a different object such as a tree). Default attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing attributes of the face that the algorithm detected.</p> <p>A <code>FaceDetail</code> object contains either the default facial attributes or all facial attributes. The default attributes are <code>BoundingBox</code>, <code>Confidence</code>, <code>Landmarks</code>, <code>Pose</code>, and <code>Quality</code>.</p> <p> <a>GetFaceDetection</a> is the only Amazon Rekognition Video stored video operation that can return a <code>FaceDetail</code> object with all attributes. To specify which attributes to return, use the <code>FaceAttributes</code> input parameter for <a>StartFaceDetection</a>. The following Amazon Rekognition Video operations return only the default attributes. The corresponding Start operations don't have a <code>FaceAttributes</code> input parameter.</p> <ul> <li> <p>GetCelebrityRecognition</p> </li> <li> <p>GetPersonTracking</p> </li> <li> <p>GetFaceSearch</p> </li> </ul> <p>The Amazon Rekognition Image <a>DetectFaces</a> and <a>IndexFaces</a> operations can return all facial attributes. To specify which attributes to return, use the <code>Attributes</code> input parameter for <code>DetectFaces</code>. For <code>IndexFaces</code>, use the <code>DetectAttributes</code> input parameter.</p>\"\
    },\
    \"FaceDetailList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceDetail\"}\
    },\
    \"FaceDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time, in milliseconds from the start of the video, that the face was detected.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>The face properties for the detected face.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a face detected in a video analysis request and the time the face was detected in the video. </p>\"\
    },\
    \"FaceDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceDetection\"}\
    },\
    \"FaceId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"FaceIdList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceId\"},\
      \"max\":4096,\
      \"min\":1\
    },\
    \"FaceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Face\"}\
    },\
    \"FaceMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Similarity\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Confidence in the match of this face with the input face.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"Face\",\
          \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the source image, and external image ID that you assigned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides face metadata. In addition, it also provides the confidence in the match of this face with the input face.</p>\"\
    },\
    \"FaceMatchList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceMatch\"}\
    },\
    \"FaceModelVersionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"FaceRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Face\":{\
          \"shape\":\"Face\",\
          \"documentation\":\"<p>Describes the face properties such as the bounding box, face ID, image ID of the input image, and external image ID that you assigned. </p>\"\
        },\
        \"FaceDetail\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>Structure containing attributes of the face that the algorithm detected.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Object containing both the face metadata (stored in the backend database), and facial attributes that are detected but aren't stored in the database.</p>\"\
    },\
    \"FaceRecordList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FaceRecord\"}\
    },\
    \"FaceSearchSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>The ID of a collection that contains faces that you want to search for.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Minimum face match confidence score that must be met to return a result for a recognized face. The default is 80. 0 is the lowest confidence. 100 is the highest confidence. Values between 0 and 100 are accepted, and values lower than 80 are set to 80.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Input face recognition parameters for an Amazon Rekognition stream processor. <code>FaceRecognitionSettings</code> is a request parameter for <a>CreateStreamProcessor</a>.</p>\"\
    },\
    \"FaceSearchSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INDEX\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"FlowDefinitionArn\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"Gender\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"GenderType\",\
          \"documentation\":\"<p>The predicted gender of the face.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the prediction.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The predicted gender of a detected face. </p> <p>Amazon Rekognition makes gender binary (male/female) predictions based on the physical appearance of a face in a particular image. This kind of prediction is not designed to categorize a personâs gender identity, and you shouldn't use Amazon Rekognition to make such a determination. For example, a male actor wearing a long-haired wig and earrings for a role might be predicted as female.</p> <p>Using Amazon Rekognition to make gender binary predictions is best suited for use cases where aggregate gender distribution statistics need to be analyzed without identifying specific users. For example, the percentage of female users compared to male users on a social media platform. </p> <p>We don't recommend using gender binary predictions to make decisions that impact&#x2028; an individual's rights, privacy, or access to services.</p>\"\
    },\
    \"GenderType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Male\",\
        \"Female\"\
      ]\
    },\
    \"Geometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>An axis-aligned coarse representation of the detected item's location on the image.</p>\"\
        },\
        \"Polygon\":{\
          \"shape\":\"Polygon\",\
          \"documentation\":\"<p>Within the bounding box, a fine-grained polygon around the detected item.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about where an object (<a>DetectCustomLabels</a>) or text (<a>DetectText</a>) is located on an image.</p>\"\
    },\
    \"GetCelebrityInfoRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Id\"],\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"RekognitionUniqueId\",\
          \"documentation\":\"<p>The ID for the celebrity. You get the celebrity ID from a call to the <a>RecognizeCelebrities</a> operation, which recognizes celebrities in an image. </p>\"\
        }\
      }\
    },\
    \"GetCelebrityInfoResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Urls\":{\
          \"shape\":\"Urls\",\
          \"documentation\":\"<p>An array of URLs pointing to additional celebrity information. </p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the celebrity.</p>\"\
        },\
        \"KnownGender\":{\
          \"shape\":\"KnownGender\",\
          \"documentation\":\"<p>Retrieves the known gender for the celebrity.</p>\"\
        }\
      }\
    },\
    \"GetCelebrityRecognitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Job identifier for the required celebrity recognition analysis. You can get the job identifer from a call to <code>StartCelebrityRecognition</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more recognized celebrities to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of celebrities. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"CelebrityRecognitionSortBy\",\
          \"documentation\":\"<p>Sort to use for celebrities returned in <code>Celebrities</code> field. Specify <code>ID</code> to sort by the celebrity identifier, specify <code>TIMESTAMP</code> to sort by the time the celebrity was recognized.</p>\"\
        }\
      }\
    },\
    \"GetCelebrityRecognitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the celebrity recognition job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition Video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of celebrities.</p>\"\
        },\
        \"Celebrities\":{\
          \"shape\":\"CelebrityRecognitions\",\
          \"documentation\":\"<p>Array of celebrities recognized in the video.</p>\"\
        }\
      }\
    },\
    \"GetContentModerationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the inappropriate, unwanted, or offensive content moderation job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of content moderation labels.</p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"ContentModerationSortBy\",\
          \"documentation\":\"<p>Sort to use for elements in the <code>ModerationLabelDetections</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time labels are detected. Use <code>NAME</code> to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>\"\
        }\
      }\
    },\
    \"GetContentModerationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the content moderation analysis job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from <code>GetContentModeration</code>. </p>\"\
        },\
        \"ModerationLabels\":{\
          \"shape\":\"ContentModerationDetections\",\
          \"documentation\":\"<p>The detected inappropriate, unwanted, or offensive content moderation labels and the time(s) they were detected.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of content moderation labels. </p>\"\
        },\
        \"ModerationModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the moderation detection model that was used to detect inappropriate, unwanted, or offensive content.</p>\"\
        }\
      }\
    },\
    \"GetFaceDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Unique identifier for the face detection job. The <code>JobId</code> is returned from <code>StartFaceDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more faces to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>\"\
        }\
      }\
    },\
    \"GetFaceDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the face detection job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces. </p>\"\
        },\
        \"Faces\":{\
          \"shape\":\"FaceDetections\",\
          \"documentation\":\"<p>An array of faces detected in the video. Each element contains a detected face's details and the time, in milliseconds from the start of the video, the face was detected. </p>\"\
        }\
      }\
    },\
    \"GetFaceSearchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The job identifer for the search request. You get the job identifier from an initial call to <code>StartFaceSearch</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more search results to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of search results. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"FaceSearchSortBy\",\
          \"documentation\":\"<p>Sort to use for grouping faces in the response. Use <code>TIMESTAMP</code> to group faces by the time that they are recognized. Use <code>INDEX</code> to sort by recognized faces. </p>\"\
        }\
      }\
    },\
    \"GetFaceSearchResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the face search job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of search results. </p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition Video operation. </p>\"\
        },\
        \"Persons\":{\
          \"shape\":\"PersonMatches\",\
          \"documentation\":\"<p>An array of persons, <a>PersonMatch</a>, in the video whose face(s) match the face(s) in an Amazon Rekognition collection. It also includes time information for when persons are matched in the video. You specify the input collection in an initial call to <code>StartFaceSearch</code>. Each <code>Persons</code> element includes a time the person was matched, face match details (<code>FaceMatches</code>) for matching faces in the collection, and person information (<code>Person</code>) for the matched person. </p>\"\
        }\
      }\
    },\
    \"GetLabelDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Job identifier for the label detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartlabelDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of labels. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"LabelDetectionSortBy\",\
          \"documentation\":\"<p>Sort to use for elements in the <code>Labels</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time labels are detected. Use <code>NAME</code> to alphabetically group elements for a label together. Within each label group, the array element are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>\"\
        }\
      }\
    },\
    \"GetLabelDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the label detection job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of labels.</p>\"\
        },\
        \"Labels\":{\
          \"shape\":\"LabelDetections\",\
          \"documentation\":\"<p>An array of labels detected in the video. Each element contains the detected label and the time, in milliseconds from the start of the video, that the label was detected. </p>\"\
        },\
        \"LabelModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the label detection model that was used to detect labels.</p>\"\
        }\
      }\
    },\
    \"GetPersonTrackingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for a job that tracks persons in a video. You get the <code>JobId</code> from a call to <code>StartPersonTracking</code>. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000. If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more persons to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of persons. </p>\"\
        },\
        \"SortBy\":{\
          \"shape\":\"PersonTrackingSortBy\",\
          \"documentation\":\"<p>Sort to use for elements in the <code>Persons</code> array. Use <code>TIMESTAMP</code> to sort array elements by the time persons are detected. Use <code>INDEX</code> to sort by the tracked persons. If you sort by <code>INDEX</code>, the array elements for each person are sorted by detection confidence. The default sort is by <code>TIMESTAMP</code>.</p>\"\
        }\
      }\
    },\
    \"GetPersonTrackingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>The current status of the person tracking job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadata\",\
          \"documentation\":\"<p>Information about a video that Amazon Rekognition Video analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition Video operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of persons. </p>\"\
        },\
        \"Persons\":{\
          \"shape\":\"PersonDetections\",\
          \"documentation\":\"<p>An array of the persons detected in the video and the time(s) their path was tracked throughout the video. An array element will exist for each time a person's path is tracked. </p>\"\
        }\
      }\
    },\
    \"GetSegmentDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Job identifier for the text detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartSegmentDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of text.</p>\"\
        }\
      }\
    },\
    \"GetSegmentDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>Current status of the segment detection job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\
          \"shape\":\"VideoMetadataList\",\
          \"documentation\":\"<p>Currently, Amazon Rekognition Video returns a single object in the <code>VideoMetadata</code> array. The object contains information about the video stream in the input file that Amazon Rekognition Video chose to analyze. The <code>VideoMetadata</code> object includes the video codec, video format and other information. Video metadata is returned in each page of information returned by <code>GetSegmentDetection</code>.</p>\"\
        },\
        \"AudioMetadata\":{\
          \"shape\":\"AudioMetadataList\",\
          \"documentation\":\"<p>An array of objects. There can be multiple audio streams. Each <code>AudioMetadata</code> object contains metadata for a single audio stream. Audio information in an <code>AudioMetadata</code> objects includes the audio codec, the number of audio channels, the duration of the audio stream, and the sample rate. Audio metadata is returned in each page of information returned by <code>GetSegmentDetection</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of text.</p>\"\
        },\
        \"Segments\":{\
          \"shape\":\"SegmentDetections\",\
          \"documentation\":\"<p>An array of segments detected in a video. The array is sorted by the segment types (TECHNICAL_CUE or SHOT) specified in the <code>SegmentTypes</code> input parameter of <code>StartSegmentDetection</code>. Within each segment type the array is sorted by timestamp values.</p>\"\
        },\
        \"SelectedSegmentTypes\":{\
          \"shape\":\"SegmentTypesInfo\",\
          \"documentation\":\"<p>An array containing the segment types requested in the call to <code>StartSegmentDetection</code>. </p>\"\
        }\
      }\
    },\
    \"GetTextDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Job identifier for the text detection operation for which you want results returned. You get the job identifer from an initial call to <code>StartTextDetection</code>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of results to return per paginated call. The largest value you can specify is 1000.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more labels to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of text.</p>\"\
        }\
      }\
    },\
    \"GetTextDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobStatus\":{\
          \"shape\":\"VideoJobStatus\",\
          \"documentation\":\"<p>Current status of the text detection job.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>If the job fails, <code>StatusMessage</code> provides a descriptive error message.</p>\"\
        },\
        \"VideoMetadata\":{\"shape\":\"VideoMetadata\"},\
        \"TextDetections\":{\
          \"shape\":\"TextDetectionResults\",\
          \"documentation\":\"<p>An array of text detected in the video. Each element contains the detected text, the time in milliseconds from the start of the video that the text was detected, and where it was detected on the screen.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of text.</p>\"\
        },\
        \"TextModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Version number of the text detection model that was used to detect text.</p>\"\
        }\
      }\
    },\
    \"GroundTruthBlob\":{\
      \"type\":\"blob\",\
      \"max\":5242880,\
      \"min\":1\
    },\
    \"GroundTruthManifest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Object\":{\"shape\":\"S3Object\"}\
      },\
      \"documentation\":\"<p>The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest file. </p>\"\
    },\
    \"HasErrors\":{\"type\":\"boolean\"},\
    \"HumanLoopActivationConditionsEvaluationResults\":{\
      \"type\":\"string\",\
      \"max\":10240\
    },\
    \"HumanLoopActivationOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HumanLoopArn\":{\
          \"shape\":\"HumanLoopArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the HumanLoop created.</p>\"\
        },\
        \"HumanLoopActivationReasons\":{\
          \"shape\":\"HumanLoopActivationReasons\",\
          \"documentation\":\"<p>Shows if and why human review was needed.</p>\"\
        },\
        \"HumanLoopActivationConditionsEvaluationResults\":{\
          \"shape\":\"HumanLoopActivationConditionsEvaluationResults\",\
          \"documentation\":\"<p>Shows the result of condition evaluations, including those conditions which activated a human review.</p>\",\
          \"jsonvalue\":true\
        }\
      },\
      \"documentation\":\"<p>Shows the results of the human in the loop evaluation. If there is no HumanLoopArn, the input did not trigger human review.</p>\"\
    },\
    \"HumanLoopActivationReason\":{\"type\":\"string\"},\
    \"HumanLoopActivationReasons\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HumanLoopActivationReason\"},\
      \"min\":1\
    },\
    \"HumanLoopArn\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"HumanLoopConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HumanLoopName\",\
        \"FlowDefinitionArn\"\
      ],\
      \"members\":{\
        \"HumanLoopName\":{\
          \"shape\":\"HumanLoopName\",\
          \"documentation\":\"<p>The name of the human review used for this image. This should be kept unique within a region.</p>\"\
        },\
        \"FlowDefinitionArn\":{\
          \"shape\":\"FlowDefinitionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the flow definition. You can create a flow definition by using the Amazon Sagemaker <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateFlowDefinition.html\\\">CreateFlowDefinition</a> Operation. </p>\"\
        },\
        \"DataAttributes\":{\
          \"shape\":\"HumanLoopDataAttributes\",\
          \"documentation\":\"<p>Sets attributes of the input data.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sets up the flow definition the image will be sent to if one of the conditions is met. You can also set certain attributes of the image before review.</p>\"\
    },\
    \"HumanLoopDataAttributes\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContentClassifiers\":{\
          \"shape\":\"ContentClassifiers\",\
          \"documentation\":\"<p>Sets whether the input image is free of personally identifiable information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Allows you to set attributes of the image. Currently, you can declare an image as free of personally identifiable information.</p>\"\
    },\
    \"HumanLoopName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-z0-9](-*[a-z0-9])*\"\
    },\
    \"HumanLoopQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource type.</p>\"\
        },\
        \"QuotaCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The quota code.</p>\"\
        },\
        \"ServiceCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The service code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The number of in-progress human reviews you have has exceeded the number allowed.</p>\",\
      \"exception\":true\
    },\
    \"IdempotentParameterMismatchException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A <code>ClientRequestToken</code> input parameter was reused with an operation, but at least one of the other input parameters is different from the previous call to the operation.</p>\",\
      \"exception\":true\
    },\
    \"Image\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bytes\":{\
          \"shape\":\"ImageBlob\",\
          \"documentation\":\"<p>Blob of image bytes up to 5 MBs.</p>\"\
        },\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>Identifies an S3 object as the image source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the input image either as bytes or an S3 object.</p> <p>You pass image bytes to an Amazon Rekognition API operation by using the <code>Bytes</code> property. For example, you would use the <code>Bytes</code> property to pass an image loaded from a local file system. Image bytes passed by using the <code>Bytes</code> property must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to call Amazon Rekognition API operations. </p> <p>For more information, see Analyzing an Image Loaded from a Local File System in the Amazon Rekognition Developer Guide.</p> <p> You pass images stored in an S3 bucket to an Amazon Rekognition API operation by using the <code>S3Object</code> property. Images stored in an S3 bucket do not need to be base64-encoded.</p> <p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p> <p>If you use the AWS CLI to call Amazon Rekognition operations, passing image bytes using the Bytes property is not supported. You must first upload the image to an Amazon S3 bucket and then call the operation using the S3Object property.</p> <p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource Based Policies in the Amazon Rekognition Developer Guide. </p>\"\
    },\
    \"ImageBlob\":{\
      \"type\":\"blob\",\
      \"max\":5242880,\
      \"min\":1\
    },\
    \"ImageId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\"\
    },\
    \"ImageQuality\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Brightness\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Value representing brightness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a brighter face image.</p>\"\
        },\
        \"Sharpness\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Value representing sharpness of the face. The service returns a value between 0 and 100 (inclusive). A higher value indicates a sharper face image.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies face image brightness and sharpness. </p>\"\
    },\
    \"ImageTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The input image size exceeds the allowed limit. If you are calling DetectProtectiveEquipment, the image size or resolution exceeds the allowed limit. For more information, see Limits in Amazon Rekognition in the Amazon Rekognition Developer Guide. </p>\",\
      \"exception\":true\
    },\
    \"IndexFacesModelVersion\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9\\\\.]+\"\
    },\
    \"IndexFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>The ID of an existing collection to which you want to add the faces that are detected in the input images.</p>\"\
        },\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes isn't supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"ExternalImageId\":{\
          \"shape\":\"ExternalImageId\",\
          \"documentation\":\"<p>The ID you want to assign to all the faces detected in the image.</p>\"\
        },\
        \"DetectionAttributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>An array of facial attributes that you want to be returned. This can be the default list of attributes or all attributes. If you don't specify a value for <code>Attributes</code> or if you specify <code>[\\\"DEFAULT\\\"]</code>, the API returns the following subset of facial attributes: <code>BoundingBox</code>, <code>Confidence</code>, <code>Pose</code>, <code>Quality</code>, and <code>Landmarks</code>. If you provide <code>[\\\"ALL\\\"]</code>, all facial attributes are returned, but the operation takes longer to complete.</p> <p>If you provide both, <code>[\\\"ALL\\\", \\\"DEFAULT\\\"]</code>, the service uses a logical AND operator to determine which attributes to return (in this case, all attributes). </p>\"\
        },\
        \"MaxFaces\":{\
          \"shape\":\"MaxFacesToIndex\",\
          \"documentation\":\"<p>The maximum number of faces to index. The value of <code>MaxFaces</code> must be greater than or equal to 1. <code>IndexFaces</code> returns no more than 100 detected faces in an image, even if you specify a larger value for <code>MaxFaces</code>.</p> <p>If <code>IndexFaces</code> detects more faces than the value of <code>MaxFaces</code>, the faces with the lowest quality are filtered out first. If there are still more faces than the value of <code>MaxFaces</code>, the faces with the smallest bounding boxes are filtered out (up to the number that's needed to satisfy the value of <code>MaxFaces</code>). Information about the unindexed faces is available in the <code>UnindexedFaces</code> array. </p> <p>The faces that are returned by <code>IndexFaces</code> are sorted by the largest face bounding box size to the smallest size, in descending order.</p> <p> <code>MaxFaces</code> can be used with a collection associated with any version of the face model.</p>\"\
        },\
        \"QualityFilter\":{\
          \"shape\":\"QualityFilter\",\
          \"documentation\":\"<p>A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't indexed. If you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>, filtering removes all faces that donât meet the chosen quality bar. The default value is <code>AUTO</code>. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify <code>NONE</code>, no filtering is performed. </p> <p>To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.</p>\"\
        }\
      }\
    },\
    \"IndexFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceRecords\":{\
          \"shape\":\"FaceRecordList\",\
          \"documentation\":\"<p>An array of faces detected and added to the collection. For more information, see Searching Faces in a Collection in the Amazon Rekognition Developer Guide. </p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<p>If your collection is associated with a face detection model that's later than version 3.0, the value of <code>OrientationCorrection</code> is always null and no orientation information is returned.</p> <p>If your collection is associated with a face detection model that's version 3.0 or earlier, the following applies:</p> <ul> <li> <p>If the input image is in .jpeg format, it might contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation information to perform image correction - the bounding box coordinates are translated to represent object locations after the orientation information in the Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata. The value of <code>OrientationCorrection</code> is null.</p> </li> <li> <p>If the image doesn't contain orientation information in its Exif metadata, Amazon Rekognition returns an estimated orientation (ROTATE_0, ROTATE_90, ROTATE_180, ROTATE_270). Amazon Rekognition doesnât perform image correction for images. The bounding box coordinates aren't translated and represent the object locations before the image is rotated.</p> </li> </ul> <p>Bounding box information is returned in the <code>FaceRecords</code> array. You can get the version of the face detection model by calling <a>DescribeCollection</a>. </p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Latest face model being used with the collection. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/face-detection-model.html\\\">Model versioning</a>.</p>\"\
        },\
        \"UnindexedFaces\":{\
          \"shape\":\"UnindexedFaces\",\
          \"documentation\":\"<p>An array of faces that were detected in the image but weren't indexed. They weren't indexed because the quality filter identified them as low quality, or the <code>MaxFaces</code> request parameter filtered them out. To use the quality filter, you specify the <code>QualityFilter</code> request parameter.</p>\"\
        }\
      }\
    },\
    \"InferenceUnits\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>The position of the label instance on the image.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has in the accuracy of the bounding box.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An instance of a label returned by Amazon Rekognition Image (<a>DetectLabels</a>) or by Amazon Rekognition Video (<a>GetLabelDetection</a>).</p>\"\
    },\
    \"Instances\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Instance\"}\
    },\
    \"InternalServerError\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition experienced a service issue. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidImageFormatException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The provided image format is not supported. </p>\",\
      \"exception\":true\
    },\
    \"InvalidPaginationTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Pagination token in the request is not valid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Input parameter violated a constraint. Validate your parameter before calling the API operation again.</p>\",\
      \"exception\":true\
    },\
    \"InvalidS3ObjectException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition is unable to access the S3 object specified in the request.</p>\",\
      \"exception\":true\
    },\
    \"IsLabeled\":{\"type\":\"boolean\"},\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-_]+$\"\
    },\
    \"JobTag\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-:]+\"\
    },\
    \"KinesisDataArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:([a-z\\\\d-]+):kinesis:([a-z\\\\d-]+):\\\\d{12}:.+$)\"\
    },\
    \"KinesisDataStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"KinesisDataArn\",\
          \"documentation\":\"<p>ARN of the output Amazon Kinesis Data Streams stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Kinesis data stream Amazon Rekognition to which the analysis results of a Amazon Rekognition stream processor are streamed. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"KinesisVideoArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:([a-z\\\\d-]+):kinesisvideo:([a-z\\\\d-]+):\\\\d{12}:.+$)\"\
    },\
    \"KinesisVideoStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"KinesisVideoArn\",\
          \"documentation\":\"<p>ARN of the Kinesis video stream stream that streams the source video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Kinesis video stream stream that provides the source streaming video for a Amazon Rekognition Video stream processor. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$\"\
    },\
    \"KnownGender\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"KnownGenderType\",\
          \"documentation\":\"<p>A string value of the KnownGender info about the Celebrity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The known gender identity for the celebrity that matches the provided ID. The known gender identity can be Male, Female, Nonbinary, or Unlisted.</p>\"\
    },\
    \"KnownGenderType\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A list of enum string of possible gender values that Celebrity returns.</p>\",\
      \"enum\":[\
        \"Male\",\
        \"Female\",\
        \"Nonbinary\",\
        \"Unlisted\"\
      ]\
    },\
    \"Label\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name (label) of the object or scene.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence.</p>\"\
        },\
        \"Instances\":{\
          \"shape\":\"Instances\",\
          \"documentation\":\"<p>If <code>Label</code> represents an object, <code>Instances</code> contains the bounding boxes for each instance of the detected object. Bounding boxes are returned for common object labels such as people, cars, furniture, apparel or pets.</p>\"\
        },\
        \"Parents\":{\
          \"shape\":\"Parents\",\
          \"documentation\":\"<p>The parent labels for a label. The response includes all ancestor labels.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Structure containing details about the detected label, including the name, detected instances, parent labels, and level of confidence.</p> <p> </p>\"\
    },\
    \"LabelDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Time, in milliseconds from the start of the video, that the label was detected.</p>\"\
        },\
        \"Label\":{\
          \"shape\":\"Label\",\
          \"documentation\":\"<p>Details about the detected label.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a label detected in a video analysis request and the time the label was detected in the video. </p>\"\
    },\
    \"LabelDetectionSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NAME\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"LabelDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LabelDetection\"}\
    },\
    \"Labels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Label\"}\
    },\
    \"Landmark\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"LandmarkType\",\
          \"documentation\":\"<p>Type of landmark.</p>\"\
        },\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The x-coordinate of the landmark expressed as a ratio of the width of the image. The x-coordinate is measured from the left-side of the image. For example, if the image is 700 pixels wide and the x-coordinate of the landmark is at 350 pixels, this value is 0.5. </p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The y-coordinate of the landmark expressed as a ratio of the height of the image. The y-coordinate is measured from the top of the image. For example, if the image height is 200 pixels and the y-coordinate of the landmark is at 50 pixels, this value is 0.25.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the location of the landmark on the face.</p>\"\
    },\
    \"LandmarkType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"eyeLeft\",\
        \"eyeRight\",\
        \"nose\",\
        \"mouthLeft\",\
        \"mouthRight\",\
        \"leftEyeBrowLeft\",\
        \"leftEyeBrowRight\",\
        \"leftEyeBrowUp\",\
        \"rightEyeBrowLeft\",\
        \"rightEyeBrowRight\",\
        \"rightEyeBrowUp\",\
        \"leftEyeLeft\",\
        \"leftEyeRight\",\
        \"leftEyeUp\",\
        \"leftEyeDown\",\
        \"rightEyeLeft\",\
        \"rightEyeRight\",\
        \"rightEyeUp\",\
        \"rightEyeDown\",\
        \"noseLeft\",\
        \"noseRight\",\
        \"mouthUp\",\
        \"mouthDown\",\
        \"leftPupil\",\
        \"rightPupil\",\
        \"upperJawlineLeft\",\
        \"midJawlineLeft\",\
        \"chinBottom\",\
        \"midJawlineRight\",\
        \"upperJawlineRight\"\
      ]\
    },\
    \"Landmarks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Landmark\"}\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>An Amazon Rekognition service limit was exceeded. For example, if you start too many Amazon Rekognition Video jobs concurrently, calls to start operations (<code>StartLabelDetection</code>, for example) will raise a <code>LimitExceededException</code> exception (HTTP status code: 400) until the number of concurrently running jobs is below the Amazon Rekognition service limit. </p>\",\
      \"exception\":true\
    },\
    \"ListCollectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>Pagination token from the previous response.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>Maximum number of collection IDs to return. </p>\"\
        }\
      }\
    },\
    \"ListCollectionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CollectionIds\":{\
          \"shape\":\"CollectionIdList\",\
          \"documentation\":\"<p>An array of collection IDs.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the result is truncated, the response provides a <code>NextToken</code> that you can use in the subsequent request to fetch the next set of collection IDs.</p>\"\
        },\
        \"FaceModelVersions\":{\
          \"shape\":\"FaceModelVersionList\",\
          \"documentation\":\"<p>Latest face models being used with the corresponding collections in the array. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/face-detection-model.html\\\">Model versioning</a>. For example, the value of <code>FaceModelVersions[2]</code> is the version number for the face detection model used by the collection in <code>CollectionId[2]</code>.</p>\"\
        }\
      }\
    },\
    \"ListDatasetEntriesPageSize\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListDatasetEntriesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DatasetArn\"],\
      \"members\":{\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) for the dataset that you want to use. </p>\"\
        },\
        \"ContainsLabels\":{\
          \"shape\":\"DatasetLabels\",\
          \"documentation\":\"<p>Specifies a label filter for the response. The response includes an entry only if one or more of the labels in <code>ContainsLabels</code> exist in the entry. </p>\"\
        },\
        \"Labeled\":{\
          \"shape\":\"IsLabeled\",\
          \"documentation\":\"<p> Specify <code>true</code> to get only the JSON Lines where the image is labeled. Specify <code>false</code> to get only the JSON Lines where the image isn't labeled. If you don't specify <code>Labeled</code>, <code>ListDatasetEntries</code> returns JSON Lines for labeled and unlabeled images. </p>\"\
        },\
        \"SourceRefContains\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>If specified, <code>ListDatasetEntries</code> only returns JSON Lines where the value of <code>SourceRefContains</code> is part of the <code>source-ref</code> field. The <code>source-ref</code> field contains the Amazon S3 location of the image. You can use <code>SouceRefContains</code> for tasks such as getting the JSON Line for a single image, or gettting JSON Lines for all images within a specific folder.</p>\"\
        },\
        \"HasErrors\":{\
          \"shape\":\"HasErrors\",\
          \"documentation\":\"<p>Specifies an error filter for the response. Specify <code>True</code> to only include entries that have errors. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListDatasetEntriesPageSize\",\
          \"documentation\":\"<p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>\"\
        }\
      }\
    },\
    \"ListDatasetEntriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DatasetEntries\":{\
          \"shape\":\"DatasetEntries\",\
          \"documentation\":\"<p> A list of entries (images) in the dataset. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListDatasetLabelsPageSize\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListDatasetLabelsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DatasetArn\"],\
      \"members\":{\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the dataset that you want to use. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListDatasetLabelsPageSize\",\
          \"documentation\":\"<p>The maximum number of results to return per paginated call. The largest value you can specify is 100. If you specify a value greater than 100, a ValidationException error occurs. The default value is 100. </p>\"\
        }\
      }\
    },\
    \"ListDatasetLabelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DatasetLabelDescriptions\":{\
          \"shape\":\"DatasetLabelDescriptions\",\
          \"documentation\":\"<p> A list of the labels in the dataset. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"ExtendedPaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more results to retrieve), Amazon Rekognition Custom Labels returns a pagination token in the response. You can use this pagination token to retrieve the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionId\"],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection from which to list the faces.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition returns a pagination token in the response. You can use this pagination token to retrieve the next set of faces.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PageSize\",\
          \"documentation\":\"<p>Maximum number of faces to return.</p>\"\
        }\
      }\
    },\
    \"ListFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Faces\":{\
          \"shape\":\"FaceList\",\
          \"documentation\":\"<p>An array of <code>Face</code> objects. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition returns this token that you can use in the subsequent request to retrieve the next set of faces.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Latest face model being used with the collection. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/face-detection-model.html\\\">Model versioning</a>.</p>\"\
        }\
      }\
    },\
    \"ListStreamProcessorsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the previous response was incomplete (because there are more stream processors to retrieve), Amazon Rekognition Video returns a pagination token in the response. You can use this pagination token to retrieve the next set of stream processors. </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>Maximum number of stream processors you want Amazon Rekognition Video to return in the response. The default is 1000. </p>\"\
        }\
      }\
    },\
    \"ListStreamProcessorsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"PaginationToken\",\
          \"documentation\":\"<p>If the response is truncated, Amazon Rekognition Video returns this token that you can use in the subsequent request to retrieve the next set of stream processors. </p>\"\
        },\
        \"StreamProcessors\":{\
          \"shape\":\"StreamProcessorList\",\
          \"documentation\":\"<p>List of stream processors that you have created.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p> Amazon Resource Name (ARN) of the model, collection, or stream processor that contains the tags that you want a list of. </p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> A list of key-value tags assigned to the resource. </p>\"\
        }\
      }\
    },\
    \"MaxFaces\":{\
      \"type\":\"integer\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"MaxFacesToIndex\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MaxPixelThreshold\":{\
      \"type\":\"float\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"MinCoveragePercentage\":{\
      \"type\":\"float\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"ModerationLabel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the confidence that Amazon Rekognition has that the label has been correctly identified.</p> <p>If you don't specify the <code>MinConfidence</code> parameter in the call to <code>DetectModerationLabels</code>, the operation returns labels with a confidence value greater than or equal to 50 percent.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The label name for the type of unsafe content detected in the image.</p>\"\
        },\
        \"ParentName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name for the parent label. Labels at the top level of the hierarchy have the parent label <code>\\\"\\\"</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a single type of inappropriate, unwanted, or offensive content found in an image or video. Each type of moderated content has a label within a hierarchical taxonomy. For more information, see Content moderation in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"ModerationLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ModerationLabel\"}\
    },\
    \"MouthOpen\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the mouth on the face is open or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the mouth on the face is open, and the confidence level in the determination.</p>\"\
    },\
    \"Mustache\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face has mustache or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face has a mustache, and the confidence level in the determination.</p>\"\
    },\
    \"NotificationChannel\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SNSTopicArn\",\
        \"RoleArn\"\
      ],\
      \"members\":{\
        \"SNSTopicArn\":{\
          \"shape\":\"SNSTopicArn\",\
          \"documentation\":\"<p>The Amazon SNS topic to which Amazon Rekognition to posts the completion status.</p>\"\
        },\
        \"RoleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that gives Amazon Rekognition publishing permissions to the Amazon SNS topic. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion status of a video analysis operation. For more information, see <a>api-video</a>. Note that the Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/api-video-roles.html#api-video-roles-all-topics\\\">Giving access to multiple Amazon SNS topics</a>.</p>\"\
    },\
    \"OrientationCorrection\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ROTATE_0\",\
        \"ROTATE_90\",\
        \"ROTATE_180\",\
        \"ROTATE_270\"\
      ]\
    },\
    \"OutputConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>The S3 bucket where training output is placed.</p>\"\
        },\
        \"S3KeyPrefix\":{\
          \"shape\":\"S3KeyPrefix\",\
          \"documentation\":\"<p>The prefix applied to the training output files. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The S3 bucket and folder location where training output is placed.</p>\"\
    },\
    \"PageSize\":{\
      \"type\":\"integer\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"PaginationToken\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"Parent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the parent label.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A parent label for a label. A label can have 0, 1, or more parents. </p>\"\
    },\
    \"Parents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Parent\"}\
    },\
    \"Percent\":{\
      \"type\":\"float\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"PersonDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"PersonIndex\",\
          \"documentation\":\"<p>Identifier for the person detected person within a video. Use to keep track of the person throughout the video. The identifier is not stored by Amazon Rekognition.</p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Bounding box around the detected person.</p>\"\
        },\
        \"Face\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>Face details for the detected person.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details about a person detected in a video analysis request.</p>\"\
    },\
    \"PersonDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the start of the video, that the person's path was tracked.</p>\"\
        },\
        \"Person\":{\
          \"shape\":\"PersonDetail\",\
          \"documentation\":\"<p>Details about a person whose path was tracked in a video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Details and path tracking information for a single time a person's path is tracked in a video. Amazon Rekognition operations that track people's paths return an array of <code>PersonDetection</code> objects with elements for each time a person's path is tracked in a video. </p> <p>For more information, see GetPersonTracking in the Amazon Rekognition Developer Guide. </p>\"\
    },\
    \"PersonDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PersonDetection\"}\
    },\
    \"PersonIndex\":{\"type\":\"long\"},\
    \"PersonMatch\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the beginning of the video, that the person was matched in the video.</p>\"\
        },\
        \"Person\":{\
          \"shape\":\"PersonDetail\",\
          \"documentation\":\"<p>Information about the matched person.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>Information about the faces in the input collection that match the face of a person in the video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a person whose face matches a face(s) in an Amazon Rekognition collection. Includes information about the faces in the Amazon Rekognition collection (<a>FaceMatch</a>), information about the person (<a>PersonDetail</a>), and the time stamp for when the person was detected in a video. An array of <code>PersonMatch</code> objects is returned by <a>GetFaceSearch</a>. </p>\"\
    },\
    \"PersonMatches\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PersonMatch\"}\
    },\
    \"PersonTrackingSortBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INDEX\",\
        \"TIMESTAMP\"\
      ]\
    },\
    \"Point\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the X coordinate for a point on a <code>Polygon</code>.</p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the Y coordinate for a point on a <code>Polygon</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The X and Y coordinates of a point on an image. The X and Y values returned are ratios of the overall image size. For example, if the input image is 700x200 and the operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the image.</p> <p>An array of <code>Point</code> objects, <code>Polygon</code>, is returned by <a>DetectText</a> and by <a>DetectCustomLabels</a>. <code>Polygon</code> represents a fine-grained polygon around a detected item. For more information, see Geometry in the Amazon Rekognition Developer Guide. </p>\"\
    },\
    \"Polygon\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Point\"}\
    },\
    \"Pose\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Roll\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the roll axis.</p>\"\
        },\
        \"Yaw\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the yaw axis.</p>\"\
        },\
        \"Pitch\":{\
          \"shape\":\"Degree\",\
          \"documentation\":\"<p>Value representing the face rotation on the pitch axis.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates the pose of the face as determined by its pitch, roll, and yaw.</p>\"\
    },\
    \"ProjectArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"(^arn:[a-z\\\\d-]+:rekognition:[a-z\\\\d-]+:\\\\d{12}:project\\\\/[a-zA-Z0-9_.\\\\-]{1,255}\\\\/[0-9]+$)\"\
    },\
    \"ProjectDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectArn\":{\
          \"shape\":\"ProjectArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the project.</p>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The Unix timestamp for the date and time that the project was created.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ProjectStatus\",\
          \"documentation\":\"<p>The current status of the project.</p>\"\
        },\
        \"Datasets\":{\
          \"shape\":\"DatasetMetadataList\",\
          \"documentation\":\"<p> Information about the training and test datasets in the project. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A description of an Amazon Rekognition Custom Labels project. For more information, see <a>DescribeProjects</a>.</p>\"\
    },\
    \"ProjectDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProjectDescription\"}\
    },\
    \"ProjectName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"ProjectNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProjectName\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"ProjectStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"CREATED\",\
        \"DELETING\"\
      ]\
    },\
    \"ProjectVersionArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"(^arn:[a-z\\\\d-]+:rekognition:[a-z\\\\d-]+:\\\\d{12}:project\\\\/[a-zA-Z0-9_.\\\\-]{1,255}\\\\/version\\\\/[a-zA-Z0-9_.\\\\-]{1,255}\\\\/[0-9]+$)\"\
    },\
    \"ProjectVersionDescription\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ProjectVersionArn\":{\
          \"shape\":\"ProjectVersionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model version. </p>\"\
        },\
        \"CreationTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The Unix datetime for the date and time that training started.</p>\"\
        },\
        \"MinInferenceUnits\":{\
          \"shape\":\"InferenceUnits\",\
          \"documentation\":\"<p>The minimum number of inference units used by the model. For more information, see <a>StartProjectVersion</a>.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ProjectVersionStatus\",\
          \"documentation\":\"<p>The current status of the model version.</p>\"\
        },\
        \"StatusMessage\":{\
          \"shape\":\"StatusMessage\",\
          \"documentation\":\"<p>A descriptive message for an error or warning that occurred.</p>\"\
        },\
        \"BillableTrainingTimeInSeconds\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>The duration, in seconds, that you were billed for a successful training of the model version. This value is only returned if the model version has been successfully trained.</p>\"\
        },\
        \"TrainingEndTimestamp\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The Unix date and time that training of the model ended.</p>\"\
        },\
        \"OutputConfig\":{\
          \"shape\":\"OutputConfig\",\
          \"documentation\":\"<p>The location where training results are saved.</p>\"\
        },\
        \"TrainingDataResult\":{\
          \"shape\":\"TrainingDataResult\",\
          \"documentation\":\"<p>Contains information about the training results.</p>\"\
        },\
        \"TestingDataResult\":{\
          \"shape\":\"TestingDataResult\",\
          \"documentation\":\"<p>Contains information about the testing results.</p>\"\
        },\
        \"EvaluationResult\":{\
          \"shape\":\"EvaluationResult\",\
          \"documentation\":\"<p>The training results. <code>EvaluationResult</code> is only returned if training is successful.</p>\"\
        },\
        \"ManifestSummary\":{\
          \"shape\":\"GroundTruthManifest\",\
          \"documentation\":\"<p>The location of the summary manifest. The summary manifest provides aggregate data validation results for the training and test datasets.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The identifer for the AWS Key Management Service key (AWS KMS key) that was used to encrypt the model during training. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A description of a version of an Amazon Rekognition Custom Labels model.</p>\"\
    },\
    \"ProjectVersionDescriptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProjectVersionDescription\"}\
    },\
    \"ProjectVersionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRAINING_IN_PROGRESS\",\
        \"TRAINING_COMPLETED\",\
        \"TRAINING_FAILED\",\
        \"STARTING\",\
        \"RUNNING\",\
        \"FAILED\",\
        \"STOPPING\",\
        \"STOPPED\",\
        \"DELETING\"\
      ]\
    },\
    \"ProjectVersionsPageSize\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ProjectsPageSize\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ProtectiveEquipmentBodyPart\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"BodyPart\",\
          \"documentation\":\"<p>The detected body part.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has in the detection accuracy of the detected body part. </p>\"\
        },\
        \"EquipmentDetections\":{\
          \"shape\":\"EquipmentDetections\",\
          \"documentation\":\"<p>An array of Personal Protective Equipment items detected around a body part.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a body part detected by <a>DetectProtectiveEquipment</a> that contains PPE. An array of <code>ProtectiveEquipmentBodyPart</code> objects is returned for each person detected by <code>DetectProtectiveEquipment</code>. </p>\"\
    },\
    \"ProtectiveEquipmentPerson\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BodyParts\":{\
          \"shape\":\"BodyParts\",\
          \"documentation\":\"<p>An array of body parts detected on a person's body (including body parts without PPE). </p>\"\
        },\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>A bounding box around the detected person.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has that the bounding box contains a person.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The identifier for the detected person. The identifier is only unique for a single call to <code>DetectProtectiveEquipment</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A person detected by a call to <a>DetectProtectiveEquipment</a>. The API returns all persons detected in the input image in an array of <code>ProtectiveEquipmentPerson</code> objects.</p>\"\
    },\
    \"ProtectiveEquipmentPersonIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UInteger\"}\
    },\
    \"ProtectiveEquipmentPersons\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProtectiveEquipmentPerson\"}\
    },\
    \"ProtectiveEquipmentSummarizationAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MinConfidence\",\
        \"RequiredEquipmentTypes\"\
      ],\
      \"members\":{\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The minimum confidence level for which you want summary information. The confidence level applies to person detection, body part detection, equipment detection, and body part coverage. Amazon Rekognition doesn't return summary information with a confidence than this specified value. There isn't a default value.</p> <p>Specify a <code>MinConfidence</code> value that is between 50-100% as <code>DetectProtectiveEquipment</code> returns predictions only where the detection confidence is between 50% - 100%. If you specify a value that is less than 50%, the results are the same specifying a value of 50%.</p> <p> </p>\"\
        },\
        \"RequiredEquipmentTypes\":{\
          \"shape\":\"ProtectiveEquipmentTypes\",\
          \"documentation\":\"<p>An array of personal protective equipment types for which you want summary information. If a person is detected wearing a required requipment type, the person's ID is added to the <code>PersonsWithRequiredEquipment</code> array field returned in <a>ProtectiveEquipmentSummary</a> by <code>DetectProtectiveEquipment</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies summary attributes to return from a call to <a>DetectProtectiveEquipment</a>. You can specify which types of PPE to summarize. You can also specify a minimum confidence value for detections. Summary information is returned in the <code>Summary</code> (<a>ProtectiveEquipmentSummary</a>) field of the response from <code>DetectProtectiveEquipment</code>. The summary includes which persons in an image were detected wearing the requested types of person protective equipment (PPE), which persons were detected as not wearing PPE, and the persons in which a determination could not be made. For more information, see <a>ProtectiveEquipmentSummary</a>.</p>\"\
    },\
    \"ProtectiveEquipmentSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PersonsWithRequiredEquipment\":{\
          \"shape\":\"ProtectiveEquipmentPersonIds\",\
          \"documentation\":\"<p>An array of IDs for persons who are wearing detected personal protective equipment. </p>\"\
        },\
        \"PersonsWithoutRequiredEquipment\":{\
          \"shape\":\"ProtectiveEquipmentPersonIds\",\
          \"documentation\":\"<p>An array of IDs for persons who are not wearing all of the types of PPE specified in the <code>RequiredEquipmentTypes</code> field of the detected personal protective equipment. </p>\"\
        },\
        \"PersonsIndeterminate\":{\
          \"shape\":\"ProtectiveEquipmentPersonIds\",\
          \"documentation\":\"<p>An array of IDs for persons where it was not possible to determine if they are wearing personal protective equipment. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information for required items of personal protective equipment (PPE) detected on persons by a call to <a>DetectProtectiveEquipment</a>. You specify the required type of PPE in the <code>SummarizationAttributes</code> (<a>ProtectiveEquipmentSummarizationAttributes</a>) input parameter. The summary includes which persons were detected wearing the required personal protective equipment (<code>PersonsWithRequiredEquipment</code>), which persons were detected as not wearing the required PPE (<code>PersonsWithoutRequiredEquipment</code>), and the persons in which a determination could not be made (<code>PersonsIndeterminate</code>).</p> <p>To get a total for each category, use the size of the field array. For example, to find out how many people were detected as wearing the specified PPE, use the size of the <code>PersonsWithRequiredEquipment</code> array. If you want to find out more about a person, such as the location (<a>BoundingBox</a>) of the person on the image, use the person ID in each array element. Each person ID matches the ID field of a <a>ProtectiveEquipmentPerson</a> object returned in the <code>Persons</code> array by <code>DetectProtectiveEquipment</code>.</p>\"\
    },\
    \"ProtectiveEquipmentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FACE_COVER\",\
        \"HAND_COVER\",\
        \"HEAD_COVER\"\
      ]\
    },\
    \"ProtectiveEquipmentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProtectiveEquipmentType\"}\
    },\
    \"ProvisionedThroughputExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The number of requests exceeded your throughput limit. If you want to increase this limit, contact Amazon Rekognition.</p>\",\
      \"exception\":true\
    },\
    \"QualityFilter\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NONE\",\
        \"AUTO\",\
        \"LOW\",\
        \"MEDIUM\",\
        \"HIGH\"\
      ]\
    },\
    \"QueryString\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"Reason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EXCEEDS_MAX_FACES\",\
        \"EXTREME_POSE\",\
        \"LOW_BRIGHTNESS\",\
        \"LOW_SHARPNESS\",\
        \"LOW_CONFIDENCE\",\
        \"SMALL_BOUNDING_BOX\",\
        \"LOW_FACE_QUALITY\"\
      ]\
    },\
    \"Reasons\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Reason\"}\
    },\
    \"RecognizeCelebritiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Image\"],\
      \"members\":{\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        }\
      }\
    },\
    \"RecognizeCelebritiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CelebrityFaces\":{\
          \"shape\":\"CelebrityList\",\
          \"documentation\":\"<p>Details about each celebrity found in the image. Amazon Rekognition can detect a maximum of 64 celebrities in an image. Each celebrity object includes the following attributes: <code>Face</code>, <code>Confidence</code>, <code>Emotions</code>, <code>Landmarks</code>, <code>Pose</code>, <code>Quality</code>, <code>Smile</code>, <code>Id</code>, <code>KnownGender</code>, <code>MatchConfidence</code>, <code>Name</code>, <code>Urls</code>.</p>\"\
        },\
        \"UnrecognizedFaces\":{\
          \"shape\":\"ComparedFaceList\",\
          \"documentation\":\"<p>Details about each unrecognized face in the image.</p>\"\
        },\
        \"OrientationCorrection\":{\
          \"shape\":\"OrientationCorrection\",\
          \"documentation\":\"<note> <p>Support for estimating image orientation using the the OrientationCorrection field has ceased as of August 2021. Any returned values for this field included in an API response will always be NULL.</p> </note> <p>The orientation of the input image (counterclockwise direction). If your application displays the image, you can use this value to correct the orientation. The bounding box coordinates returned in <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> represent face locations before the image orientation is corrected. </p> <note> <p>If the input image is in .jpeg format, it might contain exchangeable image (Exif) metadata that includes the image's orientation. If so, and the Exif metadata for the input image populates the orientation field, the value of <code>OrientationCorrection</code> is null. The <code>CelebrityFaces</code> and <code>UnrecognizedFaces</code> bounding box coordinates represent face locations after Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif metadata. </p> </note>\"\
        }\
      }\
    },\
    \"RegionOfInterest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>The box representing a region of interest on screen.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a location within the frame that Rekognition checks for text. Uses a <code>BoundingBox</code> object to set a region of the screen.</p> <p>A word is included in the region if the word is more than half in that region. If there is more than one region, the word will be compared with all regions of the screen. Any word more than half in a region is kept in the results.</p>\"\
    },\
    \"RegionsOfInterest\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RegionOfInterest\"},\
      \"max\":10,\
      \"min\":0\
    },\
    \"RekognitionUniqueId\":{\
      \"type\":\"string\",\
      \"pattern\":\"[0-9A-Za-z]*\"\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A resource with the specified ID already exists.</p>\",\
      \"exception\":true\
    },\
    \"ResourceArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource is already being used.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The resource specified in the request cannot be found.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotReadyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The requested resource isn't ready. For example, this exception occurs when you call <code>DetectCustomLabels</code> with a model version that isn't deployed. </p>\",\
      \"exception\":true\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\"\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":3,\
      \"pattern\":\"[0-9A-Za-z\\\\.\\\\-_]*\"\
    },\
    \"S3KeyPrefix\":{\
      \"type\":\"string\",\
      \"max\":1024\
    },\
    \"S3Object\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Name of the S3 bucket.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"S3ObjectName\",\
          \"documentation\":\"<p>S3 object key name.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>If the bucket is versioning enabled, you can specify the object version. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides the S3 bucket name and object name.</p> <p>The region for the S3 bucket containing the S3 object must match the region you use for Amazon Rekognition operations.</p> <p>For Amazon Rekognition to process an S3 object, the user must have permission to access the S3 object. For more information, see Resource-Based Policies in the Amazon Rekognition Developer Guide. </p>\"\
    },\
    \"S3ObjectName\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SNSTopicArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:aws:sns:.*:\\\\w{12}:.+$)\"\
    },\
    \"SearchFacesByImageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"Image\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection to search.</p>\"\
        },\
        \"Image\":{\
          \"shape\":\"Image\",\
          \"documentation\":\"<p>The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon Rekognition operations, passing base64-encoded image bytes is not supported. </p> <p>If you are using an AWS SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the <code>Bytes</code> field. For more information, see Images in the Amazon Rekognition developer guide.</p>\"\
        },\
        \"MaxFaces\":{\
          \"shape\":\"MaxFaces\",\
          \"documentation\":\"<p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>(Optional) Specifies the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%.</p>\"\
        },\
        \"QualityFilter\":{\
          \"shape\":\"QualityFilter\",\
          \"documentation\":\"<p>A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered faces aren't searched for in the collection. If you specify <code>AUTO</code>, Amazon Rekognition chooses the quality bar. If you specify <code>LOW</code>, <code>MEDIUM</code>, or <code>HIGH</code>, filtering removes all faces that donât meet the chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality detections can occur for a number of reasons. Some examples are an object that's misidentified as a face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify <code>NONE</code>, no filtering is performed. The default value is <code>NONE</code>. </p> <p>To use quality filtering, the collection you are using must be associated with version 3 of the face model or higher.</p>\"\
        }\
      }\
    },\
    \"SearchFacesByImageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SearchedFaceBoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>The bounding box around the face in the input image that Amazon Rekognition used for the search.</p>\"\
        },\
        \"SearchedFaceConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The level of confidence that the <code>searchedFaceBoundingBox</code>, contains a face.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>An array of faces that match the input face, along with the confidence in the match.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Latest face model being used with the collection. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/face-detection-model.html\\\">Model versioning</a>.</p>\"\
        }\
      }\
    },\
    \"SearchFacesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionId\",\
        \"FaceId\"\
      ],\
      \"members\":{\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection the face belongs to.</p>\"\
        },\
        \"FaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>ID of a face to find matches for in the collection.</p>\"\
        },\
        \"MaxFaces\":{\
          \"shape\":\"MaxFaces\",\
          \"documentation\":\"<p>Maximum number of faces to return. The operation returns the maximum number of faces with the highest confidence in the match.</p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Optional value specifying the minimum confidence in the face match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%. </p>\"\
        }\
      }\
    },\
    \"SearchFacesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SearchedFaceId\":{\
          \"shape\":\"FaceId\",\
          \"documentation\":\"<p>ID of the face that was searched for matches in a collection.</p>\"\
        },\
        \"FaceMatches\":{\
          \"shape\":\"FaceMatchList\",\
          \"documentation\":\"<p>An array of faces that matched the input face, along with the confidence in the match.</p>\"\
        },\
        \"FaceModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Latest face model being used with the collection. For more information, see <a href=\\\"https://docs.aws.amazon.com/rekognition/latest/dg/face-detection-model.html\\\">Model versioning</a>.</p>\"\
        }\
      }\
    },\
    \"SegmentConfidence\":{\
      \"type\":\"float\",\
      \"max\":100,\
      \"min\":50\
    },\
    \"SegmentDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"SegmentType\",\
          \"documentation\":\"<p>The type of the segment. Valid values are <code>TECHNICAL_CUE</code> and <code>SHOT</code>.</p>\"\
        },\
        \"StartTimestampMillis\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time of the detected segment in milliseconds from the start of the video. This value is rounded down. For example, if the actual timestamp is 100.6667 milliseconds, Amazon Rekognition Video returns a value of 100 millis.</p>\"\
        },\
        \"EndTimestampMillis\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time of the detected segment, in milliseconds, from the start of the video. This value is rounded down.</p>\"\
        },\
        \"DurationMillis\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>The duration of the detected segment in milliseconds. </p>\"\
        },\
        \"StartTimecodeSMPTE\":{\
          \"shape\":\"Timecode\",\
          \"documentation\":\"<p>The frame-accurate SMPTE timecode, from the start of a video, for the start of a detected segment. <code>StartTimecode</code> is in <i>HH:MM:SS:fr</i> format (and <i>;fr</i> for drop frame-rates). </p>\"\
        },\
        \"EndTimecodeSMPTE\":{\
          \"shape\":\"Timecode\",\
          \"documentation\":\"<p>The frame-accurate SMPTE timecode, from the start of a video, for the end of a detected segment. <code>EndTimecode</code> is in <i>HH:MM:SS:fr</i> format (and <i>;fr</i> for drop frame-rates).</p>\"\
        },\
        \"DurationSMPTE\":{\
          \"shape\":\"Timecode\",\
          \"documentation\":\"<p>The duration of the timecode for the detected segment in SMPTE format.</p>\"\
        },\
        \"TechnicalCueSegment\":{\
          \"shape\":\"TechnicalCueSegment\",\
          \"documentation\":\"<p>If the segment is a technical cue, contains information about the technical cue.</p>\"\
        },\
        \"ShotSegment\":{\
          \"shape\":\"ShotSegment\",\
          \"documentation\":\"<p>If the segment is a shot detection, contains information about the shot detection.</p>\"\
        },\
        \"StartFrameNumber\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p> The frame number of the start of a video segment, using a frame index that starts with 0. </p>\"\
        },\
        \"EndFrameNumber\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p> The frame number at the end of a video segment, using a frame index that starts with 0. </p>\"\
        },\
        \"DurationFrames\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p> The duration of a video segment, expressed in frames. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A technical cue or shot detection segment detected in a video. An array of <code>SegmentDetection</code> objects containing all segments detected in a stored video is returned by <a>GetSegmentDetection</a>. </p>\"\
    },\
    \"SegmentDetections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SegmentDetection\"}\
    },\
    \"SegmentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TECHNICAL_CUE\",\
        \"SHOT\"\
      ]\
    },\
    \"SegmentTypeInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"SegmentType\",\
          \"documentation\":\"<p>The type of a segment (technical cue or shot detection).</p>\"\
        },\
        \"ModelVersion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The version of the model used to detect segments.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the type of a segment requested in a call to <a>StartSegmentDetection</a>. An array of <code>SegmentTypeInfo</code> objects is returned by the response from <a>GetSegmentDetection</a>.</p>\"\
    },\
    \"SegmentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SegmentType\"},\
      \"min\":1\
    },\
    \"SegmentTypesInfo\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SegmentTypeInfo\"}\
    },\
    \"ServiceQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p/> <p>The size of the collection exceeds the allowed limit. For more information, see Limits in Amazon Rekognition in the Amazon Rekognition Developer Guide. </p>\",\
      \"exception\":true\
    },\
    \"ShotSegment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>An Identifier for a shot detection segment detected in a video. </p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"SegmentConfidence\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a shot detection segment detected in a video. For more information, see <a>SegmentDetection</a>.</p>\"\
    },\
    \"Smile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is smiling or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is smiling, and the confidence level in the determination.</p>\"\
    },\
    \"StartCelebrityRecognitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to recognize celebrities. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartCelebrityRecognition</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of the celebrity recognition analysis to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        }\
      }\
    },\
    \"StartCelebrityRecognitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the celebrity recognition analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetCelebrityRecognition</code>.</p>\"\
        }\
      }\
    },\
    \"StartContentModerationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect inappropriate, unwanted, or offensive content. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence that Amazon Rekognition must have in order to return a moderated content label. Confidence represents how certain Amazon Rekognition is that the moderated content is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition doesn't return any moderated content labels with a confidence level lower than this specified value. If you don't specify <code>MinConfidence</code>, <code>GetContentModeration</code> returns labels with confidence values greater than or equal to 50 percent.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartContentModeration</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of the content analysis to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        }\
      }\
    },\
    \"StartContentModerationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the content analysis job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetContentModeration</code>.</p>\"\
        }\
      }\
    },\
    \"StartFaceDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect faces. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartFaceDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the face detection operation. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>\"\
        },\
        \"FaceAttributes\":{\
          \"shape\":\"FaceAttributes\",\
          \"documentation\":\"<p>The face attributes you want returned.</p> <p> <code>DEFAULT</code> - The following subset of facial attributes are returned: BoundingBox, Confidence, Pose, Quality and Landmarks. </p> <p> <code>ALL</code> - All facial attributes are returned.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        }\
      }\
    },\
    \"StartFaceDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the face detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetFaceDetection</code>.</p>\"\
        }\
      }\
    },\
    \"StartFaceSearchRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Video\",\
        \"CollectionId\"\
      ],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video you want to search. The video must be stored in an Amazon S3 bucket. </p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartFaceSearch</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"FaceMatchThreshold\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The minimum confidence in the person match to return. For example, don't return any matches where confidence in matches is less than 70%. The default value is 80%.</p>\"\
        },\
        \"CollectionId\":{\
          \"shape\":\"CollectionId\",\
          \"documentation\":\"<p>ID of the collection that contains the faces you want to search for.</p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the search. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        }\
      }\
    },\
    \"StartFaceSearchResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the search job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetFaceSearch</code>. </p>\"\
        }\
      }\
    },\
    \"StartLabelDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect labels. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartLabelDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"MinConfidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected label. Confidence represents how certain Amazon Rekognition is that a label is correctly identified.0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any labels with a confidence level lower than this specified value.</p> <p>If you don't specify <code>MinConfidence</code>, the operation returns labels with confidence values greater than or equal to 50 percent.</p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the label detection operation to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        }\
      }\
    },\
    \"StartLabelDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the label detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetLabelDetection</code>. </p>\"\
        }\
      }\
    },\
    \"StartPersonTrackingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\
          \"shape\":\"Video\",\
          \"documentation\":\"<p>The video in which you want to detect people. The video must be stored in an Amazon S3 bucket.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartPersonTracking</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the people detection operation to. The Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        }\
      }\
    },\
    \"StartPersonTrackingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier for the person detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetPersonTracking</code>.</p>\"\
        }\
      }\
    },\
    \"StartProjectVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ProjectVersionArn\",\
        \"MinInferenceUnits\"\
      ],\
      \"members\":{\
        \"ProjectVersionArn\":{\
          \"shape\":\"ProjectVersionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name(ARN) of the model version that you want to start.</p>\"\
        },\
        \"MinInferenceUnits\":{\
          \"shape\":\"InferenceUnits\",\
          \"documentation\":\"<p>The minimum number of inference units to use. A single inference unit represents 1 hour of processing and can support up to 5 Transaction Pers Second (TPS). Use a higher number to increase the TPS throughput of your model. You are charged for the number of inference units that you use. </p>\"\
        }\
      }\
    },\
    \"StartProjectVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ProjectVersionStatus\",\
          \"documentation\":\"<p>The current running status of the model. </p>\"\
        }\
      }\
    },\
    \"StartSegmentDetectionFilters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TechnicalCueFilter\":{\
          \"shape\":\"StartTechnicalCueDetectionFilter\",\
          \"documentation\":\"<p>Filters that are specific to technical cues.</p>\"\
        },\
        \"ShotFilter\":{\
          \"shape\":\"StartShotDetectionFilter\",\
          \"documentation\":\"<p>Filters that are specific to shot detections.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Filters applied to the technical cue or shot detection segments. For more information, see <a>StartSegmentDetection</a>. </p>\"\
    },\
    \"StartSegmentDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Video\",\
        \"SegmentTypes\"\
      ],\
      \"members\":{\
        \"Video\":{\"shape\":\"Video\"},\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartSegmentDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidently started more than once. </p>\"\
        },\
        \"NotificationChannel\":{\
          \"shape\":\"NotificationChannel\",\
          \"documentation\":\"<p>The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion status of the segment detection operation. Note that the Amazon SNS topic must have a topic name that begins with <i>AmazonRekognition</i> if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.</p>\"\
        },\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier you specify that's returned in the completion notification that's published to your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"StartSegmentDetectionFilters\",\
          \"documentation\":\"<p>Filters for technical cue or shot detection.</p>\"\
        },\
        \"SegmentTypes\":{\
          \"shape\":\"SegmentTypes\",\
          \"documentation\":\"<p>An array of segment types to detect in the video. Valid values are TECHNICAL_CUE and SHOT.</p>\"\
        }\
      }\
    },\
    \"StartSegmentDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Unique identifier for the segment detection job. The <code>JobId</code> is returned from <code>StartSegmentDetection</code>. </p>\"\
        }\
      }\
    },\
    \"StartShotDetectionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinSegmentConfidence\":{\
          \"shape\":\"SegmentConfidence\",\
          \"documentation\":\"<p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected segment. Confidence represents how certain Amazon Rekognition is that a segment is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any segments with a confidence level lower than this specified value.</p> <p>If you don't specify <code>MinSegmentConfidence</code>, the <code>GetSegmentDetection</code> returns segments with confidence values greater than or equal to 50 percent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Filters for the shot detection segments returned by <code>GetSegmentDetection</code>. For more information, see <a>StartSegmentDetectionFilters</a>.</p>\"\
    },\
    \"StartStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>The name of the stream processor to start processing.</p>\"\
        }\
      }\
    },\
    \"StartStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StartTechnicalCueDetectionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MinSegmentConfidence\":{\
          \"shape\":\"SegmentConfidence\",\
          \"documentation\":\"<p>Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a detected segment. Confidence represents how certain Amazon Rekognition is that a segment is correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video doesn't return any segments with a confidence level lower than this specified value.</p> <p>If you don't specify <code>MinSegmentConfidence</code>, <code>GetSegmentDetection</code> returns segments with confidence values greater than or equal to 50 percent.</p>\"\
        },\
        \"BlackFrame\":{\
          \"shape\":\"BlackFrame\",\
          \"documentation\":\"<p> A filter that allows you to control the black frame detection by specifying the black levels and pixel coverage of black pixels in a frame. Videos can come from multiple sources, formats, and time periods, with different standards and varying noise levels for black frames that need to be accounted for. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Filters for the technical segments returned by <a>GetSegmentDetection</a>. For more information, see <a>StartSegmentDetectionFilters</a>.</p>\"\
    },\
    \"StartTextDetectionFilters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"WordFilter\":{\
          \"shape\":\"DetectionFilter\",\
          \"documentation\":\"<p>Filters focusing on qualities of the text, such as confidence or size.</p>\"\
        },\
        \"RegionsOfInterest\":{\
          \"shape\":\"RegionsOfInterest\",\
          \"documentation\":\"<p>Filter focusing on a certain area of the frame. Uses a <code>BoundingBox</code> object to set the region of the screen.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Set of optional parameters that let you set the criteria text must meet to be included in your response. <code>WordFilter</code> looks at a word's height, width and minimum confidence. <code>RegionOfInterest</code> lets you set a specific region of the screen to look for text in.</p>\"\
    },\
    \"StartTextDetectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Video\"],\
      \"members\":{\
        \"Video\":{\"shape\":\"Video\"},\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>Idempotent token used to identify the start request. If you use the same token with multiple <code>StartTextDetection</code> requests, the same <code>JobId</code> is returned. Use <code>ClientRequestToken</code> to prevent the same job from being accidentaly started more than once.</p>\"\
        },\
        \"NotificationChannel\":{\"shape\":\"NotificationChannel\"},\
        \"JobTag\":{\
          \"shape\":\"JobTag\",\
          \"documentation\":\"<p>An identifier returned in the completion status published by your Amazon Simple Notification Service topic. For example, you can use <code>JobTag</code> to group related jobs and identify them in the completion notification.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"StartTextDetectionFilters\",\
          \"documentation\":\"<p>Optional parameters that let you set criteria the text must meet to be included in your response.</p>\"\
        }\
      }\
    },\
    \"StartTextDetectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>Identifier for the text detection job. Use <code>JobId</code> to identify the job in a subsequent call to <code>GetTextDetection</code>.</p>\"\
        }\
      }\
    },\
    \"StatusMessage\":{\"type\":\"string\"},\
    \"StopProjectVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ProjectVersionArn\"],\
      \"members\":{\
        \"ProjectVersionArn\":{\
          \"shape\":\"ProjectVersionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the model version that you want to delete.</p> <p>This operation requires permissions to perform the <code>rekognition:StopProjectVersion</code> action.</p>\"\
        }\
      }\
    },\
    \"StopProjectVersionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ProjectVersionStatus\",\
          \"documentation\":\"<p>The current status of the stop operation. </p>\"\
        }\
      }\
    },\
    \"StopStreamProcessorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>The name of a stream processor created by <a>CreateStreamProcessor</a>.</p>\"\
        }\
      }\
    },\
    \"StopStreamProcessorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StreamProcessor\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"StreamProcessorName\",\
          \"documentation\":\"<p>Name of the Amazon Rekognition stream processor. </p>\"\
        },\
        \"Status\":{\
          \"shape\":\"StreamProcessorStatus\",\
          \"documentation\":\"<p>Current status of the Amazon Rekognition stream processor.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that recognizes faces in a streaming video. An Amazon Rekognition stream processor is created by a call to <a>CreateStreamProcessor</a>. The request parameters for <code>CreateStreamProcessor</code> describe the Kinesis video stream source for the streaming video, face recognition parameters, and where to stream the analysis resullts. </p>\"\
    },\
    \"StreamProcessorArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"(^arn:[a-z\\\\d-]+:rekognition:[a-z\\\\d-]+:\\\\d{12}:streamprocessor\\\\/.+$)\"\
    },\
    \"StreamProcessorInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KinesisVideoStream\":{\
          \"shape\":\"KinesisVideoStream\",\
          \"documentation\":\"<p>The Kinesis video stream input stream for the source streaming video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the source streaming video. </p>\"\
    },\
    \"StreamProcessorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"StreamProcessor\"}\
    },\
    \"StreamProcessorName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"StreamProcessorOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KinesisDataStream\":{\
          \"shape\":\"KinesisDataStream\",\
          \"documentation\":\"<p>The Amazon Kinesis Data Streams stream to which the Amazon Rekognition stream processor streams the analysis results.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the Amazon Kinesis Data Streams stream to which a Amazon Rekognition Video stream processor streams the results of a video analysis. For more information, see CreateStreamProcessor in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"StreamProcessorSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FaceSearch\":{\
          \"shape\":\"FaceSearchSettings\",\
          \"documentation\":\"<p>Face search settings to use on a streaming video. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Input parameters used to recognize faces in a streaming video analyzed by a Amazon Rekognition stream processor.</p>\"\
    },\
    \"StreamProcessorStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STOPPED\",\
        \"STARTING\",\
        \"RUNNING\",\
        \"FAILED\",\
        \"STOPPING\"\
      ]\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Summary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Object\":{\"shape\":\"S3Object\"}\
      },\
      \"documentation\":\"<p>The S3 bucket that contains the training summary. The training summary includes aggregated evaluation metrics for the entire testing dataset and metrics for each individual label. </p> <p>You get the training summary S3 bucket location by calling <a>DescribeProjectVersions</a>. </p>\"\
    },\
    \"Sunglasses\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Boolean value that indicates whether the face is wearing sunglasses or not.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>Level of confidence in the determination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates whether or not the face is wearing sunglasses, and the confidence level in the determination.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":200,\
      \"min\":0\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":200,\
      \"min\":0\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p> Amazon Resource Name (ARN) of the model, collection, or stream processor that you want to assign the tags to. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p> The key-value tags to assign to the resource. </p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"TechnicalCueSegment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"TechnicalCueType\",\
          \"documentation\":\"<p>The type of the technical cue.</p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"SegmentConfidence\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a technical cue segment. For more information, see <a>SegmentDetection</a>.</p>\"\
    },\
    \"TechnicalCueType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ColorBars\",\
        \"EndCredits\",\
        \"BlackFrames\",\
        \"OpeningCredits\",\
        \"StudioLogo\",\
        \"Slate\",\
        \"Content\"\
      ]\
    },\
    \"TestingData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Assets\":{\
          \"shape\":\"Assets\",\
          \"documentation\":\"<p>The assets used for testing.</p>\"\
        },\
        \"AutoCreate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If specified, Amazon Rekognition Custom Labels temporarily splits the training dataset (80%) to create a test dataset (20%) for the training job. After training completes, the test dataset is not stored and the training dataset reverts to its previous size.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The dataset used for testing. Optionally, if <code>AutoCreate</code> is set, Amazon Rekognition Custom Labels uses the training dataset to create a test dataset with a temporary split of the training dataset. </p>\"\
    },\
    \"TestingDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Input\":{\
          \"shape\":\"TestingData\",\
          \"documentation\":\"<p>The testing dataset that was supplied for training.</p>\"\
        },\
        \"Output\":{\
          \"shape\":\"TestingData\",\
          \"documentation\":\"<p>The subset of the dataset that was actually tested. Some images (assets) might not be tested due to file formatting and other issues. </p>\"\
        },\
        \"Validation\":{\
          \"shape\":\"ValidationData\",\
          \"documentation\":\"<p>The location of the data validation manifest. The data validation manifest is created for the test dataset during model training.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sagemaker Groundtruth format manifest files for the input, output and validation datasets that are used and created during testing.</p>\"\
    },\
    \"TextDetection\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DetectedText\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The word or line of text recognized by Amazon Rekognition. </p>\"\
        },\
        \"Type\":{\
          \"shape\":\"TextTypes\",\
          \"documentation\":\"<p>The type of text that was detected.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The identifier for the detected text. The identifier is only unique for a single call to <code>DetectText</code>. </p>\"\
        },\
        \"ParentId\":{\
          \"shape\":\"UInteger\",\
          \"documentation\":\"<p>The Parent identifier for the detected text identified by the value of <code>ID</code>. If the type of detected text is <code>LINE</code>, the value of <code>ParentId</code> is <code>Null</code>. </p>\"\
        },\
        \"Confidence\":{\
          \"shape\":\"Percent\",\
          \"documentation\":\"<p>The confidence that Amazon Rekognition has in the accuracy of the detected text and the accuracy of the geometry points around the detected text.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"Geometry\",\
          \"documentation\":\"<p>The location of the detected text on the image. Includes an axis aligned coarse bounding box surrounding the text and a finer grain polygon for more accurate spatial information.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a word or line of text detected by <a>DetectText</a>.</p> <p>The <code>DetectedText</code> field contains the text that Amazon Rekognition detected in the image. </p> <p>Every word and line has an identifier (<code>Id</code>). Each word belongs to a line and has a parent identifier (<code>ParentId</code>) that identifies the line of text in which the word appears. The word <code>Id</code> is also an index for the word within a line of words. </p> <p>For more information, see Detecting Text in the Amazon Rekognition Developer Guide.</p>\"\
    },\
    \"TextDetectionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TextDetection\"}\
    },\
    \"TextDetectionResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time, in milliseconds from the start of the video, that the text was detected.</p>\"\
        },\
        \"TextDetection\":{\
          \"shape\":\"TextDetection\",\
          \"documentation\":\"<p>Details about text detected in a video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about text detected in a video. Incudes the detected text, the time in milliseconds from the start of the video that the text was detected, and where it was detected on the screen.</p>\"\
    },\
    \"TextDetectionResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TextDetectionResult\"}\
    },\
    \"TextTypes\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LINE\",\
        \"WORD\"\
      ]\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Amazon Rekognition is temporarily unable to process the request. Try your call again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"Timecode\":{\"type\":\"string\"},\
    \"Timestamp\":{\"type\":\"long\"},\
    \"TrainingData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Assets\":{\
          \"shape\":\"Assets\",\
          \"documentation\":\"<p>A Sagemaker GroundTruth manifest file that contains the training images (assets).</p>\"\
        }\
      },\
      \"documentation\":\"<p>The dataset used for training.</p>\"\
    },\
    \"TrainingDataResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Input\":{\
          \"shape\":\"TrainingData\",\
          \"documentation\":\"<p>The training assets that you supplied for training.</p>\"\
        },\
        \"Output\":{\
          \"shape\":\"TrainingData\",\
          \"documentation\":\"<p>The images (assets) that were actually trained by Amazon Rekognition Custom Labels. </p>\"\
        },\
        \"Validation\":{\
          \"shape\":\"ValidationData\",\
          \"documentation\":\"<p>The location of the data validation manifest. The data validation manifest is created for the training dataset during model training.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Sagemaker Groundtruth format manifest files for the input, output and validation datasets that are used and created during testing.</p>\"\
    },\
    \"UInteger\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"ULong\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"UnindexedFace\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Reasons\":{\
          \"shape\":\"Reasons\",\
          \"documentation\":\"<p>An array of reasons that specify why a face wasn't indexed. </p> <ul> <li> <p>EXTREME_POSE - The face is at a pose that can't be detected. For example, the head is turned too far away from the camera.</p> </li> <li> <p>EXCEEDS_MAX_FACES - The number of faces detected is already higher than that specified by the <code>MaxFaces</code> input parameter for <code>IndexFaces</code>.</p> </li> <li> <p>LOW_BRIGHTNESS - The image is too dark.</p> </li> <li> <p>LOW_SHARPNESS - The image is too blurry.</p> </li> <li> <p>LOW_CONFIDENCE - The face was detected with a low confidence.</p> </li> <li> <p>SMALL_BOUNDING_BOX - The bounding box around the face is too small.</p> </li> </ul>\"\
        },\
        \"FaceDetail\":{\
          \"shape\":\"FaceDetail\",\
          \"documentation\":\"<p>The structure that contains attributes of a face that <code>IndexFaces</code>detected, but didn't index. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A face that <a>IndexFaces</a> detected, but didn't index. Use the <code>Reasons</code> response attribute to determine why a face wasn't indexed.</p>\"\
    },\
    \"UnindexedFaces\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UnindexedFace\"}\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ResourceArn\",\
          \"documentation\":\"<p> Amazon Resource Name (ARN) of the model, collection, or stream processor that you want to remove the tags from. </p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p> A list of the tags that you want to remove. </p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateDatasetEntriesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DatasetArn\",\
        \"Changes\"\
      ],\
      \"members\":{\
        \"DatasetArn\":{\
          \"shape\":\"DatasetArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the dataset that you want to update. </p>\"\
        },\
        \"Changes\":{\
          \"shape\":\"DatasetChanges\",\
          \"documentation\":\"<p> The changes that you want to make to the dataset. </p>\"\
        }\
      }\
    },\
    \"UpdateDatasetEntriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Url\":{\"type\":\"string\"},\
    \"Urls\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Url\"},\
      \"max\":255,\
      \"min\":0\
    },\
    \"ValidationData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Assets\":{\
          \"shape\":\"Assets\",\
          \"documentation\":\"<p>The assets that comprise the validation data. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the Amazon S3 bucket location of the validation data for a model training job. </p> <p>The validation data includes error information for individual JSON Lines in the dataset. For more information, see <i>Debugging a Failed Model Training</i> in the Amazon Rekognition Custom Labels Developer Guide. </p> <p>You get the <code>ValidationData</code> object for the training dataset (<a>TrainingDataResult</a>) and the test dataset (<a>TestingDataResult</a>) by calling <a>DescribeProjectVersions</a>. </p> <p>The assets array contains a single <a>Asset</a> object. The <a>GroundTruthManifest</a> field of the Asset object contains the S3 bucket location of the validation data. </p>\"\
    },\
    \"VersionName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.\\\\-]+\"\
    },\
    \"VersionNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VersionName\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"Video\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Object\":{\
          \"shape\":\"S3Object\",\
          \"documentation\":\"<p>The Amazon S3 bucket name and file name for the video.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as <a>StartLabelDetection</a> use <code>Video</code> to specify a video for analysis. The supported file formats are .mp4, .mov and .avi.</p>\"\
    },\
    \"VideoColorRange\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FULL\",\
        \"LIMITED\"\
      ]\
    },\
    \"VideoJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"SUCCEEDED\",\
        \"FAILED\"\
      ]\
    },\
    \"VideoMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Codec\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Type of compression used in the analyzed video. </p>\"\
        },\
        \"DurationMillis\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>Length of the video in milliseconds.</p>\"\
        },\
        \"Format\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Format of the analyzed video. Possible values are MP4, MOV and AVI. </p>\"\
        },\
        \"FrameRate\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Number of frames per second in the video.</p>\"\
        },\
        \"FrameHeight\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>Vertical pixel dimension of the video.</p>\"\
        },\
        \"FrameWidth\":{\
          \"shape\":\"ULong\",\
          \"documentation\":\"<p>Horizontal pixel dimension of the video.</p>\"\
        },\
        \"ColorRange\":{\
          \"shape\":\"VideoColorRange\",\
          \"documentation\":\"<p> A description of the range of luminance values in a video, either LIMITED (16 to 235) or FULL (0 to 255). </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a video that Amazon Rekognition analyzed. <code>Videometadata</code> is returned in every page of paginated responses from a Amazon Rekognition video operation.</p>\"\
    },\
    \"VideoMetadataList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VideoMetadata\"}\
    },\
    \"VideoTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The file size or duration of the supplied media is too large. The maximum file size is 10GB. The maximum duration is 6 hours. </p>\",\
      \"exception\":true\
    }\
  },\
  \"documentation\":\"<p>This is the Amazon Rekognition API reference.</p>\"\
}\
";
}

@end
