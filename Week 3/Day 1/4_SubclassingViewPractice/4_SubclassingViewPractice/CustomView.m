//
//  CustomView.m
//  4_SubclassingViewPractice
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

//@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation CustomView

- (instancetype)init {
    return [self initWithFrame:CGRectZero title:nil];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame title:nil];
}


//- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
//    self = [super initWithFrame:frame];
//    if (self) {
//        _title = title;
////        _titleLabel.textAlignment = NSTextAlignmentCenter;
//    }
//
//    return self;
//    
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect labelFrame;
    labelFrame.size = [self.titleLabel sizeThatFits:self.bounds.size];
    //labelFrame.origin = CGPointMake((self.frame.size.width / 2) - (labelFrame.size.width / 2), 40);
    labelFrame.origin = CGPointMake(CGRectGetMidX(self.frame) - (labelFrame.size.width / 2), 40);
    
    self.titleLabel.frame = labelFrame;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        self.title = title;
        [self addSubview:_titleLabel];
    }
    return self;
}


- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.frame.size.width, 40)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


@end
