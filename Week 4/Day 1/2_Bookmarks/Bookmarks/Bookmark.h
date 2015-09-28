//
//  Bookmark.h
//  Bookmarks
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Bookmark : MTLModel

@property (nonatomic, copy) NSString *url, *name;

@end
