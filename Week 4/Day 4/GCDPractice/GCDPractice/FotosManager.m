//
//  FotosManager.m
//  GCDPractice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "FotosManager.h"

#import <UIKit/UIKit.h>

typedef void (^ImageBlock) (UIImage *);

@implementation FotosManager



+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static FotosManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[FotosManager alloc]init];
    });
    return instance;
}

- (void)downloadImageWithURL:(NSURL *)url completion:(ImageBlock)block{
    
    dispatch_queue_t imageQueue=dispatch_queue_create("Image Queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(imageQueue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
        
    });
}

@end
