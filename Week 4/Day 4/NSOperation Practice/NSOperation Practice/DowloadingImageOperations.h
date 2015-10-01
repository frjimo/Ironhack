//
//  DowloadingImageOperations.h
//  NSOperation Practice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface DowloadingImageOperations : NSOperation

- (instancetype)initWithImageCompletionBlock:(void (^)(UIImage *))imageBlock;

@end
