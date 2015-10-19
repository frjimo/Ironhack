
#import "GeoIPCell.h"

@interface GeoIPCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblIP;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;

@end

@implementation GeoIPCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGeoIP:(GeoIP *)geoIP {
    _geoIP = geoIP;
    
    self.lblIP.text = geoIP.ip;
    self.lblCountry.text = geoIP.country;
}

@end
