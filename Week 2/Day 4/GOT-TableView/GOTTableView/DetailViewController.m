//
//  DetailViewController.m
//  GOTTableView
//
//  Created by Francisco Jimenez Moral on 17/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *nameImageView;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextview;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.nameLabel.text = self.personaje.nombre;
    self.biographyTextview.text = self.personaje.descripcion;
    UIImage *imageCharacter = [UIImage imageNamed:self.personaje.imagen];
    self.nameImageView.image = imageCharacter;
  //  self.nameImageView.clipsToBounds = YES;
    
    self.nameImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.nameImageView.layer.borderWidth = 2.0;
    self.nameImageView.layer.cornerRadius = self.nameImageView.frame.size.width/2;
    self.nameImageView.layer.masksToBounds = YES;
    
    self.backgroundImageView.image = imageCharacter;
    self.backgroundImageView.clipsToBounds = YES;
    
}
- (IBAction)deletePerson:(UIBarButtonItem *)sender {
    [self.delegate didPressKillPersonaje:self.personaje];
}

@end
