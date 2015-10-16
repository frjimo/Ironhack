//
//  ViewController.m
//  InstrumentsExample
//
//  Created by Diego Freniche Brito on 30/01/13.
//  Copyright (c) 2013 Diego Freniche Brito. All rights reserved.
//

#import "ViewController.h"
#import "LeakViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *list;

@property (nonatomic, strong) NSMutableArray *selfPointer;

@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (IBAction)eatMemory:(id)sender {
    
    for (int i=0; i< 400; i++) {
        
        NSString* myImage = [[NSBundle mainBundle] pathForResource:@"amiga-boing-ball" ofType:@"png"];
        
        NSString* myImage2 = [[NSBundle mainBundle] pathForResource:@"LP0JPR1" ofType:@"gif"];
        
        // UIImage *logo = [UIImage imageWithContentsOfFile:myImage];
        NSData *data = [NSData dataWithContentsOfFile:myImage];
        UIImage *logo = [UIImage imageWithData:data];
        NSData *data2 = [NSData dataWithContentsOfFile:myImage2];
        UIImage *logo2 = [UIImage imageWithData:data2];

        
        [self.list addObject:logo];
        [self.list addObject:logo2];
    }
    
}

- (IBAction)leakMemory:(id)sender {
    NSMutableArray *leaker = [[NSMutableArray alloc] init];
    
    for (int i=0; i< 300; i++) {
        
        NSString* myImage = [[NSBundle mainBundle] pathForResource:@"amiga-boing-ball" ofType:@"png"];
        UIImage *logo = [UIImage imageWithContentsOfFile:myImage];
        [leaker addObject:logo];
    }
    
    __weak NSArray *disaster = leaker;
    leaker = nil;
    
    
    LeakViewController *vc = [[LeakViewController alloc] init];
    self.button = vc.closeButton;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
     self.list = [[NSMutableArray alloc] init];
    
    self.selfPointer = [[NSMutableArray alloc] init];
    [self.selfPointer addObject:self];
    [self.selfPointer addObject:self.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"😱😱");
    self.list = [[NSMutableArray alloc] init];
    // Dispose of any resources that can be recreated.
}

@end
