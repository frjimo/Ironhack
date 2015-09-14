//
//  EuroConverterViewController.h
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EuroConverter.h"

@interface EuroConverterViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *textField;

- (IBAction)converted:(id)sender;

@end