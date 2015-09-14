//
//  ViewController.m
//  Game of Thrones App
//
//  Created by Fran on 14/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "AddCharacterViewController.h"
#import "PresentedViewController.h"

typedef NS_ENUM(NSUInteger, Evilness) {
    EvilnessGood,
    EvilnessBad,
    EvilnessVeryBad,
    EvilnessTrueEvil
};

static NSUInteger const padding = 8;
static NSUInteger const margin = 10;
static NSUInteger const heightUnit = 40;
static NSUInteger const initialUpperMargin = 40;

@interface AddCharacterViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) UITextField *nameTextField;
@property (strong, nonatomic) UITextView *biographyTextView;
@property (assign, nonatomic) CGSize screenSize;

@property (strong, nonatomic) UISegmentedControl *houseSegmentedControl;
@property (strong, nonatomic) UIButton *addCharacterButton;

@property (strong, nonatomic) UISlider *evilnessSlider;
@property (strong, nonatomic) UISwitch *killSwitch;
@property (strong, nonatomic) UILabel *killLabel;


@end

@implementation AddCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.screenSize = self.view.frame.size;
    
    [self drawControlls];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)drawControlls {
    [self drawName];
    
    [self drawBiography];
    
    [self drawHouseSegmentedControl];
    
    [self drawEvilnessSlider];
    
    [self drawKillSwitch];
    
    [self drawAddCharacterButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawName {
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"Nombre";
    [self placeView:nameLabel underView:nil withHeightUnits:1];
    
    self.nameTextField = [UITextField new];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.delegate = self;
    //[self addImageNamed:@"stark" toTextFieldLeftImage: self.nameTextField];
    [self addEvilness:EvilnessGood toTextFieldRightImage:self.nameTextField];
    [self placeView:self.nameTextField underView:nameLabel withHeightUnits:1];
}

- (void)addImageNamed:(NSString *)imageName toTextFieldLeftImage:(UITextField *)textField {
    UIImageView  *houseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    houseImageView.image = [UIImage imageNamed:imageName];
    
    textField.leftView = houseImageView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
}

- (void)drawBiography{
    
    UILabel *biographyLabel = [[UILabel alloc] init];
    biographyLabel.text = @"Biografía";
    [self placeView:biographyLabel underView:self.nameTextField withHeightUnits:1];
    self.biographyTextView = [[UITextView alloc] init];
    
    [self showBiographyPlaceHolder];
    self.biographyTextView.delegate = self;
    
    [self placeView:self.biographyTextView underView:biographyLabel withHeightUnits:3];
    
}

- (void) showBiographyPlaceHolder {
    self.biographyTextView.text =@"Escribe la biografia del personaje...";
    self.biographyTextView.textColor = [UIColor lightGrayColor];
    self.biographyTextView.tag = 0;
    
    self.biographyTextView.layer.borderWidth = 5.0f;
    self.biographyTextView.layer.borderColor = [[UIColor grayColor] CGColor];
}

- (void)drawHouseSegmentedControl {
    self.houseSegmentedControl =[[UISegmentedControl alloc] initWithItems:@[@"Stark",@"Lannister",@"Targaryen",@"Baratheon",@"Tully"]];
    [self.houseSegmentedControl addTarget:self action:@selector(houseSelected:) forControlEvents:UIControlEventValueChanged];
    [self placeView:self.houseSegmentedControl underView:self.biographyTextView withHeightUnits:1];
}

- (void) houseSelected:(UISegmentedControl *)segmentedControl {
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self addImageNamed:@"stark" toTextFieldLeftImage:self.nameTextField];
            break;
        case 1:
            [self addImageNamed:@"lannister" toTextFieldLeftImage:self.nameTextField];
            break;
        case 2:
            [self addImageNamed:@"targaryen" toTextFieldLeftImage:self.nameTextField];
            break;
        case 3:
            [self addImageNamed:@"baratheon" toTextFieldLeftImage:self.nameTextField];
            break;
        case 4:
            [self addImageNamed:@"tully" toTextFieldLeftImage:self.nameTextField];
            break;
        default:
            break;
    }
}

- (void)addEvilness:(Evilness)evilness toTextFieldRightImage:(UITextField *)textField {
    UILabel *evilnessLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    switch (evilness) {
        case EvilnessGood:
            evilnessLabel.text = @"😊"; //Cmd, ctrl, espacio
            break;
        case EvilnessBad:
            evilnessLabel.text = @"😠";
            break;
        case EvilnessVeryBad:
            evilnessLabel.text = @"😡";
            break;
        case EvilnessTrueEvil:
            evilnessLabel.text = @"👿";
            break;
        default:
            break;
    }
    textField.rightView = evilnessLabel;
    textField.rightViewMode = UITextFieldViewModeAlways;
}

- (void) drawAddCharacterButton {
    self.addCharacterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addCharacterButton setTitle:@"Añadir" forState:UIControlStateNormal];
    //[self placeView:self.addCharacterButton underView:self.evilnessSlider withHeightUnits:1];
    [self placeView:self.addCharacterButton underView:self.killSwitch.superview withHeightUnits:1];
    [self.addCharacterButton addTarget:self action:@selector(presentNextViewController) forControlEvents:UIControlEventTouchUpInside];
    
}


//-----------------------------------------------------------------------------------------------

- (void)presentNextViewController {
    PresentedViewController *presentedViewController = [[PresentedViewController alloc] init];
    presentedViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:presentedViewController animated:YES completion:^{
        
    }];
}


//-----------------------------------------------------------------------------------------------


- (void) drawEvilnessSlider {
    UILabel *evilnessLabel = [[UILabel alloc] init];
    evilnessLabel.text = @"Maldad";
    [self placeView:evilnessLabel underView:self.houseSegmentedControl withHeightUnits:1];
    
    self.evilnessSlider = [UISlider new];
    self.evilnessSlider.minimumValue = 0;
    self.evilnessSlider.maximumValue = 100;
    self.evilnessSlider.minimumTrackTintColor = [UIColor redColor];
    self.evilnessSlider.maximumTrackTintColor = [UIColor greenColor];
    
    
    [self. evilnessSlider addTarget:self action:@selector(evilnessChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self placeView:self.evilnessSlider underView:evilnessLabel withHeightUnits:1];
}

#pragma mark - Slider target-action

- (void)evilnessChanged:(UISlider *)slider {
    
//    NSUInteger evilnessValue = slider.value;
//    if(slider.value >= 0 && slider.value < 25) {
//        [self addEvilness:EvilnessGood toTextFieldRightImage:self.nameTextField];
//    }else if (evilnessValue >= 25 && evilnessValue < 50){
//        [self addEvilness:EvilnessBad toTextFieldRightImage:self.nameTextField];
//    }else if (evilnessValue >= 50 && evilnessValue < 75){
//        [self addEvilness:EvilnessVeryBad toTextFieldRightImage:self.nameTextField];
//    }else{
//        [self addEvilness:EvilnessTrueEvil toTextFieldRightImage:self.nameTextField];
//    }
    

    
    Evilness evilness = (NSUInteger) self.evilnessSlider.value * (EvilnessTrueEvil / self.evilnessSlider.maximumValue);
    [self addEvilness:evilness toTextFieldRightImage:self.nameTextField];
}

//-----------------------------------------------------------------------------------------------


#pragma mark - Switch target-action

- (void)drawKillSwitch {
    UIView *killView = [UIView new];
    [self placeView:killView underView:self.evilnessSlider withHeightUnits:1];
    
    self.killSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [killView addSubview:self.killSwitch];
    
    CGFloat labelX = self.killSwitch.frame.origin.x + self.killSwitch.frame.size.width +padding;
    CGFloat labelWidth = killView.frame.size.width - self.killSwitch.frame.size.width - padding;
    self.killLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, self.killSwitch.frame.origin.y, labelWidth, self.killSwitch.frame.size.height)];
    
    self.killLabel.text = @"Vivo";
    [killView addSubview:self.killLabel];
    
    [self.killSwitch addTarget:self action:@selector(killChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void) killChanged:(UISwitch *)killSwitch {
    [self drawDeadOrAlive];
//    self.killLabel.text = killSwitch.on ? @"Dead" : @"Alive";
//    self.killLabel.textColor = killSwitch.on ? [UIColor redColor] : [UIColor blackColor];
}

- (void) drawDeadOrAlive {
    if(self.killSwitch.on){
        self.killLabel.text = @"Muerto";
        self.killLabel.textColor = [UIColor redColor];
    }
    else {
        self.killLabel.text = @"Vivo";
        self.killLabel.textColor = [UIColor blackColor];
    }
}





//-----------------------------------------------------------------------------------------------

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//-----------------------------------------------------------------------------------------------

#pragma mark - TextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView {
    if(textView == self.biographyTextView && textView.tag == 0) {
        textView.text =@"";
        textView.textColor = [UIColor blackColor];
        textView.tag = 1;
    }
}


-(void)textViewDidEndEditing:(UITextView *)textView {
    if(textView == self.biographyTextView && [textView.text length] == 0) {
        [self showBiographyPlaceHolder];
    }
}

//-----------------------------------------------------------------------------------------------

#pragma mark - TextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == self.nameTextField) {
        NSString *nameString = textField.text;
        [self.addCharacterButton setTitle:[NSString stringWithFormat:@"Añadir a %@",nameString] forState:UIControlStateNormal];
    }
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

//-----------------------------------------------------------------------------------------------

#pragma mark - Controll Positioning

- (void)placeView:(UIView *)bottomView underView:(UIView *)upperView withHeightUnits:(CGFloat)heightUnits {
    if(!upperView){
        bottomView.frame = CGRectMake(padding, initialUpperMargin, self.screenSize.width -2 * padding, heightUnits * heightUnit);
    }
    else{
        bottomView.frame = [self frameUnderFrame:upperView.frame withHeightUnits:heightUnits];
    }

    [self.view addSubview:bottomView];
}


- (CGRect)frameUnderFrame:(CGRect)sourceFrame withHeightUnits:(CGFloat)heightUnits {
    CGFloat y = sourceFrame.origin.y + sourceFrame.size.height + margin;
    
    
    return CGRectMake(padding, y, self.screenSize.width - 2 * padding, heightUnit * heightUnits);
}

@end
