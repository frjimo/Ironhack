//
//  ViewController.m
//  Paging
//
//  Created by Fran on 16/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *imagesArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpScrollView {
    UIImage *alhambra = [UIImage imageNamed:@"alhambra"];
    UIImage *estrella = [UIImage imageNamed:@"estrella_galicia"];
    UIImage *guinness = [UIImage imageNamed:@"guinness"];
    UIImage *mahou = [UIImage imageNamed:@"mahou"];
    UIImage *sierraNevada = [UIImage imageNamed:@"sierra_nevada"];
    
    self.imagesArray = @[mahou, estrella, alhambra, guinness, sierraNevada];
    
    
    CGFloat x0ffset = 0;
    for (UIImage *image in self.imagesArray){
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = CGRectMake(x0ffset, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        imageView.clipsToBounds = YES;
        
        [self.scrollView addSubview:imageView];
        
        x0ffset = x0ffset + self.scrollView.frame.size.width;
    }
    
    self.scrollView.contentSize = CGSizeMake(x0ffset, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
