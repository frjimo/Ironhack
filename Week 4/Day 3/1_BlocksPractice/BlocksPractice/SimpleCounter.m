//
//  SimpleCounter.m
//  BlocksPractice
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "SimpleCounter.h"

@implementation SimpleCounter

- (void) countToTenThousandAndNotifyObserver:(id)object withSelector:(SEL)selector{
    for (int i = 0; i < 10000; i++){
        NSLog(@"Number: %d",i);
    }
    [object performSelector:selector withObject:object];
}

- (void) countToTenThousandBlock:(void (^) (BOOL))completed{
    for (int i = 0; i < 10000; i++){
        NSLog(@"Number: %d",i);
    }
    completed(YES);
}


@end
