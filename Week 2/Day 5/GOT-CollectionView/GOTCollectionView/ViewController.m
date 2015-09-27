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
#import "ZoomInLayout.h"
#import "CoverFlowLayout.h"
#import "CustomLayout.h"


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet GotModel *gotModel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CustomCollectionViewCell *customCell;
@property (strong, nonatomic) UICollectionViewFlowLayout *verticalLayout;
@property (strong, nonatomic) UICollectionViewFlowLayout *horizontalLayout;
@property (strong, nonatomic) NSMutableSet *selectedItems;
@property (strong, nonatomic) ZoomInLayout *zoomInLayout;
@property (strong, nonatomic) CoverFlowLayout *coverLayout;
@property (strong, nonatomic) CustomLayout *customLayout;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadModel];
    [self registerNib];
    self.collectionView.collectionViewLayout = self.verticalLayout;
    self.collectionView.allowsMultipleSelection = YES;
    self.selectedItems = [[NSMutableSet alloc]init];
    self.zoomInLayout = [[ZoomInLayout alloc]init];
    self.coverLayout = [[CoverFlowLayout alloc]init];
    self.customLayout = [[CustomLayout alloc]init];
    
}


#pragma mark IBActions

- (IBAction)trashButtonPressed:(UIBarButtonItem *)sender {
    [self.collectionView performBatchUpdates:^{
        [self.collectionView deleteItemsAtIndexPaths:[self.selectedItems allObjects]];
        [self.gotModel removeCharacters:self.selectedItems];
        //self.selectedItems = nil;
        [self.selectedItems removeAllObjects];
    } completion:nil];
}

- (IBAction)changeSegmentedControl:(UISegmentedControl *)segmentedControl {
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self.collectionView setCollectionViewLayout:self.verticalLayout animated:YES];
            break;
        case 1:
            [self.collectionView setCollectionViewLayout:self.horizontalLayout animated:YES];
            break;
        case 2:
            [self.collectionView setCollectionViewLayout:self.zoomInLayout animated:YES];
            break;
        case 3:
            [self.collectionView setCollectionViewLayout:self.coverLayout animated:YES];
            break;
        case 4:
            [self.collectionView setCollectionViewLayout:self.customLayout animated:NO];
        default:
            break;
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




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    CustomCollectionViewCell *cell = (CustomCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    [self.selectedItems addObject:indexPath];
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = cell.bounds;
//    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:160/255.f green:208/255.f blue:222/255.f alpha:1] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
//    [cell.layer insertSublayer:gradient atIndex:0];

}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = (CustomCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    [self.selectedItems removeObject:indexPath];
}




#pragma mark lazy load

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
