//
//  SimpleCounter.h
//  BlocksPractice
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleCounter : NSObject

- (void) countToTenThousandAndNotifyObserver:(id)object withSelector:(SEL)selector;
- (void) countToTenThousandBlock:(void (^) (BOOL))completed;

@end
