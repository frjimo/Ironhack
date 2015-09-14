//
//  EuroConverterViewController.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "EuroConverterViewController.h"

@interface EuroConverterViewController ()

@end

@implementation EuroConverterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)converted:(id)sender {
    
    CGFloat textFieldValue = [self.textField.text floatValue];
    int result = [EuroConverter convertFromEuroToPeseta:textFieldValue];
    
    

    self.textField.text = [NSString stringWithFormat:@"%d",result];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
