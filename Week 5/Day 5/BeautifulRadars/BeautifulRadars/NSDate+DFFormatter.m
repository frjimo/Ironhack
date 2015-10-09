//
//  NSDate+DFFormatter.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "NSDate+DFFormatter.h"

@implementation NSDate (DFFormatter)

- (NSDate *)parseDateWithString:(NSString *)date usingFormat:(NSString *)formatString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    [format setDateFormat:formatString];
    return [format dateFromString:date];
}

- (NSDate *)parseOriginatedDateAsString:(NSString *)date{
    return [self parseDateWithString:date usingFormat:@"dd-MMM-yyyy hh:mm a"];
}

- (NSDate *)parseModifiedCreatedDateAsString:(NSString *)date{
    return [self parseDateWithString:date usingFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSSSSSS"];
}


@end
