//
//  BokehScene.m
//  MemeRastreator
//
//  Created by Fran on 15/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "BokehScene.h"

@implementation BokehScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.backgroundColor = [SKColor blackColor];
        
        NSString *emitterPath = [[NSBundle mainBundle]pathForResource:@"Bokeh" ofType:@"sks"];
        
        SKEmitterNode *node = [NSKeyedUnarchiver unarchiveObjectWithFile:emitterPath];
        
        node.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        node.name = @"particleBokeh";
        node.targetNode= self.scene;
        [self addChild:node];
    }
    return self;
}

@end
