//
//  Bank.m
//  NSCopy Practice
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "Bank.h"

@implementation Bank



- (id)copyWithZone:(NSZone *)zone{
    Bank *bank = [[[self class]alloc]init];
    
    if(bank) {
        bank.accountBalance = self.accountBalance;
        bank.balance = self.balance;
        
        bank.bankName = [self.bankName copyWithZone:zone];
    }
    return bank;
}

@end
