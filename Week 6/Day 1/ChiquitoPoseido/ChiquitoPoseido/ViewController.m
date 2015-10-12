//
//  ViewController.m
//  ChiquitoPoseido
//
//  Created by Fran on 12/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>
#import "SoundEffect.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, SoundEffectDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) BOOL newImage;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) BOOL onOff;
@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, strong) SoundEffect *soundEffect;
@property (nonatomic) BOOL canPlay;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;


@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateChanged) name:UIDeviceProximityStateDidChangeNotification object:nil];
    
    [self batteryLevel];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSLog(@"📷");
    }
    else{
        NSLog(@"😱");
    }
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.soundEffect = [[SoundEffect alloc] init];
    self.soundEffect.delegate = self;
    
    if (self.motionManager.accelerometerAvailable) {
        
        self.motionManager.accelerometerUpdateInterval = .2;
        self.motionManager.gyroUpdateInterval = .2;
        
        __weak ViewController *weakself = self;
        self.canPlay = YES;
        
        [self.motionManager
         startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
         withHandler:^(CMAccelerometerData *accelerometerData, NSError *error){
             
             NSLog(@"x:%02.02g y:%02.02g z:%02.02g ",accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z);
                 if (accelerometerData.acceleration.x > 0.95) {
                     if(weakself.canPlay){
                         weakself.canPlay = NO;
                         [weakself.soundEffect play:@"Ataque"];
                     }
                 }
                 if (accelerometerData.acceleration.y > 0.95) {
                     if(weakself.canPlay){
                         weakself.canPlay = NO;
                         [weakself.soundEffect play:@"Nopuedo"];
                     }
                 }
                 if(accelerometerData.acceleration.z > 0.95) {
                     if(weakself.canPlay){
                         weakself.canPlay = NO;
                         [weakself.soundEffect play:@"Jandemor"];
                     }
                 }
         }];
    }
    
}

- (void)proximityStateChanged {
    
    //Se esta alejando.
    if([UIDevice currentDevice].proximityState == YES){
    [self.soundEffect play:@"Nopuedo"];
    }
}

- (void)batteryLevel {
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    if (batteryLevel < 0.0) {
        // -1.0 means battery state is UIDeviceBatteryStateUnknown
        self.levelLabel.text = NSLocalizedString(@"Unknown", @"");
    }
    else {
        static NSNumberFormatter *numberFormatter = nil;
        if (numberFormatter == nil) {
            numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterPercentStyle];
            [numberFormatter setMaximumFractionDigits:1];
        }
        NSNumber *levelObj = [NSNumber numberWithFloat:batteryLevel];
        self.levelLabel.text = [numberFormatter stringFromNumber:levelObj];
    }
}

- (void)soundEffectDidFinishPlaying:(SoundEffect *)soundEffect{
    self.canPlay = YES;
}

- (IBAction)partyJarl:(id)sender {
    static BOOL timerScheduled = NO;
    if (timerScheduled) {
        [[self timer] invalidate];
        self.timer = nil;
    }else{
        //CADisplayLink
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self selector:@selector(flashLight)
                                                    userInfo:nil repeats:YES];
    }
    timerScheduled = !timerScheduled;
}


-(void)flashLight {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchMode: self.onOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
    [device unlockForConfiguration];
    self.onOff = !self.onOff;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.imageView.image = image;
//        if (self.newImage){
//            //UIImageWriteToSavedPhotosAlbum(image,
//                                           self,
//                                           @selector(image:finishedSavingWithError:contextInfo:),
//                                           nil);
        //}
    }
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        //self.imageView.image = nil;
        [self downloadImage];
    }
}

- (void)downloadImage{
    dispatch_queue_t download_queue;
    
    download_queue = dispatch_queue_create("adf", DISPATCH_QUEUE_CONCURRENT);
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    //[self performSelectorInBackground:@selector(paintImagePerform) withObject:nil];
    
    dispatch_async(download_queue, ^{
        NSURL *url = [NSURL URLWithString:@"http://los40es00.epimg.net/los40/imagenes/2014/05/28/tecnologia/1401271581_779094_1401273227_sumario_normal.jpg"];
        NSData *dataImage = [NSData dataWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc]initWithData:dataImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image =image;
        });
    });
    
}

- (void)paintImagePerform{
    NSURL *url = [NSURL URLWithString:@"http://los40es00.epimg.net/los40/imagenes/2014/05/28/tecnologia/1401271581_779094_1401273227_sumario_normal.jpg"];
    NSData *dataImage = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:dataImage];
    [self performSelectorOnMainThread:@selector(paintImagePerform:) withObject:image waitUntilDone:NO];
}

- (void)paintImagePerform:(UIImage *)image {
    self.imageView.image =image;
}

- (IBAction)chooseImageView:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (IBAction)takePhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


@end
