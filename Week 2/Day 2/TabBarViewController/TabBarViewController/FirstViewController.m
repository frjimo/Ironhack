//
//  FirstViewController.m
//  TabBarViewController
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *name;

@end

@implementation FirstViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self buildButton];
    
    [self buildTextfield];
    
    // Do any additional setup after loading the view.
}

- (void)buildButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 200, 40);
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonPressed:(UIButton *)button {
    NSLog(@"Pressed");
    SecondViewController *newSecondViewController = [SecondViewController new];
    NSString *title = self.name.text;
    if(title.length !=0){
        self.name.text = @"";
        newSecondViewController.tabBarItem.title = title;
        
        newSecondViewController.tabBarItem.badgeValue = @"3";
        newSecondViewController.tabBarItem.image = [UIImage imageNamed:@"beer"];
        
        NSMutableArray *viewController = [self.tabBarController.viewControllers mutableCopy];
        [viewController addObject:newSecondViewController];
        
        [self.tabBarController setViewControllers:viewController animated:YES];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)buildTextfield {
    self.name = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    self.name.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.name];
    
    
    self.name.placeholder = @"Introduce el nombre";
    self.name.delegate = self;
}

- (NSString *)commonTitle {
    if(!_commonTitle){
        _commonTitle = @"Edit";
    }
    return _commonTitle;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.text = @"";
}



@end
