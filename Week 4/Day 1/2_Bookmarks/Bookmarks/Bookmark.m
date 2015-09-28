//
//  Bookmark.m
//  Bookmarks
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "Bookmark.h"

@implementation Bookmark

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self) {
        self.name = [aDecoder decodeObjectForKey:@"labelName"];
        self.url = [aDecoder decodeObjectForKey:@"labelUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"labelName"];
    [aCoder encodeObject:self.url forKey:@"labelUrl"];
    
}

@end
