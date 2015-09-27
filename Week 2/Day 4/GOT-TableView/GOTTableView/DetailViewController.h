//
//  DetailViewController.h
//  GOTTableView
//
//  Created by Mateo Mauricio Samaranch on 17/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Personaje.h"

@protocol DetailViewControllerDelegate <NSObject>

- (void)didPressKillPersonaje:(Personaje *)personaje;

@end

@interface DetailViewController : UIViewController

@property (weak, nonatomic) id<DetailViewControllerDelegate> delegate;

@property (strong, nonatomic) Personaje *personaje;

@end
