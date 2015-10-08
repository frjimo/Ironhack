//
//  RadarAPIWrapper.m
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "RadarAPIWrapper.h"

@implementation RadarAPIWrapper

- (void)radarWithBaseURL:(NSString * _Nonnull)baseURL completion:(void (^ _Nullable)(NSString * _Nullable) )completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock; {
    if(!baseURL){
        onErrorBlock == nil ? : onErrorBlock(nil);
        return;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    configuration.HTTPAdditionalHeaders = @{
                                            @"accept": @"application/json",
                                            @"content-type": @"text/json"
                                            };
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURL *url = [NSURL URLWithString:baseURL];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSAssert([NSThread currentThread] != [NSThread mainThread], @"OMG");
        if(!error){
            dispatch_async(dispatch_get_main_queue(), ^{
                completion == nil ? : completion([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            });
        }

        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                onErrorBlock == nil ? : onErrorBlock(error);
                [self.refreshControl endRefreshing];
            });
        }
    }];
    
    [task resume];
}

@end
