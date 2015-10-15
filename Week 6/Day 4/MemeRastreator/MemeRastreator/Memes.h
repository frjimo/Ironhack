//
//  Memes.h
//  MemeRastreator
//
//  Created by Fran on 15/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meme.h"
#import "Collection.h"
#import "Collection.h"

@interface Memes : NSObject <Collection>

- (instancetype)initWithPlistFileName:(NSString *)fileName;

- (NSArray <Meme *>*)allElements;
- (void)addElement:(Meme *)element;
- (Meme *)randomElement;
- (void)removeElement:(Meme *)element;

@end
