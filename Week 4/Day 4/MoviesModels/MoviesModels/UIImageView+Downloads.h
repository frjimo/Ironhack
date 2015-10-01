//
//  UIImageView+Downloads.h
//  MoviesModels
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Downloads)

- (void)setImageWithURL:(NSURL *)imageURL completion:(void (^)(BOOL succes))completion;

@end
