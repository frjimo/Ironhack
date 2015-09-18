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
@property (strong, nonatomic) UICollectionViewFlowLayout *verticalLayout;
@property (strong, nonatomic) UICollectionViewFlowLayout *horizontalLayout;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadModel];
    [self registerNib];
    self.collectionView.collectionViewLayout = self.verticalLayout;

}


#pragma mark IBActions

- (IBAction)changeSegmentedControl:(UISegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [self.collectionView setCollectionViewLayout:self.verticalLayout animated:YES];
    }
    else{
        [self.collectionView setCollectionViewLayout:self.horizontalLayout animated:YES];
    }
}

#pragma mark My methods



- (void)loadModel {
    [self.gotModel loadModel];
}

- (void)registerNib {
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collectionCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderCollectionView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerCell"];
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

- (UICollectionViewFlowLayout *)horizontalLayout{
    if (!_horizontalLayout){
        _horizontalLayout = [[UICollectionViewFlowLayout alloc]init];
        _horizontalLayout.itemSize  = CGSizeMake(200, 300);
        _horizontalLayout.headerReferenceSize = CGSizeMake(200,100);
        _horizontalLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
        _horizontalLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    return _horizontalLayout;
}

- (UICollectionViewFlowLayout *)verticalLayout {
    if (!_verticalLayout) {
        _verticalLayout = [[UICollectionViewFlowLayout alloc]init];
        _verticalLayout.itemSize  = CGSizeMake(150, 150);
        _verticalLayout.headerReferenceSize = CGSizeMake(100,100);
        _verticalLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
        _verticalLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    }

    return _verticalLayout;
}

@end
