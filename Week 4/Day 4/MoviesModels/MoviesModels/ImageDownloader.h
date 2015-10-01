//
//  ImageDownloader.h
//  MoviesModels
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DownloadedImageCompletionBlock)(UIImage *);

@interface ImageDownloader : NSObject

+ (instancetype)sharedInstance;

- (void)downloadImageWithURL:(NSString *)url completion:(DownloadedImageCompletionBlock)completion;


@end
