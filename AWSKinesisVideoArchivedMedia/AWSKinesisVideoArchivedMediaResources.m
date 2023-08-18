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

#import "AWSKinesisVideoArchivedMediaResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSKinesisVideoArchivedMediaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSKinesisVideoArchivedMediaResources

+ (instancetype)sharedInstance {
    static AWSKinesisVideoArchivedMediaResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSKinesisVideoArchivedMediaResources new];
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
    \"apiVersion\":\"2017-09-30\",\
    \"endpointPrefix\":\"kinesisvideo\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Kinesis Video Archived Media\",\
    \"serviceFullName\":\"Amazon Kinesis Video Streams Archived Media\",\
    \"serviceId\":\"Kinesis Video Archived Media\",\
    \"signatureVersion\":\"v4\",\
    \"uid\":\"kinesis-video-archived-media-2017-09-30\"\
  },\
  \"operations\":{\
    \"GetClip\":{\
      \"name\":\"GetClip\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getClip\"\
      },\
      \"input\":{\"shape\":\"GetClipInput\"},\
      \"output\":{\"shape\":\"GetClipOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnsupportedStreamMediaTypeException\"},\
        {\"shape\":\"MissingCodecPrivateDataException\"},\
        {\"shape\":\"InvalidCodecPrivateDataException\"},\
        {\"shape\":\"InvalidMediaFrameException\"},\
        {\"shape\":\"NoDataRetentionException\"}\
      ],\
      \"documentation\":\"<p>Downloads an MP4 file (clip) containing the archived, on-demand media from the specified video stream over the specified time range. </p> <p>Both the StreamName and the StreamARN parameters are optional, but you must specify either the StreamName or the StreamARN when invoking this API operation. </p> <p>As a prerequisite to using GetCLip API, you must obtain an endpoint using <code>GetDataEndpoint</code>, specifying GET_CLIP for<code/> the <code>APIName</code> parameter. </p> <p>An Amazon Kinesis video stream has the following requirements for providing data through MP4:</p> <ul> <li> <p>The media must contain h.264 or h.265 encoded video and, optionally, AAC or G.711 encoded audio. Specifically, the codec ID of track 1 should be <code>V_MPEG/ISO/AVC</code> (for h.264) or V_MPEGH/ISO/HEVC (for H.265). Optionally, the codec ID of track 2 should be <code>A_AAC</code> (for AAC) or A_MS/ACM (for G.711).</p> </li> <li> <p>Data retention must be greater than 0.</p> </li> <li> <p>The video track of each fragment must contain codec private data in the Advanced Video Coding (AVC) for H.264 format and HEVC for H.265 format. For more information, see <a href=\\\"https://www.iso.org/standard/55980.html\\\">MPEG-4 specification ISO/IEC 14496-15</a>. For information about adapting stream data to a given format, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/producer-reference-nal.html\\\">NAL Adaptation Flags</a>.</p> </li> <li> <p>The audio track (if present) of each fragment must contain codec private data in the AAC format (<a href=\\\"https://www.iso.org/standard/43345.html\\\">AAC specification ISO/IEC 13818-7</a>) or the <a href=\\\"http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html\\\">MS Wave format</a>.</p> </li> </ul> <p>You can monitor the amount of outgoing data by monitoring the <code>GetClip.OutgoingBytes</code> Amazon CloudWatch metric. For information about using CloudWatch to monitor Kinesis Video Streams, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html\\\">Monitoring Kinesis Video Streams</a>. For pricing information, see <a href=\\\"https://aws.amazon.com/kinesis/video-streams/pricing/\\\">Amazon Kinesis Video Streams Pricing</a> and <a href=\\\"https://aws.amazon.com/pricing/\\\"> Amazon Web Services Pricing</a>. Charges for outgoing Amazon Web Services data apply.</p>\"\
    },\
    \"GetDASHStreamingSessionURL\":{\
      \"name\":\"GetDASHStreamingSessionURL\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getDASHStreamingSessionURL\"\
      },\
      \"input\":{\"shape\":\"GetDASHStreamingSessionURLInput\"},\
      \"output\":{\"shape\":\"GetDASHStreamingSessionURLOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnsupportedStreamMediaTypeException\"},\
        {\"shape\":\"NoDataRetentionException\"},\
        {\"shape\":\"MissingCodecPrivateDataException\"},\
        {\"shape\":\"InvalidCodecPrivateDataException\"}\
      ],\
      \"documentation\":\"<p>Retrieves an MPEG Dynamic Adaptive Streaming over HTTP (DASH) URL for the stream. You can then open the URL in a media player to view the stream contents.</p> <p>Both the <code>StreamName</code> and the <code>StreamARN</code> parameters are optional, but you must specify either the <code>StreamName</code> or the <code>StreamARN</code> when invoking this API operation.</p> <p>An Amazon Kinesis video stream has the following requirements for providing data through MPEG-DASH:</p> <ul> <li> <p>The media must contain h.264 or h.265 encoded video and, optionally, AAC or G.711 encoded audio. Specifically, the codec ID of track 1 should be <code>V_MPEG/ISO/AVC</code> (for h.264) or V_MPEGH/ISO/HEVC (for H.265). Optionally, the codec ID of track 2 should be <code>A_AAC</code> (for AAC) or A_MS/ACM (for G.711).</p> </li> <li> <p>Data retention must be greater than 0.</p> </li> <li> <p>The video track of each fragment must contain codec private data in the Advanced Video Coding (AVC) for H.264 format and HEVC for H.265 format. For more information, see <a href=\\\"https://www.iso.org/standard/55980.html\\\">MPEG-4 specification ISO/IEC 14496-15</a>. For information about adapting stream data to a given format, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/producer-reference-nal.html\\\">NAL Adaptation Flags</a>.</p> </li> <li> <p>The audio track (if present) of each fragment must contain codec private data in the AAC format (<a href=\\\"https://www.iso.org/standard/43345.html\\\">AAC specification ISO/IEC 13818-7</a>) or the <a href=\\\"http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html\\\">MS Wave format</a>.</p> </li> </ul> <p>The following procedure shows how to use MPEG-DASH with Kinesis Video Streams:</p> <ol> <li> <p>Get an endpoint using <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_GetDataEndpoint.html\\\">GetDataEndpoint</a>, specifying <code>GET_DASH_STREAMING_SESSION_URL</code> for the <code>APIName</code> parameter.</p> </li> <li> <p>Retrieve the MPEG-DASH URL using <code>GetDASHStreamingSessionURL</code>. Kinesis Video Streams creates an MPEG-DASH streaming session to be used for accessing content in a stream using the MPEG-DASH protocol. <code>GetDASHStreamingSessionURL</code> returns an authenticated URL (that includes an encrypted session token) for the session's MPEG-DASH <i>manifest</i> (the root resource needed for streaming with MPEG-DASH).</p> <note> <p>Don't share or store this token where an unauthorized entity can access it. The token provides access to the content of the stream. Safeguard the token with the same measures that you use with your Amazon Web Services credentials.</p> </note> <p>The media that is made available through the manifest consists only of the requested stream, time range, and format. No other media data (such as frames outside the requested window or alternate bitrates) is made available.</p> </li> <li> <p>Provide the URL (containing the encrypted session token) for the MPEG-DASH manifest to a media player that supports the MPEG-DASH protocol. Kinesis Video Streams makes the initialization fragment and media fragments available through the manifest URL. The initialization fragment contains the codec private data for the stream, and other data needed to set up the video or audio decoder and renderer. The media fragments contain encoded video frames or encoded audio samples.</p> </li> <li> <p>The media player receives the authenticated URL and requests stream metadata and media data normally. When the media player requests data, it calls the following actions:</p> <ul> <li> <p> <b>GetDASHManifest:</b> Retrieves an MPEG DASH manifest, which contains the metadata for the media that you want to playback.</p> </li> <li> <p> <b>GetMP4InitFragment:</b> Retrieves the MP4 initialization fragment. The media player typically loads the initialization fragment before loading any media fragments. This fragment contains the \\\"<code>fytp</code>\\\" and \\\"<code>moov</code>\\\" MP4 atoms, and the child atoms that are needed to initialize the media player decoder.</p> <p>The initialization fragment does not correspond to a fragment in a Kinesis video stream. It contains only the codec private data for the stream and respective track, which the media player needs to decode the media frames.</p> </li> <li> <p> <b>GetMP4MediaFragment:</b> Retrieves MP4 media fragments. These fragments contain the \\\"<code>moof</code>\\\" and \\\"<code>mdat</code>\\\" MP4 atoms and their child atoms, containing the encoded fragment's media frames and their timestamps. </p> <note> <p>After the first media fragment is made available in a streaming session, any fragments that don't contain the same codec private data cause an error to be returned when those different media fragments are loaded. Therefore, the codec private data should not change between fragments in a session. This also means that the session fails if the fragments in a stream change from having only video to having both audio and video.</p> </note> <p>Data retrieved with this action is billable. See <a href=\\\"https://aws.amazon.com/kinesis/video-streams/pricing/\\\">Pricing</a> for details.</p> </li> </ul> </li> </ol> <note> <p>For restrictions that apply to MPEG-DASH sessions, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html\\\">Kinesis Video Streams Limits</a>.</p> </note> <p>You can monitor the amount of data that the media player consumes by monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon CloudWatch metric. For information about using CloudWatch to monitor Kinesis Video Streams, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html\\\">Monitoring Kinesis Video Streams</a>. For pricing information, see <a href=\\\"https://aws.amazon.com/kinesis/video-streams/pricing/\\\">Amazon Kinesis Video Streams Pricing</a> and <a href=\\\"https://aws.amazon.com/pricing/\\\">Amazon Web Services Pricing</a>. Charges for both HLS sessions and outgoing Amazon Web Services data apply.</p> <p>For more information about HLS, see <a href=\\\"https://developer.apple.com/streaming/\\\">HTTP Live Streaming</a> on the <a href=\\\"https://developer.apple.com\\\">Apple Developer site</a>.</p> <important> <p>If an error is thrown after invoking a Kinesis Video Streams archived media API, in addition to the HTTP status code and the response body, it includes the following pieces of information: </p> <ul> <li> <p> <code>x-amz-ErrorType</code> HTTP header â contains a more specific error type in addition to what the HTTP status code provides. </p> </li> <li> <p> <code>x-amz-RequestId</code> HTTP header â if you want to report an issue to Amazon Web Services the support team can better diagnose the problem if given the Request Id.</p> </li> </ul> <p>Both the HTTP status code and the ErrorType header can be utilized to make programmatic decisions about whether errors are retry-able and under what conditions, as well as provide information on what actions the client programmer might need to take in order to successfully try again.</p> <p>For more information, see the <b>Errors</b> section at the bottom of this topic, as well as <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html\\\">Common Errors</a>. </p> </important>\"\
    },\
    \"GetHLSStreamingSessionURL\":{\
      \"name\":\"GetHLSStreamingSessionURL\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getHLSStreamingSessionURL\"\
      },\
      \"input\":{\"shape\":\"GetHLSStreamingSessionURLInput\"},\
      \"output\":{\"shape\":\"GetHLSStreamingSessionURLOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"},\
        {\"shape\":\"UnsupportedStreamMediaTypeException\"},\
        {\"shape\":\"NoDataRetentionException\"},\
        {\"shape\":\"MissingCodecPrivateDataException\"},\
        {\"shape\":\"InvalidCodecPrivateDataException\"}\
      ],\
      \"documentation\":\"<p>Retrieves an HTTP Live Streaming (HLS) URL for the stream. You can then open the URL in a browser or media player to view the stream contents.</p> <p>Both the <code>StreamName</code> and the <code>StreamARN</code> parameters are optional, but you must specify either the <code>StreamName</code> or the <code>StreamARN</code> when invoking this API operation.</p> <p>An Amazon Kinesis video stream has the following requirements for providing data through HLS:</p> <ul> <li> <p>For streaming video, the media must contain H.264 or H.265 encoded video and, optionally, AAC encoded audio. Specifically, the codec ID of track 1 should be <code>V_MPEG/ISO/AVC</code> (for H.264) or <code>V_MPEG/ISO/HEVC</code> (for H.265). Optionally, the codec ID of track 2 should be <code>A_AAC</code>. For audio only streaming, the codec ID of track 1 should be <code>A_AAC</code>.</p> </li> <li> <p>Data retention must be greater than 0.</p> </li> <li> <p>The video track of each fragment must contain codec private data in the Advanced Video Coding (AVC) for H.264 format or HEVC for H.265 format (<a href=\\\"https://www.iso.org/standard/55980.html\\\">MPEG-4 specification ISO/IEC 14496-15</a>). For information about adapting stream data to a given format, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/producer-reference-nal.html\\\">NAL Adaptation Flags</a>.</p> </li> <li> <p>The audio track (if present) of each fragment must contain codec private data in the AAC format (<a href=\\\"https://www.iso.org/standard/43345.html\\\">AAC specification ISO/IEC 13818-7</a>).</p> </li> </ul> <p>Kinesis Video Streams HLS sessions contain fragments in the fragmented MPEG-4 form (also called fMP4 or CMAF) or the MPEG-2 form (also called TS chunks, which the HLS specification also supports). For more information about HLS fragment types, see the <a href=\\\"https://tools.ietf.org/html/draft-pantos-http-live-streaming-23\\\">HLS specification</a>.</p> <p>The following procedure shows how to use HLS with Kinesis Video Streams:</p> <ol> <li> <p>Get an endpoint using <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_GetDataEndpoint.html\\\">GetDataEndpoint</a>, specifying <code>GET_HLS_STREAMING_SESSION_URL</code> for the <code>APIName</code> parameter.</p> </li> <li> <p>Retrieve the HLS URL using <code>GetHLSStreamingSessionURL</code>. Kinesis Video Streams creates an HLS streaming session to be used for accessing content in a stream using the HLS protocol. <code>GetHLSStreamingSessionURL</code> returns an authenticated URL (that includes an encrypted session token) for the session's HLS <i>master playlist</i> (the root resource needed for streaming with HLS).</p> <note> <p>Don't share or store this token where an unauthorized entity could access it. The token provides access to the content of the stream. Safeguard the token with the same measures that you would use with your Amazon Web Services credentials.</p> </note> <p>The media that is made available through the playlist consists only of the requested stream, time range, and format. No other media data (such as frames outside the requested window or alternate bitrates) is made available.</p> </li> <li> <p>Provide the URL (containing the encrypted session token) for the HLS master playlist to a media player that supports the HLS protocol. Kinesis Video Streams makes the HLS media playlist, initialization fragment, and media fragments available through the master playlist URL. The initialization fragment contains the codec private data for the stream, and other data needed to set up the video or audio decoder and renderer. The media fragments contain H.264-encoded video frames or AAC-encoded audio samples.</p> </li> <li> <p>The media player receives the authenticated URL and requests stream metadata and media data normally. When the media player requests data, it calls the following actions:</p> <ul> <li> <p> <b>GetHLSMasterPlaylist:</b> Retrieves an HLS master playlist, which contains a URL for the <code>GetHLSMediaPlaylist</code> action for each track, and additional metadata for the media player, including estimated bitrate and resolution.</p> </li> <li> <p> <b>GetHLSMediaPlaylist:</b> Retrieves an HLS media playlist, which contains a URL to access the MP4 initialization fragment with the <code>GetMP4InitFragment</code> action, and URLs to access the MP4 media fragments with the <code>GetMP4MediaFragment</code> actions. The HLS media playlist also contains metadata about the stream that the player needs to play it, such as whether the <code>PlaybackMode</code> is <code>LIVE</code> or <code>ON_DEMAND</code>. The HLS media playlist is typically static for sessions with a <code>PlaybackType</code> of <code>ON_DEMAND</code>. The HLS media playlist is continually updated with new fragments for sessions with a <code>PlaybackType</code> of <code>LIVE</code>. There is a distinct HLS media playlist for the video track and the audio track (if applicable) that contains MP4 media URLs for the specific track. </p> </li> <li> <p> <b>GetMP4InitFragment:</b> Retrieves the MP4 initialization fragment. The media player typically loads the initialization fragment before loading any media fragments. This fragment contains the \\\"<code>fytp</code>\\\" and \\\"<code>moov</code>\\\" MP4 atoms, and the child atoms that are needed to initialize the media player decoder.</p> <p>The initialization fragment does not correspond to a fragment in a Kinesis video stream. It contains only the codec private data for the stream and respective track, which the media player needs to decode the media frames.</p> </li> <li> <p> <b>GetMP4MediaFragment:</b> Retrieves MP4 media fragments. These fragments contain the \\\"<code>moof</code>\\\" and \\\"<code>mdat</code>\\\" MP4 atoms and their child atoms, containing the encoded fragment's media frames and their timestamps. </p> <note> <p>For the HLS streaming session, in-track codec private data (CPD) changes are supported. After the first media fragment is made available in a streaming session, fragments can contain CPD changes for each track. Therefore, the fragments in a session can have a different resolution, bit rate, or other information in the CPD without interrupting playback. However, any change made in the track number or track codec format can return an error when those different media fragments are loaded. For example, streaming will fail if the fragments in the stream change from having only video to having both audio and video, or if an AAC audio track is changed to an ALAW audio track. For each streaming session, only 500 CPD changes are allowed.</p> </note> <p>Data retrieved with this action is billable. For information, see <a href=\\\"https://aws.amazon.com/kinesis/video-streams/pricing/\\\">Pricing</a>.</p> </li> <li> <p> <b>GetTSFragment:</b> Retrieves MPEG TS fragments containing both initialization and media data for all tracks in the stream.</p> <note> <p>If the <code>ContainerFormat</code> is <code>MPEG_TS</code>, this API is used instead of <code>GetMP4InitFragment</code> and <code>GetMP4MediaFragment</code> to retrieve stream media.</p> </note> <p>Data retrieved with this action is billable. For more information, see <a href=\\\"https://aws.amazon.com/kinesis/video-streams/pricing/\\\">Kinesis Video Streams pricing</a>.</p> </li> </ul> </li> </ol> <p>A streaming session URL must not be shared between players. The service might throttle a session if multiple media players are sharing it. For connection limits, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html\\\">Kinesis Video Streams Limits</a>.</p> <p>You can monitor the amount of data that the media player consumes by monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon CloudWatch metric. For information about using CloudWatch to monitor Kinesis Video Streams, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html\\\">Monitoring Kinesis Video Streams</a>. For pricing information, see <a href=\\\"https://aws.amazon.com/kinesis/video-streams/pricing/\\\">Amazon Kinesis Video Streams Pricing</a> and <a href=\\\"https://aws.amazon.com/pricing/\\\">Amazon Web Services Pricing</a>. Charges for both HLS sessions and outgoing Amazon Web Services data apply.</p> <p>For more information about HLS, see <a href=\\\"https://developer.apple.com/streaming/\\\">HTTP Live Streaming</a> on the <a href=\\\"https://developer.apple.com\\\">Apple Developer site</a>.</p> <important> <p>If an error is thrown after invoking a Kinesis Video Streams archived media API, in addition to the HTTP status code and the response body, it includes the following pieces of information: </p> <ul> <li> <p> <code>x-amz-ErrorType</code> HTTP header â contains a more specific error type in addition to what the HTTP status code provides. </p> </li> <li> <p> <code>x-amz-RequestId</code> HTTP header â if you want to report an issue to Amazon Web Services, the support team can better diagnose the problem if given the Request Id.</p> </li> </ul> <p>Both the HTTP status code and the ErrorType header can be utilized to make programmatic decisions about whether errors are retry-able and under what conditions, as well as provide information on what actions the client programmer might need to take in order to successfully try again.</p> <p>For more information, see the <b>Errors</b> section at the bottom of this topic, as well as <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html\\\">Common Errors</a>. </p> </important>\"\
    },\
    \"GetImages\":{\
      \"name\":\"GetImages\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getImages\"\
      },\
      \"input\":{\"shape\":\"GetImagesInput\"},\
      \"output\":{\"shape\":\"GetImagesOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of Images corresponding to each timestamp for a given time range, sampling interval, and image format configuration.</p>\"\
    },\
    \"GetMediaForFragmentList\":{\
      \"name\":\"GetMediaForFragmentList\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/getMediaForFragmentList\"\
      },\
      \"input\":{\"shape\":\"GetMediaForFragmentListInput\"},\
      \"output\":{\"shape\":\"GetMediaForFragmentListOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Gets media for a list of fragments (specified by fragment number) from the archived data in an Amazon Kinesis video stream.</p> <note> <p>You must first call the <code>GetDataEndpoint</code> API to get an endpoint. Then send the <code>GetMediaForFragmentList</code> requests to this endpoint using the <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/\\\">--endpoint-url parameter</a>. </p> </note> <p>For limits, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html\\\">Kinesis Video Streams Limits</a>.</p> <important> <p>If an error is thrown after invoking a Kinesis Video Streams archived media API, in addition to the HTTP status code and the response body, it includes the following pieces of information: </p> <ul> <li> <p> <code>x-amz-ErrorType</code> HTTP header â contains a more specific error type in addition to what the HTTP status code provides. </p> </li> <li> <p> <code>x-amz-RequestId</code> HTTP header â if you want to report an issue to Amazon Web Services, the support team can better diagnose the problem if given the Request Id.</p> </li> </ul> <p>Both the HTTP status code and the ErrorType header can be utilized to make programmatic decisions about whether errors are retry-able and under what conditions, as well as provide information on what actions the client programmer might need to take in order to successfully try again.</p> <p>For more information, see the <b>Errors</b> section at the bottom of this topic, as well as <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html\\\">Common Errors</a>. </p> </important>\"\
    },\
    \"ListFragments\":{\
      \"name\":\"ListFragments\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/listFragments\"\
      },\
      \"input\":{\"shape\":\"ListFragmentsInput\"},\
      \"output\":{\"shape\":\"ListFragmentsOutput\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidArgumentException\"},\
        {\"shape\":\"ClientLimitExceededException\"},\
        {\"shape\":\"NotAuthorizedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of <a>Fragment</a> objects from the specified stream and timestamp range within the archived data.</p> <p>Listing fragments is eventually consistent. This means that even if the producer receives an acknowledgment that a fragment is persisted, the result might not be returned immediately from a request to <code>ListFragments</code>. However, results are typically available in less than one second.</p> <note> <p>You must first call the <code>GetDataEndpoint</code> API to get an endpoint. Then send the <code>ListFragments</code> requests to this endpoint using the <a href=\\\"https://docs.aws.amazon.com/cli/latest/reference/\\\">--endpoint-url parameter</a>. </p> </note> <important> <p>If an error is thrown after invoking a Kinesis Video Streams archived media API, in addition to the HTTP status code and the response body, it includes the following pieces of information: </p> <ul> <li> <p> <code>x-amz-ErrorType</code> HTTP header â contains a more specific error type in addition to what the HTTP status code provides. </p> </li> <li> <p> <code>x-amz-RequestId</code> HTTP header â if you want to report an issue to Amazon Web Services, the support team can better diagnose the problem if given the Request Id.</p> </li> </ul> <p>Both the HTTP status code and the ErrorType header can be utilized to make programmatic decisions about whether errors are retry-able and under what conditions, as well as provide information on what actions the client programmer might need to take in order to successfully try again.</p> <p>For more information, see the <b>Errors</b> section at the bottom of this topic, as well as <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html\\\">Common Errors</a>. </p> </important>\"\
    }\
  },\
  \"shapes\":{\
    \"ClientLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Kinesis Video Streams has throttled the request because you have exceeded a limit. Try making the call later. For information about limits, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html\\\">Kinesis Video Streams Limits</a>.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ClipFragmentSelector\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FragmentSelectorType\",\
        \"TimestampRange\"\
      ],\
      \"members\":{\
        \"FragmentSelectorType\":{\
          \"shape\":\"ClipFragmentSelectorType\",\
          \"documentation\":\"<p>The origin of the timestamps to use (Server or Producer).</p>\"\
        },\
        \"TimestampRange\":{\
          \"shape\":\"ClipTimestampRange\",\
          \"documentation\":\"<p>The range of timestamps to return.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the timestamp range and timestamp origin of a range of fragments.</p> <p>Fragments that have duplicate producer timestamps are deduplicated. This means that if producers are producing a stream of fragments with producer timestamps that are approximately equal to the true clock time, the clip will contain all of the fragments within the requested timestamp range. If some fragments are ingested within the same time range and very different points in time, only the oldest ingested collection of fragments are returned.</p>\"\
    },\
    \"ClipFragmentSelectorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRODUCER_TIMESTAMP\",\
        \"SERVER_TIMESTAMP\"\
      ]\
    },\
    \"ClipTimestampRange\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StartTimestamp\",\
        \"EndTimestamp\"\
      ],\
      \"members\":{\
        \"StartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The starting timestamp in the range of timestamps for which to return fragments. </p> <p>Only fragments that start exactly at or after <code>StartTimestamp</code> are included in the session. Fragments that start before <code>StartTimestamp</code> and continue past it aren't included in the session. If <code>FragmentSelectorType</code> is <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later than the stream head. </p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the timestamp range for the requested media.</p> <p>This value must be within 24 hours of the specified <code>StartTimestamp</code>, and it must be later than the <code>StartTimestamp</code> value. If <code>FragmentSelectorType</code> for the request is <code>SERVER_TIMESTAMP</code>, this value must be in the past. </p> <p>This value is inclusive. The <code>EndTimestamp</code> is compared to the (starting) timestamp of the fragment. Fragments that start before the <code>EndTimestamp</code> value and continue past it are included in the session. </p>\"\
        }\
      },\
      \"documentation\":\"<p>The range of timestamps for which to return fragments.</p>\"\
    },\
    \"ContainerFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FRAGMENTED_MP4\",\
        \"MPEG_TS\"\
      ]\
    },\
    \"ContentType\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9_\\\\.\\\\-]+$\"\
    },\
    \"DASHDisplayFragmentNumber\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALWAYS\",\
        \"NEVER\"\
      ]\
    },\
    \"DASHDisplayFragmentTimestamp\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALWAYS\",\
        \"NEVER\"\
      ]\
    },\
    \"DASHFragmentSelector\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FragmentSelectorType\":{\
          \"shape\":\"DASHFragmentSelectorType\",\
          \"documentation\":\"<p>The source of the timestamps for the requested media.</p> <p>When <code>FragmentSelectorType</code> is set to <code>PRODUCER_TIMESTAMP</code> and <a>GetDASHStreamingSessionURLInput$PlaybackMode</a> is <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>, the first fragment ingested with a producer timestamp within the specified <a>FragmentSelector$TimestampRange</a> is included in the media playlist. In addition, the fragments with producer timestamps within the <code>TimestampRange</code> ingested immediately following the first fragment (up to the <a>GetDASHStreamingSessionURLInput$MaxManifestFragmentResults</a> value) are included. </p> <p>Fragments that have duplicate producer timestamps are deduplicated. This means that if producers are producing a stream of fragments with producer timestamps that are approximately equal to the true clock time, the MPEG-DASH manifest will contain all of the fragments within the requested timestamp range. If some fragments are ingested within the same time range and very different points in time, only the oldest ingested collection of fragments are returned.</p> <p>When <code>FragmentSelectorType</code> is set to <code>PRODUCER_TIMESTAMP</code> and <a>GetDASHStreamingSessionURLInput$PlaybackMode</a> is <code>LIVE</code>, the producer timestamps are used in the MP4 fragments and for deduplication. But the most recently ingested fragments based on server timestamps are included in the MPEG-DASH manifest. This means that even if fragments ingested in the past have producer timestamps with values now, they are not included in the HLS media playlist.</p> <p>The default is <code>SERVER_TIMESTAMP</code>.</p>\"\
        },\
        \"TimestampRange\":{\
          \"shape\":\"DASHTimestampRange\",\
          \"documentation\":\"<p>The start and end of the timestamp range for the requested media.</p> <p>This value should not be present if <code>PlaybackType</code> is <code>LIVE</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the range of timestamps for the requested media, and the source of the timestamps. </p>\"\
    },\
    \"DASHFragmentSelectorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRODUCER_TIMESTAMP\",\
        \"SERVER_TIMESTAMP\"\
      ]\
    },\
    \"DASHMaxResults\":{\
      \"type\":\"long\",\
      \"max\":5000,\
      \"min\":1\
    },\
    \"DASHPlaybackMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LIVE\",\
        \"LIVE_REPLAY\",\
        \"ON_DEMAND\"\
      ]\
    },\
    \"DASHStreamingSessionURL\":{\"type\":\"string\"},\
    \"DASHTimestampRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the timestamp range for the requested media.</p> <p>If the <code>DASHTimestampRange</code> value is specified, the <code>StartTimestamp</code> value is required.</p> <p>Only fragments that start exactly at or after <code>StartTimestamp</code> are included in the session. Fragments that start before <code>StartTimestamp</code> and continue past it aren't included in the session. If <code>FragmentSelectorType</code> is <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later than the stream head. </p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the timestamp range for the requested media. This value must be within 24 hours of the specified <code>StartTimestamp</code>, and it must be later than the <code>StartTimestamp</code> value.</p> <p>If <code>FragmentSelectorType</code> for the request is <code>SERVER_TIMESTAMP</code>, this value must be in the past.</p> <p>The <code>EndTimestamp</code> value is required for <code>ON_DEMAND</code> mode, but optional for <code>LIVE_REPLAY</code> mode. If the <code>EndTimestamp</code> is not set for <code>LIVE_REPLAY</code> mode then the session will continue to include newly ingested fragments until the session expires.</p> <note> <p>This value is inclusive. The <code>EndTimestamp</code> is compared to the (starting) timestamp of the fragment. Fragments that start before the <code>EndTimestamp</code> value and continue past it are included in the session.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The start and end of the timestamp range for the requested media.</p> <p>This value should not be present if <code>PlaybackType</code> is <code>LIVE</code>.</p> <p>The values in <code>DASHimestampRange</code> are inclusive. Fragments that start exactly at or after the start time are included in the session. Fragments that start before the start time and continue past it are not included in the session.</p>\"\
    },\
    \"ErrorMessage\":{\"type\":\"string\"},\
    \"Expires\":{\
      \"type\":\"integer\",\
      \"max\":43200,\
      \"min\":300\
    },\
    \"Format\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"JPEG\",\
        \"PNG\"\
      ]\
    },\
    \"FormatConfig\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"FormatConfigKey\"},\
      \"value\":{\"shape\":\"FormatConfigValue\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"FormatConfigKey\":{\
      \"type\":\"string\",\
      \"enum\":[\"JPEGQuality\"]\
    },\
    \"FormatConfigValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^[a-zA-Z_0-9]+\"\
    },\
    \"Fragment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FragmentNumber\":{\
          \"shape\":\"FragmentNumberString\",\
          \"documentation\":\"<p>The unique identifier of the fragment. This value monotonically increases based on the ingestion order.</p>\"\
        },\
        \"FragmentSizeInBytes\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The total fragment size, including information about the fragment and contained media data.</p>\"\
        },\
        \"ProducerTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp from the producer corresponding to the fragment.</p>\"\
        },\
        \"ServerTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp from the Amazon Web Services server corresponding to the fragment.</p>\"\
        },\
        \"FragmentLengthInMilliseconds\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The playback duration or other time value associated with the fragment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a segment of video or other time-delimited data.</p>\"\
    },\
    \"FragmentList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Fragment\"}\
    },\
    \"FragmentNumberList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FragmentNumberString\"},\
      \"max\":1000,\
      \"min\":1\
    },\
    \"FragmentNumberString\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^[0-9]+$\"\
    },\
    \"FragmentSelector\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FragmentSelectorType\",\
        \"TimestampRange\"\
      ],\
      \"members\":{\
        \"FragmentSelectorType\":{\
          \"shape\":\"FragmentSelectorType\",\
          \"documentation\":\"<p>The origin of the timestamps to use (Server or Producer).</p>\"\
        },\
        \"TimestampRange\":{\
          \"shape\":\"TimestampRange\",\
          \"documentation\":\"<p>The range of timestamps to return.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the timestamp range and timestamp origin of a range of fragments.</p> <p>Only fragments with a start timestamp greater than or equal to the given start time and less than or equal to the end time are returned. For example, if a stream contains fragments with the following start timestamps: </p> <ul> <li> <p>00:00:00</p> </li> <li> <p>00:00:02</p> </li> <li> <p>00:00:04</p> </li> <li> <p>00:00:06</p> </li> </ul> <p> A fragment selector range with a start time of 00:00:01 and end time of 00:00:04 would return the fragments with start times of 00:00:02 and 00:00:04. </p>\"\
    },\
    \"FragmentSelectorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRODUCER_TIMESTAMP\",\
        \"SERVER_TIMESTAMP\"\
      ]\
    },\
    \"GetClipInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"ClipFragmentSelector\"],\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream for which to retrieve the media clip. </p> <p>You must specify either the StreamName or the StreamARN. </p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream for which to retrieve the media clip. </p> <p>You must specify either the StreamName or the StreamARN. </p>\"\
        },\
        \"ClipFragmentSelector\":{\
          \"shape\":\"ClipFragmentSelector\",\
          \"documentation\":\"<p>The time range of the requested clip and the source of the timestamps.</p>\"\
        }\
      }\
    },\
    \"GetClipOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>The content type of the media in the requested clip.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Payload\":{\
          \"shape\":\"Payload\",\
          \"documentation\":\"<p>Traditional MP4 file that contains the media clip from the specified video stream. The output will contain the first 100 MB or the first 200 fragments from the specified start timestamp. For more information, see <a href=\\\"https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html\\\">Kinesis Video Streams Limits</a>. </p>\"\
        }\
      },\
      \"payload\":\"Payload\"\
    },\
    \"GetDASHStreamingSessionURLInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream for which to retrieve the MPEG-DASH manifest URL.</p> <p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream for which to retrieve the MPEG-DASH manifest URL.</p> <p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"PlaybackMode\":{\
          \"shape\":\"DASHPlaybackMode\",\
          \"documentation\":\"<p>Whether to retrieve live, live replay, or archived, on-demand data.</p> <p>Features of the three types of sessions include the following:</p> <ul> <li> <p> <b> <code>LIVE</code> </b>: For sessions of this type, the MPEG-DASH manifest is continually updated with the latest fragments as they become available. We recommend that the media player retrieve a new manifest on a one-second interval. When this type of session is played in a media player, the user interface typically displays a \\\"live\\\" notification, with no scrubber control for choosing the position in the playback window to display.</p> <note> <p>In <code>LIVE</code> mode, the newest available fragments are included in an MPEG-DASH manifest, even if there is a gap between fragments (that is, if a fragment is missing). A gap like this might cause a media player to halt or cause a jump in playback. In this mode, fragments are not added to the MPEG-DASH manifest if they are older than the newest fragment in the playlist. If the missing fragment becomes available after a subsequent fragment is added to the manifest, the older fragment is not added, and the gap is not filled.</p> </note> </li> <li> <p> <b> <code>LIVE_REPLAY</code> </b>: For sessions of this type, the MPEG-DASH manifest is updated similarly to how it is updated for <code>LIVE</code> mode except that it starts by including fragments from a given start time. Instead of fragments being added as they are ingested, fragments are added as the duration of the next fragment elapses. For example, if the fragments in the session are two seconds long, then a new fragment is added to the manifest every two seconds. This mode is useful to be able to start playback from when an event is detected and continue live streaming media that has not yet been ingested as of the time of the session creation. This mode is also useful to stream previously archived media without being limited by the 1,000 fragment limit in the <code>ON_DEMAND</code> mode. </p> </li> <li> <p> <b> <code>ON_DEMAND</code> </b>: For sessions of this type, the MPEG-DASH manifest contains all the fragments for the session, up to the number that is specified in <code>MaxManifestFragmentResults</code>. The manifest must be retrieved only once for each session. When this type of session is played in a media player, the user interface typically displays a scrubber control for choosing the position in the playback window to display.</p> </li> </ul> <p>In all playback modes, if <code>FragmentSelectorType</code> is <code>PRODUCER_TIMESTAMP</code>, and if there are multiple fragments with the same start timestamp, the fragment that has the larger fragment number (that is, the newer fragment) is included in the MPEG-DASH manifest. The other fragments are not included. Fragments that have different timestamps but have overlapping durations are still included in the MPEG-DASH manifest. This can lead to unexpected behavior in the media player.</p> <p>The default is <code>LIVE</code>.</p>\"\
        },\
        \"DisplayFragmentTimestamp\":{\
          \"shape\":\"DASHDisplayFragmentTimestamp\",\
          \"documentation\":\"<p>Per the MPEG-DASH specification, the wall-clock time of fragments in the manifest file can be derived using attributes in the manifest itself. However, typically, MPEG-DASH compatible media players do not properly handle gaps in the media timeline. Kinesis Video Streams adjusts the media timeline in the manifest file to enable playback of media with discontinuities. Therefore, the wall-clock time derived from the manifest file may be inaccurate. If DisplayFragmentTimestamp is set to <code>ALWAYS</code>, the accurate fragment timestamp is added to each S element in the manifest file with the attribute name âkvs:tsâ. A custom MPEG-DASH media player is necessary to leverage this custom attribute.</p> <p>The default value is <code>NEVER</code>. When <a>DASHFragmentSelector</a> is <code>SERVER_TIMESTAMP</code>, the timestamps will be the server start timestamps. Similarly, when <a>DASHFragmentSelector</a> is <code>PRODUCER_TIMESTAMP</code>, the timestamps will be the producer start timestamps. </p>\"\
        },\
        \"DisplayFragmentNumber\":{\
          \"shape\":\"DASHDisplayFragmentNumber\",\
          \"documentation\":\"<p>Fragments are identified in the manifest file based on their sequence number in the session. If DisplayFragmentNumber is set to <code>ALWAYS</code>, the Kinesis Video Streams fragment number is added to each S element in the manifest file with the attribute name âkvs:fnâ. These fragment numbers can be used for logging or for use with other APIs (e.g. <code>GetMedia</code> and <code>GetMediaForFragmentList</code>). A custom MPEG-DASH media player is necessary to leverage these this custom attribute.</p> <p>The default value is <code>NEVER</code>.</p>\"\
        },\
        \"DASHFragmentSelector\":{\
          \"shape\":\"DASHFragmentSelector\",\
          \"documentation\":\"<p>The time range of the requested fragment and the source of the timestamps.</p> <p>This parameter is required if <code>PlaybackMode</code> is <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>. This parameter is optional if PlaybackMode is<code/> <code>LIVE</code>. If <code>PlaybackMode</code> is <code>LIVE</code>, the <code>FragmentSelectorType</code> can be set, but the <code>TimestampRange</code> should not be set. If <code>PlaybackMode</code> is <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>, both <code>FragmentSelectorType</code> and <code>TimestampRange</code> must be set.</p>\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The time in seconds until the requested session expires. This value can be between 300 (5 minutes) and 43200 (12 hours).</p> <p>When a session expires, no new calls to <code>GetDashManifest</code>, <code>GetMP4InitFragment</code>, or <code>GetMP4MediaFragment</code> can be made for that session.</p> <p>The default is 300 (5 minutes).</p>\"\
        },\
        \"MaxManifestFragmentResults\":{\
          \"shape\":\"DASHMaxResults\",\
          \"documentation\":\"<p>The maximum number of fragments that are returned in the MPEG-DASH manifest.</p> <p>When the <code>PlaybackMode</code> is <code>LIVE</code>, the most recent fragments are returned up to this value. When the <code>PlaybackMode</code> is <code>ON_DEMAND</code>, the oldest fragments are returned, up to this maximum number.</p> <p>When there are a higher number of fragments available in a live MPEG-DASH manifest, video players often buffer content before starting playback. Increasing the buffer size increases the playback latency, but it decreases the likelihood that rebuffering will occur during playback. We recommend that a live MPEG-DASH manifest have a minimum of 3 fragments and a maximum of 10 fragments.</p> <p>The default is 5 fragments if <code>PlaybackMode</code> is <code>LIVE</code> or <code>LIVE_REPLAY</code>, and 1,000 if <code>PlaybackMode</code> is <code>ON_DEMAND</code>. </p> <p>The maximum value of 1,000 fragments corresponds to more than 16 minutes of video on streams with 1-second fragments, and more than 2 1/2 hours of video on streams with 10-second fragments.</p>\"\
        }\
      }\
    },\
    \"GetDASHStreamingSessionURLOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DASHStreamingSessionURL\":{\
          \"shape\":\"DASHStreamingSessionURL\",\
          \"documentation\":\"<p>The URL (containing the session token) that a media player can use to retrieve the MPEG-DASH manifest.</p>\"\
        }\
      }\
    },\
    \"GetHLSStreamingSessionURLInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream for which to retrieve the HLS master playlist URL.</p> <p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream for which to retrieve the HLS master playlist URL.</p> <p>You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"PlaybackMode\":{\
          \"shape\":\"HLSPlaybackMode\",\
          \"documentation\":\"<p>Whether to retrieve live, live replay, or archived, on-demand data.</p> <p>Features of the three types of sessions include the following:</p> <ul> <li> <p> <b> <code>LIVE</code> </b>: For sessions of this type, the HLS media playlist is continually updated with the latest fragments as they become available. We recommend that the media player retrieve a new playlist on a one-second interval. When this type of session is played in a media player, the user interface typically displays a \\\"live\\\" notification, with no scrubber control for choosing the position in the playback window to display.</p> <note> <p>In <code>LIVE</code> mode, the newest available fragments are included in an HLS media playlist, even if there is a gap between fragments (that is, if a fragment is missing). A gap like this might cause a media player to halt or cause a jump in playback. In this mode, fragments are not added to the HLS media playlist if they are older than the newest fragment in the playlist. If the missing fragment becomes available after a subsequent fragment is added to the playlist, the older fragment is not added, and the gap is not filled.</p> </note> </li> <li> <p> <b> <code>LIVE_REPLAY</code> </b>: For sessions of this type, the HLS media playlist is updated similarly to how it is updated for <code>LIVE</code> mode except that it starts by including fragments from a given start time. Instead of fragments being added as they are ingested, fragments are added as the duration of the next fragment elapses. For example, if the fragments in the session are two seconds long, then a new fragment is added to the media playlist every two seconds. This mode is useful to be able to start playback from when an event is detected and continue live streaming media that has not yet been ingested as of the time of the session creation. This mode is also useful to stream previously archived media without being limited by the 1,000 fragment limit in the <code>ON_DEMAND</code> mode. </p> </li> <li> <p> <b> <code>ON_DEMAND</code> </b>: For sessions of this type, the HLS media playlist contains all the fragments for the session, up to the number that is specified in <code>MaxMediaPlaylistFragmentResults</code>. The playlist must be retrieved only once for each session. When this type of session is played in a media player, the user interface typically displays a scrubber control for choosing the position in the playback window to display.</p> </li> </ul> <p>In all playback modes, if <code>FragmentSelectorType</code> is <code>PRODUCER_TIMESTAMP</code>, and if there are multiple fragments with the same start timestamp, the fragment that has the largest fragment number (that is, the newest fragment) is included in the HLS media playlist. The other fragments are not included. Fragments that have different timestamps but have overlapping durations are still included in the HLS media playlist. This can lead to unexpected behavior in the media player.</p> <p>The default is <code>LIVE</code>.</p>\"\
        },\
        \"HLSFragmentSelector\":{\
          \"shape\":\"HLSFragmentSelector\",\
          \"documentation\":\"<p>The time range of the requested fragment and the source of the timestamps.</p> <p>This parameter is required if <code>PlaybackMode</code> is <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>. This parameter is optional if PlaybackMode is<code/> <code>LIVE</code>. If <code>PlaybackMode</code> is <code>LIVE</code>, the <code>FragmentSelectorType</code> can be set, but the <code>TimestampRange</code> should not be set. If <code>PlaybackMode</code> is <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>, both <code>FragmentSelectorType</code> and <code>TimestampRange</code> must be set.</p>\"\
        },\
        \"ContainerFormat\":{\
          \"shape\":\"ContainerFormat\",\
          \"documentation\":\"<p>Specifies which format should be used for packaging the media. Specifying the <code>FRAGMENTED_MP4</code> container format packages the media into MP4 fragments (fMP4 or CMAF). This is the recommended packaging because there is minimal packaging overhead. The other container format option is <code>MPEG_TS</code>. HLS has supported MPEG TS chunks since it was released and is sometimes the only supported packaging on older HLS players. MPEG TS typically has a 5-25 percent packaging overhead. This means MPEG TS typically requires 5-25 percent more bandwidth and cost than fMP4.</p> <p>The default is <code>FRAGMENTED_MP4</code>.</p>\"\
        },\
        \"DiscontinuityMode\":{\
          \"shape\":\"HLSDiscontinuityMode\",\
          \"documentation\":\"<p>Specifies when flags marking discontinuities between fragments are added to the media playlists.</p> <p>Media players typically build a timeline of media content to play, based on the timestamps of each fragment. This means that if there is any overlap or gap between fragments (as is typical if <a>HLSFragmentSelector</a> is set to <code>SERVER_TIMESTAMP</code>), the media player timeline will also have small gaps between fragments in some places, and will overwrite frames in other places. Gaps in the media player timeline can cause playback to stall and overlaps can cause playback to be jittery. When there are discontinuity flags between fragments, the media player is expected to reset the timeline, resulting in the next fragment being played immediately after the previous fragment. </p> <p>The following modes are supported:</p> <ul> <li> <p> <code>ALWAYS</code>: a discontinuity marker is placed between every fragment in the HLS media playlist. It is recommended to use a value of <code>ALWAYS</code> if the fragment timestamps are not accurate.</p> </li> <li> <p> <code>NEVER</code>: no discontinuity markers are placed anywhere. It is recommended to use a value of <code>NEVER</code> to ensure the media player timeline most accurately maps to the producer timestamps. </p> </li> <li> <p> <code>ON_DISCONTINUITY</code>: a discontinuity marker is placed between fragments that have a gap or overlap of more than 50 milliseconds. For most playback scenarios, it is recommended to use a value of <code>ON_DISCONTINUITY</code> so that the media player timeline is only reset when there is a significant issue with the media timeline (e.g. a missing fragment).</p> </li> </ul> <p>The default is <code>ALWAYS</code> when <a>HLSFragmentSelector</a> is set to <code>SERVER_TIMESTAMP</code>, and <code>NEVER</code> when it is set to <code>PRODUCER_TIMESTAMP</code>.</p>\"\
        },\
        \"DisplayFragmentTimestamp\":{\
          \"shape\":\"HLSDisplayFragmentTimestamp\",\
          \"documentation\":\"<p>Specifies when the fragment start timestamps should be included in the HLS media playlist. Typically, media players report the playhead position as a time relative to the start of the first fragment in the playback session. However, when the start timestamps are included in the HLS media playlist, some media players might report the current playhead as an absolute time based on the fragment timestamps. This can be useful for creating a playback experience that shows viewers the wall-clock time of the media.</p> <p>The default is <code>NEVER</code>. When <a>HLSFragmentSelector</a> is <code>SERVER_TIMESTAMP</code>, the timestamps will be the server start timestamps. Similarly, when <a>HLSFragmentSelector</a> is <code>PRODUCER_TIMESTAMP</code>, the timestamps will be the producer start timestamps. </p>\"\
        },\
        \"Expires\":{\
          \"shape\":\"Expires\",\
          \"documentation\":\"<p>The time in seconds until the requested session expires. This value can be between 300 (5 minutes) and 43200 (12 hours).</p> <p>When a session expires, no new calls to <code>GetHLSMasterPlaylist</code>, <code>GetHLSMediaPlaylist</code>, <code>GetMP4InitFragment</code>, <code>GetMP4MediaFragment</code>, or <code>GetTSFragment</code> can be made for that session.</p> <p>The default is 300 (5 minutes).</p>\"\
        },\
        \"MaxMediaPlaylistFragmentResults\":{\
          \"shape\":\"HLSMaxResults\",\
          \"documentation\":\"<p>The maximum number of fragments that are returned in the HLS media playlists.</p> <p>When the <code>PlaybackMode</code> is <code>LIVE</code>, the most recent fragments are returned up to this value. When the <code>PlaybackMode</code> is <code>ON_DEMAND</code>, the oldest fragments are returned, up to this maximum number.</p> <p>When there are a higher number of fragments available in a live HLS media playlist, video players often buffer content before starting playback. Increasing the buffer size increases the playback latency, but it decreases the likelihood that rebuffering will occur during playback. We recommend that a live HLS media playlist have a minimum of 3 fragments and a maximum of 10 fragments.</p> <p>The default is 5 fragments if <code>PlaybackMode</code> is <code>LIVE</code> or <code>LIVE_REPLAY</code>, and 1,000 if <code>PlaybackMode</code> is <code>ON_DEMAND</code>. </p> <p>The maximum value of 5,000 fragments corresponds to more than 80 minutes of video on streams with 1-second fragments, and more than 13 hours of video on streams with 10-second fragments.</p>\"\
        }\
      }\
    },\
    \"GetHLSStreamingSessionURLOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HLSStreamingSessionURL\":{\
          \"shape\":\"HLSStreamingSessionURL\",\
          \"documentation\":\"<p>The URL (containing the session token) that a media player can use to retrieve the HLS master playlist.</p>\"\
        }\
      }\
    },\
    \"GetImagesInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ImageSelectorType\",\
        \"StartTimestamp\",\
        \"EndTimestamp\",\
        \"Format\"\
      ],\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to retrieve the images. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream from which to retrieve the images. You must specify either the <code>StreamName</code> or the <code>StreamARN</code>.</p>\"\
        },\
        \"ImageSelectorType\":{\
          \"shape\":\"ImageSelectorType\",\
          \"documentation\":\"<p>The origin of the Server or Producer timestamps to use to generate the images.</p>\"\
        },\
        \"StartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The starting point from which the images should be generated. This <code>StartTimestamp</code> must be within an inclusive range of timestamps for an image to be returned.</p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end timestamp for the range of images to be generated. If the time range between <code>StartTimestamp</code> and <code>EndTimestamp</code> is more than 300 seconds above <code>StartTimestamp</code>, you will receive an <code>IllegalArgumentException</code>.</p>\"\
        },\
        \"SamplingInterval\":{\
          \"shape\":\"SamplingInterval\",\
          \"documentation\":\"<p>The time interval in milliseconds (ms) at which the images need to be generated from the stream, with a default of 3000 ms. The minimum value that can be provided is 200 ms. If the timestamp range is less than the sampling interval, the Image from the <code>startTimestamp</code> will be returned if available. </p> <note> <p>The minimum value of 200 ms is a hard limit.</p> </note>\"\
        },\
        \"Format\":{\
          \"shape\":\"Format\",\
          \"documentation\":\"<p>The format that will be used to encode the image.</p>\"\
        },\
        \"FormatConfig\":{\
          \"shape\":\"FormatConfig\",\
          \"documentation\":\"<p>The list of a key-value pair structure that contains extra parameters that can be applied when the image is generated. The <code>FormatConfig</code> key is the <code>JPEGQuality</code>, which indicates the JPEG quality key to be used to generate the image. The <code>FormatConfig</code> value accepts ints from 1 to 100. If the value is 1, the image will be generated with less quality and the best compression. If the value is 100, the image will be generated with the best quality and less compression. If no value is provided, the default value of the <code>JPEGQuality</code> key will be set to 80.</p>\"\
        },\
        \"WidthPixels\":{\
          \"shape\":\"WidthPixels\",\
          \"documentation\":\"<p>The width of the output image that is used in conjunction with the <code>HeightPixels</code> parameter. When both <code>WidthPixels</code> and <code>HeightPixels</code> parameters are provided, the image will be stretched to fit the specified aspect ratio. If only the <code>WidthPixels</code> parameter is provided or if only the <code>HeightPixels</code> is provided, a <code>ValidationException</code> will be thrown. If neither parameter is provided, the original image size from the stream will be returned.</p>\"\
        },\
        \"HeightPixels\":{\
          \"shape\":\"HeightPixels\",\
          \"documentation\":\"<p>The height of the output image that is used in conjunction with the <code>WidthPixels</code> parameter. When both <code>HeightPixels</code> and <code>WidthPixels</code> parameters are provided, the image will be stretched to fit the specified aspect ratio. If only the <code>HeightPixels</code> parameter is provided, its original aspect ratio will be used to calculate the <code>WidthPixels</code> ratio. If neither parameter is provided, the original image size will be returned.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"GetImagesMaxResults\",\
          \"documentation\":\"<p>The maximum number of images to be returned by the API. </p> <note> <p>The default limit is 25 images per API response. Providing a <code>MaxResults</code> greater than this value will result in a page size of 25. Any additional results will be paginated. </p> </note>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token that specifies where to start paginating the next set of Images. This is the <code>GetImages:NextToken</code> from a previously truncated response.</p>\"\
        }\
      }\
    },\
    \"GetImagesMaxResults\":{\
      \"type\":\"long\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"GetImagesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Images\":{\
          \"shape\":\"Images\",\
          \"documentation\":\"<p>The list of images generated from the video stream. If there is no media available for the given timestamp, the <code>NO_MEDIA</code> error will be listed in the output. If an error occurs while the image is being generated, the <code>MEDIA_ERROR</code> will be listed in the output as the cause of the missing image. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The encrypted token that was used in the request to get more images.</p>\"\
        }\
      }\
    },\
    \"GetMediaForFragmentListInput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Fragments\"],\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to retrieve fragment media. Specify either this parameter or the <code>StreamARN</code> parameter.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream from which to retrieve fragment media. Specify either this parameter or the <code>StreamName</code> parameter.</p>\"\
        },\
        \"Fragments\":{\
          \"shape\":\"FragmentNumberList\",\
          \"documentation\":\"<p>A list of the numbers of fragments for which to retrieve media. You retrieve these values with <a>ListFragments</a>.</p>\"\
        }\
      }\
    },\
    \"GetMediaForFragmentListOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ContentType\",\
          \"documentation\":\"<p>The content type of the requested media.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Payload\":{\
          \"shape\":\"Payload\",\
          \"documentation\":\"<p>The payload that Kinesis Video Streams returns is a sequence of chunks from the specified stream. For information about the chunks, see <a href=\\\"http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_dataplane_PutMedia.html\\\">PutMedia</a>. The chunks that Kinesis Video Streams returns in the <code>GetMediaForFragmentList</code> call also include the following additional Matroska (MKV) tags: </p> <ul> <li> <p>AWS_KINESISVIDEO_FRAGMENT_NUMBER - Fragment number returned in the chunk.</p> </li> <li> <p>AWS_KINESISVIDEO_SERVER_SIDE_TIMESTAMP - Server-side timestamp of the fragment.</p> </li> <li> <p>AWS_KINESISVIDEO_PRODUCER_SIDE_TIMESTAMP - Producer-side timestamp of the fragment.</p> </li> </ul> <p>The following tags will be included if an exception occurs:</p> <ul> <li> <p>AWS_KINESISVIDEO_FRAGMENT_NUMBER - The number of the fragment that threw the exception </p> </li> <li> <p>AWS_KINESISVIDEO_EXCEPTION_ERROR_CODE - The integer code of the </p> </li> <li> <p>AWS_KINESISVIDEO_EXCEPTION_MESSAGE - A text description of the exception </p> </li> </ul>\"\
        }\
      },\
      \"payload\":\"Payload\"\
    },\
    \"HLSDiscontinuityMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALWAYS\",\
        \"NEVER\",\
        \"ON_DISCONTINUITY\"\
      ]\
    },\
    \"HLSDisplayFragmentTimestamp\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALWAYS\",\
        \"NEVER\"\
      ]\
    },\
    \"HLSFragmentSelector\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FragmentSelectorType\":{\
          \"shape\":\"HLSFragmentSelectorType\",\
          \"documentation\":\"<p>The source of the timestamps for the requested media.</p> <p>When <code>FragmentSelectorType</code> is set to <code>PRODUCER_TIMESTAMP</code> and <a>GetHLSStreamingSessionURLInput$PlaybackMode</a> is <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>, the first fragment ingested with a producer timestamp within the specified <a>FragmentSelector$TimestampRange</a> is included in the media playlist. In addition, the fragments with producer timestamps within the <code>TimestampRange</code> ingested immediately following the first fragment (up to the <a>GetHLSStreamingSessionURLInput$MaxMediaPlaylistFragmentResults</a> value) are included. </p> <p>Fragments that have duplicate producer timestamps are deduplicated. This means that if producers are producing a stream of fragments with producer timestamps that are approximately equal to the true clock time, the HLS media playlists will contain all of the fragments within the requested timestamp range. If some fragments are ingested within the same time range and very different points in time, only the oldest ingested collection of fragments are returned.</p> <p>When <code>FragmentSelectorType</code> is set to <code>PRODUCER_TIMESTAMP</code> and <a>GetHLSStreamingSessionURLInput$PlaybackMode</a> is <code>LIVE</code>, the producer timestamps are used in the MP4 fragments and for deduplication. But the most recently ingested fragments based on server timestamps are included in the HLS media playlist. This means that even if fragments ingested in the past have producer timestamps with values now, they are not included in the HLS media playlist.</p> <p>The default is <code>SERVER_TIMESTAMP</code>.</p>\"\
        },\
        \"TimestampRange\":{\
          \"shape\":\"HLSTimestampRange\",\
          \"documentation\":\"<p>The start and end of the timestamp range for the requested media.</p> <p>This value should not be present if <code>PlaybackType</code> is <code>LIVE</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the range of timestamps for the requested media, and the source of the timestamps.</p>\"\
    },\
    \"HLSFragmentSelectorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRODUCER_TIMESTAMP\",\
        \"SERVER_TIMESTAMP\"\
      ]\
    },\
    \"HLSMaxResults\":{\
      \"type\":\"long\",\
      \"max\":5000,\
      \"min\":1\
    },\
    \"HLSPlaybackMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LIVE\",\
        \"LIVE_REPLAY\",\
        \"ON_DEMAND\"\
      ]\
    },\
    \"HLSStreamingSessionURL\":{\"type\":\"string\"},\
    \"HLSTimestampRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the timestamp range for the requested media.</p> <p>If the <code>HLSTimestampRange</code> value is specified, the <code>StartTimestamp</code> value is required. </p> <p>Only fragments that start exactly at or after <code>StartTimestamp</code> are included in the session. Fragments that start before <code>StartTimestamp</code> and continue past it aren't included in the session. If <code>FragmentSelectorType</code> is <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later than the stream head. </p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the timestamp range for the requested media. This value must be within 24 hours of the specified <code>StartTimestamp</code>, and it must be later than the <code>StartTimestamp</code> value.</p> <p>If <code>FragmentSelectorType</code> for the request is <code>SERVER_TIMESTAMP</code>, this value must be in the past.</p> <p>The <code>EndTimestamp</code> value is required for <code>ON_DEMAND</code> mode, but optional for <code>LIVE_REPLAY</code> mode. If the <code>EndTimestamp</code> is not set for <code>LIVE_REPLAY</code> mode then the session will continue to include newly ingested fragments until the session expires.</p> <note> <p>This value is inclusive. The <code>EndTimestamp</code> is compared to the (starting) timestamp of the fragment. Fragments that start before the <code>EndTimestamp</code> value and continue past it are included in the session.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The start and end of the timestamp range for the requested media.</p> <p>This value should not be present if <code>PlaybackType</code> is <code>LIVE</code>.</p>\"\
    },\
    \"HeightPixels\":{\
      \"type\":\"integer\",\
      \"max\":2160,\
      \"min\":1\
    },\
    \"Image\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TimeStamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>An attribute of the <code>Image</code> object that is used to extract an image from the video stream. This field is used to manage gaps on images or to better understand the pagination window.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"ImageError\",\
          \"documentation\":\"<p>The error message shown when the image for the provided timestamp was not extracted due to a non-tryable error. An error will be returned if: </p> <ul> <li> <p>There is no media that exists for the specified <code>Timestamp</code>.</p> </li> </ul> <ul> <li> <p>The media for the specified time does not allow an image to be extracted. In this case the media is audio only, or the incorrect media has been ingested.</p> </li> </ul>\"\
        },\
        \"ImageContent\":{\
          \"shape\":\"ImageContent\",\
          \"documentation\":\"<p>An attribute of the <code>Image</code> object that is Base64 encoded.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains the <code>Timestamp</code>, <code>Error</code>, and <code>ImageContent</code>.</p>\"\
    },\
    \"ImageContent\":{\
      \"type\":\"string\",\
      \"max\":6291456,\
      \"min\":1\
    },\
    \"ImageError\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NO_MEDIA\",\
        \"MEDIA_ERROR\"\
      ]\
    },\
    \"ImageSelectorType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PRODUCER_TIMESTAMP\",\
        \"SERVER_TIMESTAMP\"\
      ]\
    },\
    \"Images\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Image\"}\
    },\
    \"InvalidArgumentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A specified parameter exceeds its restrictions, is not supported, or can't be used.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidCodecPrivateDataException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The codec private data in at least one of the tracks of the video stream is not valid for this operation.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidMediaFrameException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>One or more frames in the requested clip could not be parsed based on the specified codec.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ListFragmentsInput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StreamName\":{\
          \"shape\":\"StreamName\",\
          \"documentation\":\"<p>The name of the stream from which to retrieve a fragment list. Specify either this parameter or the <code>StreamARN</code> parameter.</p>\"\
        },\
        \"StreamARN\":{\
          \"shape\":\"ResourceARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the stream from which to retrieve a fragment list. Specify either this parameter or the <code>StreamName</code> parameter.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"ListFragmentsMaxResults\",\
          \"documentation\":\"<p>The total number of fragments to return. If the total number of fragments available is more than the value specified in <code>max-results</code>, then a <a>ListFragmentsOutput$NextToken</a> is provided in the output that you can use to resume pagination.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>A token to specify where to start paginating. This is the <a>ListFragmentsOutput$NextToken</a> from a previously truncated response.</p>\"\
        },\
        \"FragmentSelector\":{\
          \"shape\":\"FragmentSelector\",\
          \"documentation\":\"<p>Describes the timestamp range and timestamp origin for the range of fragments to return.</p>\"\
        }\
      }\
    },\
    \"ListFragmentsMaxResults\":{\
      \"type\":\"long\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"ListFragmentsOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Fragments\":{\
          \"shape\":\"FragmentList\",\
          \"documentation\":\"<p>A list of archived <a>Fragment</a> objects from the stream that meet the selector criteria. Results are in no specific order, even across pages.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the returned list is truncated, the operation returns this token to use to retrieve the next page of results. This value is <code>null</code> when there are no more results to return.</p>\"\
        }\
      }\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MissingCodecPrivateDataException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>No codec private data was found in at least one of tracks of the video stream.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9+/]+={0,2}\"\
    },\
    \"NoDataRetentionException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>A streaming session was requested for a stream that does not retain data (that is, has a <code>DataRetentionInHours</code> of 0). </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"NotAuthorizedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>Status Code: 403, The caller is not authorized to perform an operation on the given stream, or the token has expired.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"Payload\":{\
      \"type\":\"blob\",\
      \"streaming\":true\
    },\
    \"ResourceARN\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"arn:[a-z\\\\d-]+:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p> <code>GetImages</code> will throw this error when Kinesis Video Streams can't find the stream that you specified.</p> <p> <code>GetHLSStreamingSessionURL</code> and <code>GetDASHStreamingSessionURL</code> throw this error if a session with a <code>PlaybackMode</code> of <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>is requested for a stream that has no fragments within the requested time range, or if a session with a <code>PlaybackMode</code> of <code>LIVE</code> is requested for a stream that has no fragments within the last 30 seconds.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"SamplingInterval\":{\"type\":\"integer\"},\
    \"StreamName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9_.-]+\"\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TimestampRange\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"StartTimestamp\",\
        \"EndTimestamp\"\
      ],\
      \"members\":{\
        \"StartTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The starting timestamp in the range of timestamps for which to return fragments.</p>\"\
        },\
        \"EndTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The ending timestamp in the range of timestamps for which to return fragments.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The range of timestamps for which to return fragments.</p>\"\
    },\
    \"UnsupportedStreamMediaTypeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"ErrorMessage\"}\
      },\
      \"documentation\":\"<p>The type of the media (for example, h.264 or h.265 video or ACC or G.711 audio) could not be determined from the codec IDs of the tracks in the first fragment for a playback session. The codec ID for track 1 should be <code>V_MPEG/ISO/AVC</code> and, optionally, the codec ID for track 2 should be <code>A_AAC</code>.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"WidthPixels\":{\
      \"type\":\"integer\",\
      \"max\":3840,\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p/>\"\
}\
";
}

@end
