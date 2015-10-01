//
//  ViewController.m
//  NSOperation Practice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import "FileAttributtesOperation.h"
#import "DowloadingImageOperations.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)  NSOperationQueue *backgroundOperationQueue;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backgroundOperationQueue=[[NSOperationQueue alloc]init];
}

- (IBAction)goButtonPressed:(id)sender {
    
    self.imageView.image = nil;
    self.cancelButton.enabled = YES;
    self.goButton.enabled = NO;
    
    DowloadingImageOperations *downloadImageOperation = [[DowloadingImageOperations alloc] initWithImageCompletionBlock:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
    FileAttributtesOperation *operation = [[FileAttributtesOperation alloc]initWithPath:@"/"];
    
    [downloadImageOperation setCompletionBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cancelButton.enabled = NO;
            self.goButton.enabled = YES;
        });
    }];
    
    [downloadImageOperation addDependency:operation];
    
    [self.backgroundOperationQueue addOperation:operation];
    [self.backgroundOperationQueue addOperation:downloadImageOperation];
    
}
- (IBAction)CancelButtonPressed:(id)sender {
    [self.backgroundOperationQueue cancelAllOperations];
}

@end
