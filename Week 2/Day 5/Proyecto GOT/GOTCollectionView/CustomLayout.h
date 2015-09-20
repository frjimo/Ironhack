//
//  newLayout.h
//  GOTCollectionView
//
//  Created by Fran on 20/9/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLayout : UICollectionViewLayout

@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;


@end
