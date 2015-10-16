//
//  LeakViewController.m
//  InstrumentsExample
//
//  Created by Diego Freniche Brito on 15/10/15.
//  Copyright © 2015 Diego Freniche Brito. All rights reserved.
//

#import "LeakViewController.h"

@interface LeakViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(viewDidLoad) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
