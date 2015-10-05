//
//  ArtistService.h
//  Artists
//
//  Created by Fran on 2/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistService : NSObject

- (void)artistsWithCompletion:(void(^)(NSArray *))completion;

@end
