//
//  RadarAPIWrapper.h
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadarAPIWebServiceProtocol.h"

@interface RadarAPIWrapper : UITableViewController <RadarAPIWebServiceProtocol>


/**
 *  Method that fetches some radars form the internets.
 *
 *  @param baseURL      baseURL description
 *  @param completion   completion description
 *  @param onErrorBlock onErrorBlock description
 */
- (void)radarWithBaseURL:(NSString * _Nonnull)baseURL completion:(void (^ _Nullable)(NSString * _Nullable) )completion onError:(void (^ _Nullable)(NSError * _Nullable))onErrorBlock;

@end
