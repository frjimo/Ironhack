//
//  StubFileUtil.m
//  BeautifulRadars
//
//  Created by Diego Freniche Brito on 7/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "StubFileUtil.h"

@implementation StubFileUtil


+ (NSString *)loadStubFileNamed:(NSString *)stubFileName {
    NSBundle *bundle = [NSBundle bundleForClass:self];
    NSString *filePath = [bundle pathForResource:stubFileName ofType:@"json"];
    NSString *stub = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filePath] encoding:NSUTF8StringEncoding];
    
    return stub;
}

@end
