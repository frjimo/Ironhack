//
//  Artist.h
//  Artists
//
//  Created by Fran on 2/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject <NSCopying>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * longDescription;
@property (nonatomic, copy) NSString * stage;

@property (nonatomic, strong) NSURL *imageURL;

@property (nonatomic, strong) NSDate *startDate;


+ (instancetype)randomArtist;

+ (instancetype)artistWithName:(NSString *)name longDescription:(NSString *)longDescription stage:(NSString *)stage imageURL:(NSURL *)imageURL starDate:(NSDate *)startDate;

- (instancetype)initWithName:(NSString *)name longDescription:(NSString *)longDescription stage:(NSString *)stage imageURL:(NSURL *)imageURL starDate:(NSDate *)startDate NS_DESIGNATED_INITIALIZER;

@end
