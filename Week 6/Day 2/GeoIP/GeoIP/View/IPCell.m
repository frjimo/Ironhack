#import "IPCell.h"

@interface IPCell ()
@property (weak, nonatomic) IBOutlet UILabel *radarText;

@property (weak, nonatomic) IBOutlet UILabel *radarUser;

@end

@implementation IPCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setIP:(IP4 *)radar {
    self.radarText.text = radar.title;
    self.radarUser.text = radar.user;
}

@end
