#import "IP4APIWrapper.h"

@implementation IP4APIWrapper

- (void)IP4sWithBaseURL:( NSString * _Nonnull )baseURL completion:(void (^ _Nullable)(NSString * _Nullable))completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock {
    
    if (!baseURL) {
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
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion == nil ? : completion([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            });
            
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                onErrorBlock == nil ? : onErrorBlock(error);
            });
        }
    }];
    
    [task resume];
}

@end
