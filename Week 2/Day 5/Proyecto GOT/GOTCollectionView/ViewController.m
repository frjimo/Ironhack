//
//  ViewController.m
//  GOTCollectionView
//
//  Created by Ricardo Sánchez Sotres on 12/06/14.
//  Copyright (c) 2014 Ricardo Sanchez. All rights reserved.
//

#import "ViewController.h"
#import "GotModel.h"
#import "CustomCollectionViewCell.h"
#import "Character.h"
#import "House.h"
#import "HeaderCollectionView.h"


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet GotModel *gotModel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CustomCollectionViewCell *customCell;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layoutViewController;
@property (weak, nonatomic) UICollectionViewFlowLayout *horizontalLayout;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadModel];
    [self registerNib];
    
    self.layoutViewController.headerReferenceSize = CGSizeMake(100,100);
    //self.horizontalLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark My methods

- (void)loadModel {
    [self.gotModel loadModel];
}

- (void)registerNib {
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collectionCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderCollectionView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell"];
}

- (UICollectionViewFlowLayout *)horizontalLayout{
    if (!_horizontalLayout){
        _horizontalLayout = [[UICollectionViewFlowLayout alloc]init];
        _horizontalLayout.itemSize  = CGSizeMake(200, 200);
        _horizontalLayout.sectionInset;
    }
    
    return _horizontalLayout;
}



#pragma mark Delegate, DataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.gotModel.houses.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    House *house = [self.gotModel.houses objectAtIndex:section];
    return house.characters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    House *casa = [self.gotModel.houses objectAtIndex:indexPath.section];
    Character *personaAux = [casa.characters objectAtIndex:indexPath.row];
    
    cell.imageCollectionCell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", personaAux.image]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HeaderCollectionView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell" forIndexPath:indexPath];
                                  
                                  
    House *casa = [self.gotModel.houses objectAtIndex:indexPath.section];
    cell.houseLabel.text = casa.name;
    
    return cell;
}

@end
