//
//  FotosManager.h
//  GCDPractice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;

@interface FotosManager : NSObject

+ (instancetype)sharedInstance;

- (void)downloadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *))block;

@end
