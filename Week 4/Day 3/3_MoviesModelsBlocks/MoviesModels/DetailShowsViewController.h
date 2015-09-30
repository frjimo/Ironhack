//
//  DetailShowsViewController.h
//  MoviesModels
//
//  Created by Fran on 30/9/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"

@interface DetailShowsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelDetail;

@property (nonatomic, strong) Show *show;

@end
