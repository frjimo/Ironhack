//
//  RadarAPIWebServiceProtocol.h
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RadarAPIWebServiceProtocol <NSObject>

@required

- (void)radarWithBaseURL:(NSString * _Nonnull)baseURL completion:(void (^ _Nullable)(NSString * _Nullable) )completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@optional

@end
