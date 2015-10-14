//
//  IP4Generator.m
//  GeoIP
//
//  Created by Fran on 13/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "IP4Generator.h"

@interface IP4Generator ()

@property (nonatomic, copy) NSString *IP4addresses;



@end

@implementation IP4Generator

- (NSMutableArray <NSString *>*)nIPAdress:(NSUInteger)n{
    NSMutableArray <NSString *>*arrayIP4Adress = [[NSMutableArray alloc]init];
    for(int i = 0; i<n; i++){
        [arrayIP4Adress addObject:[self IP4addresses]];
    }
    return arrayIP4Adress;
    
}
- (NSString *)IP4addresses{
    return [self randomIPString];
}

- (NSString *)randomIPString{
    
    NSString *IP =[NSString stringWithFormat:@"%@-%@-%@-%@",[self randomString],[self randomString],[self randomString],[self randomString]];
    return IP;
}

- (NSString *)randomString{
    return [NSString stringWithFormat:@"%d",arc4random() % 255];
}

@end
