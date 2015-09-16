//
//  MyScrollViewController.m
//  ScrollView
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "MyScrollViewController.h"

@interface  MyScrollViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) UILabel * label1;
@property (strong, nonatomic) UILabel * label2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *dragging;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *decelerating;

//@property (weak, nonatomic)

@end

@implementation MyScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 200, 40)];
    self.label1.text = @"Label1";
    [self.myScrollView addSubview:self.label1];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 900, 200, 40)];
    self.label2.text = @"Label2";
    [self.myScrollView addSubview:self.label2];
    
    self.myScrollView.contentSize  = CGSizeMake (self.view.frame.size.width, self.label2.frame.origin.y + self.label2.frame.size.height);
    
    [self configureLabels];
    
    // Do any additional setup after loading the view.
}

- (void)configureLabels {
    self.myScrollView.delegate = self;
    [self.navigationController setToolbarHidden:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.decelerating.tintColor = [UIColor redColor];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.dragging.tintColor = [UIColor redColor];
    self.decelerating.tintColor = decelerate ? [UIColor greenColor] : [UIColor redColor];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView  {
    self.dragging.tintColor = [UIColor greenColor];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    self.decelerating.tintColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goFirstPressed:(UIBarButtonItem *)sender {
    [self.myScrollView scrollRectToVisible:self.label1.frame animated:YES];
}

- (IBAction)goSecondPressed:(id)sender {
    [self.myScrollView scrollRectToVisible:self.label2.frame animated:NO];
}

@end
