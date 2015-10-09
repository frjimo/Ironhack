//
//  NSDate+DFFormatter.h
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 8/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DFFormatter)

- (NSDate *)parseDateWithString:(NSString *)date usingFormat:(NSString *)formatString;

- (NSDate *)parseModifiedCreatedDateAsString:(NSString *)date;
- (NSDate *)parseOriginatedDateAsString:(NSString *)date;

@end
