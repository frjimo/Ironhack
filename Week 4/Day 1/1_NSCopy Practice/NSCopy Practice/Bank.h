//
//  Bank.h
//  NSCopy Practice
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Bank : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger accountBalance;
@property (nonatomic,assign) CGFloat balance;

@property (nonatomic, copy) NSString *bankName;

@end
