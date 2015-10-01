//
//  UIAlertAction+UIAlertView_Block.h
//  MoviesModels
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DismissBlock)(NSInteger buttonIndex);
typedef void (^CancelBlock)();

@interface UIAlertAction (UIAlertView_Block) <UIAlertViewDelegate>

+ (UIAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtons onDismiss:(DismissBlock)dismissed onCancel:(CancelBlock)canncelled;

@end
