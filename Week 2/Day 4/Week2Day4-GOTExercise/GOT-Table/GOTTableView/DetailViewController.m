//
//  DetailViewController.m
//  GOTTableView
//
//  Created by Mateo Mauricio Samaranch on 17/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *nameImage;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextview;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.nameImage.image = [UIImage imageNamed:self.personaje.imagen];
    self.nameLabel.text = self.personaje.nombre;
    self.biographyTextview.text = self.personaje.descripcion;

}
- (IBAction)deletePerson:(UIBarButtonItem *)sender {
    [self.delegate didPressKillPersonaje:self.personaje];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
