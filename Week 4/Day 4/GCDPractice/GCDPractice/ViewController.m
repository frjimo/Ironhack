//
//  ViewController.m
//  GCDPractice
//
//  Created by Fran on 1/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import "FotosManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FotosManager *fotoManager = [FotosManager sharedInstance];
    
    dispatch_queue_t ImageQueue=dispatch_queue_create("Image Queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(ImageQueue, ^{
    
        NSString *image1String = @"http://viajes.101lugaresincreibles.com/wp-content/uploads/2012/03/argonath.jpg";
        NSURL *image1Url = [NSURL URLWithString:image1String];
        
        NSString *image2String = @"http://viajes.101lugaresincreibles.com/wp-content/uploads/2012/03/Mordor.jpg";
        NSURL *image2Url = [NSURL URLWithString:image2String];
        
        NSString *image3String = @"https://tailandiasinplaya.files.wordpress.com/2012/10/rivendel.jpeg";
        NSURL *image3Url = [NSURL URLWithString:image3String];
        
        NSString *image4String = @"http://maxcdn.thedesigninspiration.com/wp-content/uploads/2009/12/ksenia/Ksenia-Scenery-01.jpg";
        NSURL *image4Url = [NSURL URLWithString:image4String];
        
        NSArray *arrayURL = [NSArray arrayWithObjects:image1Url, image2Url, image3Url, image4Url, nil];
        for(int i = 0; i < arrayURL.count; i++){
            [fotoManager downloadImageWithURL:[arrayURL objectAtIndex:i] completion:^(UIImage * image){
                //NSString *imageView = [NSString stringWithFormat:@"imageView%d",i];
                switch (i) {
                    case 0:
                        [self.imageView1 setImage:image];
                        break;
                    case 1:
                        [self.imageView2 setImage:image];
                        break;
                    case 2:
                        [self.imageView3 setImage:image];
                        break;
                    case 3:
                        [self.imageView4 setImage:image];
                        break;
                    default:
                        break;
                }
            }];
        }
    });
    
    
 
    

    
}


@end
