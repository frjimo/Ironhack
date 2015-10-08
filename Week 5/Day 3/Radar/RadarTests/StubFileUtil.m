//
//  StubFileUtil.m
//  Radar
//
//  Created by Fran on 7/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "StubFileUtil.h"

@implementation StubFileUtil

+ (NSString *)loadStubFileName:(NSString *)stubFileName {
    NSBundle *bundle = [NSBundle bundleForClass:[StubFileUtil class]];
    NSString *filePath = [bundle pathForResource:@"OneRadarResultStub" ofType:@"json"];
    NSString *stub = [[NSString alloc]initWithData:[NSData dataWithContentsOfFile: filePath] encoding:NSUTF8StringEncoding];
    
    return stub;
}

@end
