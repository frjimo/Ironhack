//
//  DowloadingImageOperations.m
//  NSOperation Practice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "DowloadingImageOperations.h"

#import <UIKit/UIKit.h>

@interface DowloadingImageOperations ()

@property (nonatomic, copy) void (^imageBlock)(UIImage *);

@end

@implementation DowloadingImageOperations

- (instancetype)initWithImageCompletionBlock:(void (^)(UIImage *))imageBlock{
    self = [super init];
    if (self){
        _imageBlock = [imageBlock copy];
    }
    return self;
}



- (void)main {
    
    if (self.cancelled){
        return;
    }
    
    NSString *imageString = @"http://maxcdn.thedesigninspiration.com/wp-content/uploads/2009/12/ksenia/Ksenia-Scenery-01.jpg";
    NSURL *imageUrl = [NSURL URLWithString:imageString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [UIImage imageWithData:imageData];
    
    
    if (self.cancelled){
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageBlock (image);
    });
}
@end
