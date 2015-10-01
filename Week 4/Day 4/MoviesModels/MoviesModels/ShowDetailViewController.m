//
//  ShowDetailViewController.m
//  MoviesModels
//
//  Created by Joan Romano on 9/29/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "ShowDetailViewController.h"

#import "BlockButtonItem.h"
#import "UIAlertView+Block.h"
#import "Show.h"

@interface ShowDetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *detailLabel;
@property (nonatomic, weak) IBOutlet UIImageView *detailImageView;

@end

@implementation ShowDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailLabel.text = self.show.showDescription;
    self.detailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.show.posterURL]];
    
    self.navigationItem.rightBarButtonItem = [[BlockButtonItem alloc] initWithTitle:@"Like" block:^{
        
        [[UIAlertView alertViewWithTitle:@"Liked!" message:@"Show liked" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Whatever"] onDismiss:^(NSInteger buttonIndex) {
            
            NSLog(@"Dismissed index %@", @(buttonIndex));
            
        } onCancel:^{
            
            NSLog(@"Cancelled");
        }] show];

        
    }];
}

@end
