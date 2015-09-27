//
//  ZoomInLayout.m
//  GOTCollectionView
//
//  Created by Fran on 18/9/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "ZoomInLayout.h"



@implementation ZoomInLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumLineSpacing = -50.0;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 0, 0);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.itemSize = CGSizeMake(400, 400);
    }
    return self;
}




- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributesInRect = [super layoutAttributesForElementsInRect:rect];
//    CGRect visibleRect;
//    visibleRect.origin = self.collectionView.contentOffset;
//    visibleRect.size = self.collectionView.bounds.size;
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x, self.collectionView.contentOffset.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    for (UICollectionViewLayoutAttributes *cellAttributes in attributesInRect) {
        if(CGRectIntersectsRect(cellAttributes.frame, rect)){
            [self setCellAttributes:cellAttributes forVisibleRect:visibleRect];
        }
    }
    return attributesInRect;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributtes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    [self setCellAttributes:attributtes forVisibleRect:visibleRect];
    
    return attributtes;
}


- (void)setCellAttributes:(UICollectionViewLayoutAttributes *)attributes forVisibleRect:(CGRect)visibleRect {
    CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
    CGFloat normalizedDistance = distance / (self.collectionView.frame.size.width/2.0);
    normalizedDistance = ABS(normalizedDistance);
    normalizedDistance = normalizedDistance>.5?.5:normalizedDistance;
    attributes.transform3D = CATransform3DMakeScale(1-normalizedDistance, 1-normalizedDistance, 1);
}


- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
