//
//  CustomView.h
//  4_SubclassingViewPractice
//
//  Created by Fran on 21/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView

@property (strong, nonatomic) NSString *title;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title NS_DESIGNATED_INITIALIZER;

@end
