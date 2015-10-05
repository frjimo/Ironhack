//
//  ArtistService.m
//  Artists
//
//  Created by Fran on 2/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ArtistService.h"
#import "Artist.h"

@implementation ArtistService


- (void)artistsWithCompletion:(void(^)(NSArray *))completion {
    //Si existe artista

    
}


- (void)getDataFromRemote{
    NSURL *url = [NSURL URLWithString:@"https://ironhackartists.firebaseio.com/artists.json "];
    NSURLSession *urlSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *JSONArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSArray *artists = [self artistsJSON:JSONArray];
        
        
        
    }];
}

- (NSArray *)artistsJSON:(NSArray *)JSONArray {
    
    NSMutableArray *artist = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dictionary in JSONArray) {
        
        NSURL *imageURL = [NSURL URLWithString:dictionary[@"image_url"]];
        //NSDate *startDate //dictionary[@"start_day"]];
        NSUInteger artistId = [dictionary[@"id"] integerValue];
        
        Artist *artist = [Artist artistWithName:dictionary[@"name"]
                                longDescription:dictionary[@"description"]
                                          stage:dictionary[@"stage"]
                                       imageURL:imageURL
                                      startDate:nil
                                       :artistId];
        [artist addObject:artist];
    }
    
    return artist;
}
@end
