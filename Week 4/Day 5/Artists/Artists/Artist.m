//
//  Artist.m
//  Artists
//
//  Created by Fran on 2/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)init
{
    return [self initWithName:nil longDescription:nil stage:nil imageURL:nil starDate:nil];
}

+ (instancetype)artistWithName:(NSString *)name longDescription:(NSString *)longDescription stage:(NSString *)stage imageURL:(NSURL *)imageURL starDate:(NSDate *)startDate{
    return [[self alloc] initWithName:name longDescription:longDescription stage:stage imageURL:imageURL starDate:startDate];
}

- (instancetype)initWithName:(NSString *)name longDescription:(NSString *)longDescription stage:(NSString *)stage imageURL:(NSURL *)imageURL starDate:(NSDate *)startDate{
    self =[super init];
    
    if(self){
        _name = name;
        _longDescription = longDescription;
        _stage = stage;
        _imageURL = imageURL;
        _startDate = startDate;
    }
    return self;
}


- (id)copyWithZone:(NSZone *)zone{
    Artist *artist = [[[self class]alloc]init];
    
    if(artist) {
        artist.name = [self.name copy];
        artist.longDescription = [self.longDescription copy];
        artist.stage = [self.stage copy];
        artist.imageURL = self.imageURL;
        artist.startDate = self.startDate;
    }
    return artist;
}



+ (instancetype)randomArtist {
    return nil;
}



@end
