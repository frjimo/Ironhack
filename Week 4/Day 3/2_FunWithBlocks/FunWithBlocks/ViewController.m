//
//  ViewController.m
//  FunWithBlocks
//
//  Created by Joan Romano on 9/29/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "ViewController.h"

typedef void (^ImageBlock) (UIImage *);
typedef void (^TransformBlock) ();

@interface ViewController ()

@property (nonatomic, strong) UIImageView *wallpaperView;
@property (nonatomic, copy) NSArray *wallpapers;
@property (nonatomic) NSInteger lastWallpaperIndex;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.wallpaperView = [[UIImageView alloc] initWithImage:nil];
    self.wallpaperView.frame = self.view.bounds;
    self.wallpaperView.contentMode = UIViewContentModeScaleAspectFit;
    //self.wallpaperView.contentMode = UIViewContentModeCenter;
    
    [self.view addSubview:self.wallpaperView];
    
    self.wallpapers = @[@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"6.jpg", @"7.jpg"];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadWallpaper)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    
    [self loadWallpaper];
}

- (void)loadWallpaper
{
    self.lastWallpaperIndex += 1;
    if (self.lastWallpaperIndex >= self.wallpapers.count){
        self.lastWallpaperIndex = 0;
    }
//    NSString *imageName = self.wallpapers[self.lastWallpaperIndex];
//    UIImage *image = [UIImage imageNamed:imageName];
//    self.wallpaperView.image = image;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.wallpaperView.alpha = 0;
    }];
    
    //Paso 5
    [self fetchImageWithIndex:self.lastWallpaperIndex block:^(UIImage * image) {
        self.wallpaperView.image = image;
        [UIView animateWithDuration:0.5 animations:^{
            self.wallpaperView.alpha = 1;
        }];
    }];
    
    [self bounceImage];
    
    
    
    
}

- (void)fetchImageWithIndex:(NSInteger)index block:(ImageBlock)block{
    NSString *imageName = self.wallpapers[index];
    UIImage *image = [UIImage imageNamed:imageName];
    //block(image);
    
    [self scaleImageWithImage:image witdh:200.0 block:block];
}



- (void)scaleImageWithImage:(UIImage *)image witdh:(CGFloat)witdh block:(ImageBlock)block{
    CGFloat height = witdh / image.size.width * image.size.height;
    CGSize newSize = CGSizeMake(witdh, height);
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, witdh, height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    block(newImage);
    
}

- (void)bounceImage {
//    CGFloat duration = 0.25;
//    [UIView animateWithDuration:duration animations:^{
//        self.wallpaperView.transform = CGAffineTransformMakeScale(1.1, 1.1);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:duration animations:^{
//            self.wallpaperView.transform = CGAffineTransformMakeScale(0.9, 0.9);
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:duration animations:^{
//            self.wallpaperView.transform = CGAffineTransformMakeScale(1, 1);
//            }];
//        }];
//    }];
    
    [self scaleImageTo:1.1 completion:^(void){
        [self scaleImageTo:0.9 completion:^{
            [self scaleImageTo:1.0 completion:nil];
        }];
    }];
    
}


- (void)scaleImageTo:(CGFloat)scale completion:(TransformBlock)completion {
    CGFloat duration = 0.25f;
    [UIView animateWithDuration:duration animations:^{
        self.wallpaperView.transform = CGAffineTransformMakeScale(scale, scale);
    } completion:^(BOOL finished) {
        if (completion){
            completion();
        }
    }];
}



@end
