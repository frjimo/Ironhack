//
//  BlockButtonItem.m
//  MoviesModels
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "BlockButtonItem.h"

@interface BlockButtonItem ()

@property (nonatomic, strong) barButtonItemBlock block;

@end

@implementation BlockButtonItem

- (instancetype)initWithTitle:(NSString *)title customBlock:()block {
    if (self = [super initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed)]){
        self.block = block;
    }
    return self;
}

- (void)buttonPressed {
    self.block();
}

@end
