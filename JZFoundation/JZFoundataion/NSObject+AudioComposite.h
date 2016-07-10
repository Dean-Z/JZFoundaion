//
//  NSObject+AudioComposite.h
//  JZFoundation
//
//  Created by Z on 16/7/10.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface NSObject (AudioComposite)

- (void)precompositeAVassetAudio:(NSURL *)vocalUrl
                  pickMediaItems:(MPMediaItemCollection *)mediaItemCollection
                      completion:(void(^)(NSURL*))completion;

- (void)exchangePickMediaItems:(MPMediaItemCollection *)mediaItemCollection
                    completion:(void(^)(NSURL*))completion;
@end
