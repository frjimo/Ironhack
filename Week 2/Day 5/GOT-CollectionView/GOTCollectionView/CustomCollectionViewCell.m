//
//  CustomCollectionViewCell.m
//  GOTCollectionView
//
//  Created by Fran on 18/9/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.imageCollectionCell.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.imageCollectionCell.layer.borderWidth = 2;
    self.imageCollectionCell.layer.cornerRadius = 15.0;
    self.imageCollectionCell.layer.masksToBounds = YES;
    
}

@end
