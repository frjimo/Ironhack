//
//  Collection.h
//  MemeRastreator
//
//  Created by Fran on 15/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Collection <NSObject>

@required
- (void)addElement:(id)element;
- (NSUInteger)count;
- (NSArray *)allElements;
- (void)removeElement:(id)element;

@optional
- (id)randomElement;

@end
