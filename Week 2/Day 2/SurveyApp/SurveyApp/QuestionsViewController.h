//
//  QuestionViewController.h
//  SurveyApp
//
//  Created by Fran on 15/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurveyDataSource.h"

@interface QuestionsViewController : UIViewController

- (instancetype)initWithDataSource:(SurveyDataSource *)datasource;

@end
