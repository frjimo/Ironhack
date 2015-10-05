//
//  DetailViewController.h
//  CoreDataHelloWorld
//
//  Created by Fran on 5/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

