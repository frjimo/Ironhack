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
@property (copy, nonatomic) NSString *cacheFolderPath;

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

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveKeys) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return self;
    
}

- (void)saveKeys {
    NSString *cacheKeysPath = [self.cacheFolderPath stringByAppendingPathComponent:@"keys.plist"];
    [self.cacheKeys writeToFile:cacheKeysPath atomically:YES];
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
    NSString *cacheImageString = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
    NSString *imageFilePath = [self.cacheFolderPath stringByAppendingPathComponent:cacheImageString];
    
    [self.cacheKeys setObject:cacheImageString forKey:url];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:imageFilePath atomically:YES];
    
}

- (UIImage *)downloadImage:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data  = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

- (UIImage *)imageFromCacheWithURL:(NSString *)url{
    if([self.cacheKeys valueForKey:url] == nil) {
        return nil;
    }
    else {
        return [self cachedImageForString:[self.cacheKeys valueForKey:url]];
    }
}

- (UIImage *)cachedImageForString:(NSString *)cacheImageString{
    NSString *cacheString = [self.cacheFolderPath stringByAppendingPathComponent:cacheImageString];
    NSData *dataImage = [NSData dataWithContentsOfFile:cacheString];
    return  [UIImage imageWithData:dataImage];
}

- (dispatch_queue_t)download_q{
    if (!_download_q){
        _download_q = dispatch_queue_create("com.ironhack.cache.fran", DISPATCH_QUEUE_SERIAL);
    }
    return _download_q;
}

- (NSDictionary *)cacheKeys {
    if (!_cacheKeys) {
        _cacheKeys = [self createCacheKeys];
    }
    return _cacheKeys;
}

- (NSString *)cacheFolderPath {
    if (!_cacheFolderPath) {
        _cacheFolderPath = [self createCacheFolderPath];
    }
    return _cacheFolderPath;
}


- (NSMutableDictionary *)createCacheKeys {
    
    NSString *cachePath = [self.cacheFolderPath stringByAppendingPathComponent:@"keys.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath]) {
        return [NSMutableDictionary new];
    }
    
    NSDictionary *cacheKeys = [NSDictionary dictionaryWithContentsOfFile:cachePath];
    return [cacheKeys mutableCopy];
}


- (NSString *)createCacheFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheFolderPath = [[paths firstObject] stringByAppendingPathComponent:@"cacheFolder"];
    
    [[NSFileManager defaultManager] createDirectoryAtPath:cacheFolderPath withIntermediateDirectories:NO attributes:@{} error:nil];
    
    return cacheFolderPath;
}




@end
