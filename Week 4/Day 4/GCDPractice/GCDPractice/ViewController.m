//
//  ViewController.m
//  GCDPractice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t ImageQueue=dispatch_queue_create("Image Queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(ImageQueue, ^{
    
        NSString *image1String = @"http://viajes.101lugaresincreibles.com/wp-content/uploads/2012/03/argonath.jpg";
        NSURL *image1Url = [NSURL URLWithString:image1String];
        NSData *imageData1 = [NSData dataWithContentsOfURL:image1Url];
        UIImage *image1 = [UIImage imageWithData:imageData1];
        
        NSString *image2String = @"http://viajes.101lugaresincreibles.com/wp-content/uploads/2012/03/Mordor.jpg";
        NSURL *image2Url = [NSURL URLWithString:image2String];
        NSData *imageData2 = [NSData dataWithContentsOfURL:image2Url];
        UIImage *image2 = [UIImage imageWithData:imageData2];
        
        NSString *image3String = @"https://tailandiasinplaya.files.wordpress.com/2012/10/rivendel.jpeg";
        NSURL *image3Url = [NSURL URLWithString:image3String];
        NSData *imageData3 = [NSData dataWithContentsOfURL:image3Url];
        UIImage *image3 = [UIImage imageWithData:imageData3];
        
        NSString *image4String = @"http://maxcdn.thedesigninspiration.com/wp-content/uploads/2009/12/ksenia/Ksenia-Scenery-01.jpg";
        NSURL *image4Url = [NSURL URLWithString:image4String];
        NSData *imageData4 = [NSData dataWithContentsOfURL:image4Url];
        UIImage *image4 = [UIImage imageWithData:imageData4];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //    self.imageView1.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:image1Url]];
            //    self.imageView2.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:image2Url]];
            //    self.imageView3.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:image3Url]];
            //    self.imageView4.image = [UIImag  imageWithData:[NSData dataWithContentsOfURL:image4Url]];
            [self.imageView1 setImage:image1];
            [self.imageView2 setImage:image2];
            [self.imageView3 setImage:image3];
            [self.imageView4 setImage:image4];
            
//            self.imageView1.image = image1;
//            self.imageView2.image = image2;
//            self.imageView3.image = image3;
//            self.imageView4.image = image4;
        });
        
    });
    
    
 
    

    
}


@end
