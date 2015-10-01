//
//  ShowsProvider.m
//  MoviesModels
//
//  Created by Joan Romano on 9/27/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "ShowsProvider.h"

#import "Show.h"

@interface ShowsProvider ()

@property (strong,nonatomic) RequestManager *requestManager;

@end

@implementation ShowsProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestManager=[[RequestManager alloc] init];
    }
    return self;
}
- (void)showsWithSuccessBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock{
    NSString *path=@"shows.json";
    NSDictionary *parameters=@{};
    [self.requestManager GET:path parameters:parameters successBlock:^(id data) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSMutableArray *shows = [[NSMutableArray alloc] init];
            for (NSDictionary *item in [data valueForKey:@"shows"]){
                Show *show = [[Show alloc]init];
                show.showId = [item objectForKey:@"id"];
                show.showTitle = [item objectForKey:@"title"];
                show.showDescription = [item objectForKey:@"description"];
                NSString * URL = [item objectForKey:@"posterURL"];
                show.posterURL = [NSURL URLWithString:URL];
                [shows addObject:show];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock(shows);
            });
        });
        
        
//        NSArray *shows = [MTLJSONAdapter modelsOfClass:[Show class] fromJSONArray:[data valueForKey:@"shows"] error:nil];
//        successBlock(shows);
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//            
//        });
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    }];
}

@end
