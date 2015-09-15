//
//  QuestionViewController.m
//  SurveyApp
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "QuestionsViewController.h"

static NSUInteger const padding = 16;

@interface QuestionsViewController ()

@property (strong, nonatomic) UISwitch *question1Switch;
@property (strong, nonatomic) UISwitch *question2Switch;
@property (strong, nonatomic) UISwitch *question3Switch;

@property (strong, nonatomic) UILabel *question1Label;
@property (strong, nonatomic) UILabel *question2Label;
@property (strong, nonatomic) UILabel *question3Label;

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildQuestion];
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildQuestion {
    [self questionViewSwitch:self.question1Switch label:self.question1Label height:200];
    [self questionViewSwitch:self.question2Switch label:self.question2Label height:300];
    [self questionViewSwitch:self.question3Switch label:self.question3Label height:400];
//    [self questionView1];
//    [self questionView2];
//    [self questionView3];
    
}

//- (void)questionView1 {
//    UIView *questionView1 = [[UIView alloc]initWithFrame:CGRectMake(padding, 200, self.view.frame.size.width - 2 * padding, 40)];
//    self.question1Switch = [[UISwitch alloc]initWithFrame:CGRectZero];
//    [questionView1 addSubview:self.question1Switch];
//    
//    CGFloat x = self.question1Switch.frame.origin.x + self.question1Switch.frame.size.width + padding;
//    CGFloat witdh = questionView1.frame.size.width - self.question1Switch.frame.size.width - padding;
//    CGFloat height = self.question1Switch.frame.size.height;
//    self.question1Label = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, witdh, height)];
//    self.question1Label.text = @"Pregunta1";
//    [questionView1 addSubview:self.question1Label];
//    
//    [self.view addSubview:questionView1];
//}
//
//- (void)questionView2 {
//    UIView *questionView2 = [[UIView alloc]initWithFrame:CGRectMake(padding, 300, self.view.frame.size.width - 2 * padding, 40)];
//    self.question2Switch = [[UISwitch alloc]initWithFrame:CGRectZero];
//    [questionView2 addSubview:self.question2Switch];
//    
//    CGFloat x = self.question2Switch.frame.origin.x + self.question2Switch.frame.size.width + padding;
//    CGFloat witdh = questionView2.frame.size.width - self.question2Switch.frame.size.width - padding;
//    CGFloat height = self.question2Switch.frame.size.height;
//    self.question2Label = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, witdh, height)];
//    self.question2Label.text = @"Pregunta2";
//    [questionView2 addSubview:self.question2Label];
//    
//    [self.view addSubview:questionView2];
//}
//
//- (void)questionView3 {
//    UIView *questionView3 = [[UIView alloc]initWithFrame:CGRectMake(padding, 400, self.view.frame.size.width - 2 * padding, 40)];
//    self.question3Switch = [[UISwitch alloc]initWithFrame:CGRectZero];
//    [questionView3 addSubview:self.question3Switch];
//    
//    CGFloat x = self.question3Switch.frame.origin.x + self.question3Switch.frame.size.width + padding;
//    CGFloat witdh = questionView3.frame.size.width - self.question3Switch.frame.size.width - padding;
//    CGFloat height = self.question1Switch.frame.size.height;
//    self.question3Label = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, witdh, height)];
//    self.question3Label.text = @"Pregunta3";
//    [questionView3 addSubview:self.question3Label];
//    
//    [self.view addSubview:questionView3];
//}

- (void)questionViewSwitch:(UISwitch *)questionSwitch label:(UILabel *)questionLabel height:(NSUInteger)height {
    UIView *questionView = [[UIView alloc]initWithFrame:CGRectMake(padding, height, self.view.frame.size.width - 2 * padding, 40)];
    questionSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
    [questionView addSubview:questionSwitch];
    
    CGFloat x = questionSwitch.frame.origin.x + questionSwitch.frame.size.width + padding;
    CGFloat witdh = questionView.frame.size.width - questionSwitch.frame.size.width - padding;
    CGFloat heightAux = questionSwitch.frame.size.height;
    questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, 0, witdh, heightAux)];
    questionLabel.text = @"Pregunta";
    [questionView addSubview:questionLabel];
    
    [self.view addSubview:questionView];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
