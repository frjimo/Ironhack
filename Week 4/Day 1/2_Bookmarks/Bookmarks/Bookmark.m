//
//  Bookmark.m
//  Bookmarks
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "Bookmark.h"

@implementation Bookmark

//- (id)initWithCoder:(NSCoder *)aDecoder{
//    self = [super init];
//    if(self) {
//        self.name = [aDecoder decodeObjectForKey:@"labelName"];
//        self.url = [aDecoder decodeObjectForKey:@"labelUrl"];
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:self.name forKey:@"labelName"];
//    [aCoder encodeObject:self.url forKey:@"labelUrl"];
//    
//}
//
//- (BOOL)isEqualBookmark:(Bookmark *)other {
//    //return ([self.name isEqualToString:other.name] && [self.url isEqualToString: other.url]);
//    return ([self.url isEqualToString: other.url]);
//}
//
//
//- (BOOL)isEqual:(id)other
//{
//    if (self == other){
//        return YES;
//    }
//    if (![other isKindOfClass:[self class]]){
//        return NO;
//    }
//    return [self isEqualBookmark:(Bookmark *)other];
//}
//
//- (NSUInteger)hash
//{
////    NSLog(@"url:%lu",[_url hash]);
////    NSLog(@"name:%lu",[_name hash]);
////    NSLog(@"Valor: %lu",[_url hash] ^ [_name hash]);
////    return [_url hash] ^ [_name hash];
//    return [_url hash];
//}

@end
