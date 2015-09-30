//
//  BlockButtonItem.h
//  MoviesModels
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^barButtonItemBlock) ();

@interface BlockButtonItem : UIBarButtonItem

- (instancetype)initWithTitle:(NSString *)title customBlock:()block;

@end
