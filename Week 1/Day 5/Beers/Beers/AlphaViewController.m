//
//  ViewController.m
//  Beers
//
//  Created by Fran on 11/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "AlphaViewController.h"


static BOOL changePicture;

@interface AlphaViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *dataImage;


@end

@implementation AlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    changePicture = false;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBAction

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = (UISlider *)sender;
    
    self.image.alpha = slider.value;
    //Mensaje
    //[self.image setAlpha:slider.value];
}

- (IBAction)buttonPressed:(id)sender {
    
    if(changePicture ==false ){
        self.image.image = [UIImage imageNamed:@"lolazo.jpg"];
        changePicture = true;
    }else{
        self.image.image = [UIImage imageNamed:@"beers.jpeg"];
        changePicture = false;
    }
}

- (IBAction)buttonDownload:(id)sender {
    NSString *link = @"http://diyfather.com/wp-content/uploads/darth-vader-cat1.jpg";
    NSURL *url = [NSURL URLWithString:link];
    //NSData *binario = [NSData dataWithContentsOfURL:url];
    //self.dataImage.image = [UIImage imageWithData:binario];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        self.dataImage.image = [UIImage imageWithData:data];
    }];
    
//    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue new] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            self.dataImage.image = [UIImage imageWithData:data];
//        }];
//    }];
}

@end
