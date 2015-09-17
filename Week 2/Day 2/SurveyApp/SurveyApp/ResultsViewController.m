//
//  ViewController.m
//  SurveyApp
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "ResultsViewController.h"
#import "NotificationsKeys.h"

@interface ResultsViewController ()

@property (strong, nonatomic) UILabel * answerOfFirstAnswer;
@property (strong, nonatomic) UILabel * answerOfSecondAnswer;
@property (strong, nonatomic) UILabel * answerOfThirdAnswer;

@property (assign, nonatomic) NSUInteger answerOfFirst;
@property (assign, nonatomic) NSUInteger answerOfSecond;
@property (assign, nonatomic) NSUInteger answerOfThird;

@end

@implementation ResultsViewController


- (instancetype)init {
    self = [super init];
    if (self) {
        [self observeNotifications];
        self.answerOfFirst = 0;
        self.answerOfSecond = 0;
        self.answerOfThird = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self builLabels];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)observerNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:didAnswerNotification object:nil];
}


- (void)didReceiveNotification:(NSNotification *)notification {
    NSLog(@"Notification recived");
    
    NSUInteger questionNumber = [notification.userInfo[questionKey] integerValue];
    
    switch (questionNumber) {
        case 0:
            self.answerOfFirst++;
            break;
        case 1:
            self.answerOfSecond++;
            break;
        case 2:
            self.answerOfThird++;
            break;
            
        default:
            break;
    }
    
    
    
    [self drawNumberOfAnswers];
}


//- (void)didReceiveNotification:(NSNotification *)notification {
//    NSNumber *questionNumber = notification.userInfo[@"question"];
//}

- (void)builLabels {
    self.answerOfFirstAnswer = [[UILabel alloc] initWithFrame:CGRectMake(16, 100, 200, 40)];
    self.answerOfSecondAnswer = [[UILabel alloc] initWithFrame:CGRectMake(16, 200, 200, 40)];
    self.answerOfThirdAnswer = [[UILabel alloc] initWithFrame:CGRectMake(16, 300, 200, 40)];
    
    [self.view addSubview:self.answerOfFirstAnswer];
    [self.view addSubview:self.answerOfSecondAnswer];
    [self.view addSubview:self.answerOfThirdAnswer];
    [self drawNumberOfAnswers];
}

- (void)observeNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveNotification:)
                                                 name:@"didAnswer"
                                               object:nil];
}


- (void)drawNumberOfAnswers {
    self.answerOfFirstAnswer.text = [NSString stringWithFormat: @"%lu contestasdas",self.answerOfFirst];
    self.answerOfSecondAnswer.text = [NSString stringWithFormat: @"%lu contestasdas",self.answerOfSecond];
    self.answerOfThirdAnswer.text = [NSString stringWithFormat: @"%lu contestasdas",self.answerOfThird];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end
