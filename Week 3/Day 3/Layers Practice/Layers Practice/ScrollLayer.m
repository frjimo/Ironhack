//
//  ScrollLayer.m
//  Layers Practice
//
//  Created by Fran on 23/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ScrollLayer.h"

@interface ScrollLayer ()

@property  (nonatomic, strong) UIImageView *imageView;

@end


@implementation ScrollLayer


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height+100);
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.imageView.image = [UIImage imageNamed:@"Abomi"];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        CAScrollLayer *layer = (CAScrollLayer*)self.layer;
        layer.scrollMode = kCAScrollVertically;
        
        [self addSubview:self.imageView];
    }
    
    
    return self;
}

+(Class)layerClass{
    return [CAScrollLayer class];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    CGPoint destination = CGPointMake(location.x - (self.bounds.size.width/2), location.y - (self.bounds.size.height/2));
    
    [UIView animateWithDuration:2 animations:^{
        CAScrollLayer *layer = (CAScrollLayer *)self.layer;
        [layer scrollToPoint:destination];
    }];
}

@end
