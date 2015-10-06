//
//  RadarCell.m
//  Radar
//
//  Created by Fran on 6/10/15.
//  Copyright © 2015 Fran. All rights reserved.
//

#import "RadarCell.h"

@interface RadarCell ()

@property (weak, nonatomic) IBOutlet UILabel *radarText;
@property (weak, nonatomic) IBOutlet UILabel *radarUser;

@end

@implementation RadarCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRadar:(Radar *)radar {
    self.radarText.text = radar.title;
    self.radarUser.text = radar.user;
}

@end
