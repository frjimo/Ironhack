//
//  QuestionViewController.m
//  SurveyApp
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "QuestionsViewController.h"
#import "NotificationsKeys.h"

static NSUInteger const padding = 16;

@interface QuestionsViewController ()

@property (strong, nonatomic) UISwitch *question1Switch;
@property (strong, nonatomic) UISwitch *question2Switch;
@property (strong, nonatomic) UISwitch *question3Switch;

@property (strong, nonatomic) UILabel *question1Label;
@property (strong, nonatomic) UILabel *question2Label;
@property (strong, nonatomic) UILabel *question3Label;

@property (strong, nonatomic) SurveyDataSource *datasource;

@property (strong, nonatomic) UIButton *nextButton;


@end

@implementation QuestionsViewController


- (instancetype)initWithDataSource:(SurveyDataSource *)datasource {
    self = [super init];
    if(self){
        _datasource = datasource;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildQuestion];
    [self addSwitchesTargetAction];
    [self drawButtonIfNeeded];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchQuestionData];
}

//- (void)addSwitchesTargetAction {
//    [self.question1Switch addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
//    [self.question2Switch addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
//    [self.question3Switch addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
//}
//
//- (void)didMarkAnswer:(UISwitch *)questionSwitch {
//    NSUInteger questionNumber  = 0;
//    
//    if (questionSwitch == self.question2Switch){
//        questionNumber = 1;
//    }else if (questionSwitch == self.question3Switch){
//        questionNumber = 2;
//    }
//    
//    //[[NSNotificationCenter defaultCenter] postNotificationName:@"didAnswer" object:self userInfo:@{@"question":@(questionNumber)}];
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:didAnswerNotification object:self userInfo:@{questionKey:@(questionNumber)}];
//    
//    
//}

- (void)addSwitchesTargetAction {
    [self.question1Switch addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
    [self.question2Switch addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
    [self.question3Switch addTarget:self action:@selector(didMarkAnswer:) forControlEvents:UIControlEventValueChanged];
}

- (void)didMarkAnswer:(UISwitch *)questionSwitch {
    NSUInteger questionNumber = 0;
    
    if (questionSwitch == self.question2Switch) {
        questionNumber = 1;
    } else if (questionSwitch == self.question3Switch) {
        questionNumber = 2;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:didAnswerNotification object:self userInfo:@{questionKey:@(questionNumber)}];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildQuestion {
    [self questionViewSwitch:self.question1Switch label:self.question1Label height:100];
    [self questionViewSwitch:self.question2Switch label:self.question2Label height:200];
    [self questionViewSwitch:self.question3Switch label:self.question3Label height:300];
}

- (void)drawButton {
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    self.nextButton.backgroundColor = [UIColor redColor];
    
    self.nextButton.frame = CGRectMake(padding , 400, 200, 40);
    
    [self.nextButton addTarget:self action:@selector(showNextQuestion) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextButton];
}

- (void)drawButtonIfNeeded {
    if ([self canShowNextController]) {
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.nextButton setTitle:@"Siguiente" forState:UIControlStateNormal];
        self.nextButton.backgroundColor = [UIColor redColor];
        self.nextButton.frame = CGRectMake(padding, 400, 200, 40);
        [self.nextButton addTarget:self action:@selector(showNextQuestion) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.nextButton];
    }
}

- (BOOL)canShowNextController {
    NSUInteger questionNumber = [self.navigationController.viewControllers indexOfObject:self];
    NSUInteger numberOfQuestions = [[self.datasource fetchSurvey][@"preguntas"] count];
    
    return questionNumber + 1 < numberOfQuestions;
}

- (void)showNextQuestion {
    QuestionsViewController *nextQuestion = [[QuestionsViewController alloc] initWithDataSource:self.datasource];
    [self.navigationController pushViewController:nextQuestion animated:YES];
}

- (void) fetchQuestionData {
    //viewController count
    NSUInteger questionNumber = [self.navigationController.viewControllers indexOfObject:self];
    
    NSDictionary *questions = [self.datasource fetchSurvey];
    NSArray *questionsArray = questions[@"preguntas"];
    NSDictionary *currentQuestion = [questionsArray objectAtIndex:questionNumber];
    [self drawQuestionWithDictionary:currentQuestion];
    
}

- (void)drawQuestionWithDictionary:(NSDictionary *)questionDictionary {
    self.navigationItem.title = questionDictionary[@"pregunta"];
    NSArray *answer = questionDictionary[@"respuestas"];
    self.question1Label.text = answer[0];
    self.question2Label.text = answer[1];
    self.question3Label.text = answer[2];
    
}

- (void)questionViewSwitch:(UISwitch *)questionSwitch label:(UILabel *)questionLabel height:(NSUInteger)height {
    UIView *questionView = [[UIView alloc]initWithFrame:CGRectMake(padding, height, self.view.frame.size.width - 2 * padding, 40)];
    questionSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
    [questionView addSubview:questionSwitch];
    
    CGFloat x = questionSwitch.frame.origin.x + questionSwitch.frame.size.width + padding;
    CGFloat witdh = questionView.frame.size.width - questionSwitch.frame.size.width - padding;
    CGFloat heightAux = questionSwitch.frame.size.height;
    questionLabel.frame = CGRectMake(x, 0, witdh, heightAux);
    questionLabel.text = @"Pregunta";
    [questionView addSubview:questionLabel];
    
    [self.view addSubview:questionView];
}


- (UILabel *)question1Label {
    if (!_question1Label) {
        _question1Label = [UILabel new];
    }
    
    return _question1Label;
}

- (UILabel *)question2Label {
    if (!_question2Label) {
        _question2Label = [UILabel new];
    }
    
    return _question2Label;
}

- (UILabel *)question3Label {
    if (!_question3Label) {
        _question3Label = [UILabel new];
    }
    
    return _question3Label;
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
