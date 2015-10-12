//
//  SoundEffect.h
//  ChiquitoPoseido
//
//  Created by Fran on 12/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SoundEffect;

@protocol SoundEffectDelegate <NSObject>
@optional

- (void)soundEffectDidFinishPlaying:(SoundEffect *)soundEffect;

@end

@interface SoundEffect : NSObject

@property (nonatomic, weak) id<SoundEffectDelegate> delegate;

- (void)play:(NSString *)soundFileName;
- (void)stop;

@end
