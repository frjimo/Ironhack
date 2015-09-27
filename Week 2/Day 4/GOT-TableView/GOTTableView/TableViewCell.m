//
//  TableViewCell.m
//  GOTTableView
//
//  Created by Mateo Mauricio Samaranch on 17/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void) awakeFromNib
{
    self.imageCell.backgroundColor = [UIColor clearColor];
    self.imageCell.clipsToBounds = YES;
    self.imageCell.layer.cornerRadius = self.imageCell.frame.size.width / 2;
    self.imageCell.layer.borderWidth = 2;
    self.imageCell.layer.borderColor = [[UIColor whiteColor]CGColor];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
