//
//  NSObject+AudioComposite.m
//  JZFoundation
//
//  Created by Z on 16/7/10.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSObject+AudioComposite.h"
#import "JZFounation.h"
#include <stdio.h>
#include <sys/time.h>

@implementation NSObject (AudioComposite)

- (void)precompositeAVassetAudio:(NSURL *)assetUrl
                  pickMediaItems:(MPMediaItemCollection *)mediaItemCollection
                      completion:(void(^)(NSURL*))completion
{
    AVAsset *vocalAsset = [AVAsset assetWithURL:assetUrl];
    AVURLAsset *mp3Asset = [AVURLAsset assetWithURL:[mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyAssetURL]];
    
    AVMutableComposition *mixComposition = [[AVMutableComposition alloc] init];
    
    AVMutableCompositionTrack *audioTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio
                                                                        preferredTrackID:kCMPersistentTrackID_Invalid];
    [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, vocalAsset.duration)
                        ofTrack:[[vocalAsset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] atTime:kCMTimeZero error:nil];
    
    
    [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, mp3Asset.duration)
                        ofTrack:[[mp3Asset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] atTime:vocalAsset.duration error:nil];
    
    int timestamp = [[NSDate date] timeIntervalSince1970];
    
    NSString *compositionFilePath = [NSString stringWithFormat:@"%d_composition_voice.m4a", timestamp];
    NSURL *compositionOutputFileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", JZPathCache, compositionFilePath]];
    
    AVAssetExportSession *exportMp3 = [[AVAssetExportSession alloc] initWithAsset:mixComposition
                                                                       presetName:AVAssetExportPresetAppleM4A];
    
    exportMp3.outputFileType = AVFileTypeAppleM4A;
    exportMp3.shouldOptimizeForNetworkUse = YES;
    exportMp3.outputURL = compositionOutputFileURL;
    [exportMp3 exportAsynchronouslyWithCompletionHandler:^{
        if (exportMp3.status == AVAssetExportSessionStatusCompleted)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(compositionOutputFileURL);
            });
        }
    }];
}

- (void)exchangePickMediaItems:(MPMediaItemCollection *)mediaItemCollection
                    completion:(void(^)(NSURL*))completion
{
    AVURLAsset *mp3Asset = [AVURLAsset assetWithURL:[mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyAssetURL]];
    if (mp3Asset == nil)
    {
        completion(nil);
        return;
    }
    AVMutableComposition *mixComposition = [[AVMutableComposition alloc] init];
    
    AVMutableCompositionTrack *audioTrack = [mixComposition addMutableTrackWithMediaType:AVMediaTypeAudio
                                                                        preferredTrackID:kCMPersistentTrackID_Invalid];
    
    [audioTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, mp3Asset.duration)
                        ofTrack:[[mp3Asset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] atTime:kCMTimeZero error:nil];
    
    int timestamp = [[NSDate date] timeIntervalSince1970];
    
    NSString *compositionFilePath = [NSString stringWithFormat:@"%d_composition_voice.m4a", timestamp];
    NSURL *compositionOutputFileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", JZPathCache, compositionFilePath]];
    
    AVAssetExportSession *exportMp3 = [[AVAssetExportSession alloc] initWithAsset:mixComposition
                                                                       presetName:AVAssetExportPresetAppleM4A];
    
    exportMp3.outputFileType = AVFileTypeAppleM4A;
    exportMp3.shouldOptimizeForNetworkUse = YES;
    exportMp3.outputURL = compositionOutputFileURL;
    [exportMp3 exportAsynchronouslyWithCompletionHandler:^{
        if (exportMp3.status == AVAssetExportSessionStatusCompleted)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(compositionOutputFileURL);
            });
        }
        else
        {
            
        }
    }];
}

@end
