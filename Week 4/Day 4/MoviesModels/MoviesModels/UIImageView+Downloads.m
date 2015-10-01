//
//  UIImageView+Downloads.m
//  MoviesModels
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "UIImageView+Downloads.h"
#import "ImageDownloader.h"

@implementation UIImageView (Downloads)

- (void)setImageWithURL:(NSURL *)imageURL completion:(void (^)(BOOL succes))completion {
        [[ImageDownloader sharedInstance] downloadImageWithURL:[imageURL absoluteString] completion:^(UIImage *image) {
            self.image = image;
        }];
}

//- (void)setImageWithURL:(NSURL *)imageURL completion:(void (^)(BOOL succes))completion {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSData  *imageData = [NSData dataWithContentsOfURL:imageURL];
//        UIImage *image = [UIImage imageWithData:imageData];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (imageData){
//                self.image = image;
//            }
//            if (completion) {
//                completion(imageData?YES:NO);
//            }
//        });
//    });
//}

@end
