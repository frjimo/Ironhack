//
//  ImageDownloader.m
//  MoviesModels
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "ImageDownloader.h"

@interface ImageDownloader ()

@property (nonatomic, strong) dispatch_queue_t download_q;
@property (nonatomic, strong) NSMutableDictionary *cacheKeys;

@end

@implementation ImageDownloader

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static ImageDownloader *instance;
    dispatch_once(&onceToken, ^{
        instance = [[ImageDownloader alloc]init];
    });
    return instance;
}

- (void)downloadImageWithURL:(NSString *)url completion:(DownloadedImageCompletionBlock)completion{
    dispatch_async(self.download_q, ^{
        //Conseguir la imagen de cache si la tenemos, sino nil
        UIImage *image = [self imageFromCacheWithURL:url];
        //Si no tenemos imagen
        if(!image){
            //Descargamos imagen
            image = [self downloadImage:url];
            //Se guarda imagen en cache
            [self saveImageCache:image withURL:url];
            dispatch_async(dispatch_get_main_queue(), ^{
                //completion can be nil
                if(completion){
                    //Imagen conseguida
                    completion(image);
                }
            });
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //completion can be nil
                if(completion){
                    //Imagen conseguida
                    completion(image);
                }
            });
        }
    });
    
    
}

- (void)saveImageCache:(UIImage *)image withURL:(NSString *)url{
    
}

- (UIImage *)downloadImage:(NSString *)url{
    
    return nil;
}

- (UIImage *)imageFromCacheWithURL:(NSString *)url{
    
    
    return nil;
    
}

- (dispatch_queue_t)download_q{
    if (!_download_q){
        _download_q = dispatch_queue_create("com.ironhack.cache.fran", DISPATCH_QUEUE_SERIAL);
    }
    return _download_q;
}





@end
