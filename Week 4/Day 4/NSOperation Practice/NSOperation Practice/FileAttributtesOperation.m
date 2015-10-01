//
//  FileAttributtesOperation.m
//  NSOperation Practice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "FileAttributtesOperation.h"

@interface FileAttributtesOperation ()

@property (nonatomic, copy) NSString *path;

@end

@implementation FileAttributtesOperation

-(instancetype)initWithPath:(NSString *)path{
    if (self = [super init]){
        _path = [path copy];
    }
    return self;
}

- (void)main {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    for(NSInteger i = 0; i< 5; i++){
        if (self.cancelled){
            return;
        }
        NSLog(@"Sleep%d",i);
        sleep(1);
    }
    
    if (self.cancelled){
        return;
    }
    
    NSDictionary *attributes = [fileManager attributesOfItemAtPath:self.path error:nil];
    NSLog(@"%@",attributes);
}

@end
