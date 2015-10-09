//
//  FileUtils.m
//  CoreDataHelloWorld
//
//  Created by Diego Freniche Brito on 5/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils

+ (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
