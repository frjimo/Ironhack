//
//  ViewController.m
//  MemeRastreator
//
//  Created by Fran on 15/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import "Memes.h"
#import "BokehScene.h"
#import "CCColorCube.h"

@interface ViewController ()

@property (nonatomic, strong) Memes *memes;
@property (weak, nonatomic) IBOutlet UIImageView *lblImage;
@property (weak, nonatomic) IBOutlet SKView *scene;
@property (nonatomic, strong) BokehScene *bs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.memes = [[Memes alloc] initWithPlistFileName:@"memes"];
    
    self.bs = [BokehScene sceneWithSize:self.scene.bounds.size];
    self.bs.scaleMode = SKSceneScaleModeAspectFill;
    
    [self.scene presentScene:self.bs];
    
}

- (void)downloadMeme:(Meme *)meme {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:meme.url];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        UIImage *image =[UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        
        CCColorCube *colorCube = [[CCColorCube alloc] init];
        
        NSArray *imgColors = [colorCube extractBrightColorsFromImage:image avoidColor:[UIColor blackColor] count:4];
        SKEmitterNode *node = (SKEmitterNode *)[self.bs childNodeWithName:@"particleBokeh"];
        node.particleColor = imgColors[imgColors.count -1];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.lblImage.image = image;
        });
    
    }];
    
    [task resume];
}

- (IBAction)newMeme:(id)sender {
    [self downloadMeme:[self.memes randomElement]];
}



@end
