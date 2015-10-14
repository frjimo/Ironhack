#import "ListIPController.h"
#import "GeoIP.h"
#import "GeoIPCell.h"
#import "GeoIPAdapter.h"
#import "JsonIPAPIWrapper.h"
#import "RandomIPAddressGenerator.h"
#import "GeoIPJSON.h"
#import "GeoIPJsonParser.h"
#import "JSONRadarMapper.h"
#import "DetailGeoIpViewController.h"

@interface ListIPController ()
@property (nonatomic, strong) GeoIPAdapter *adapter;

@end

@implementation ListIPController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshIPs) forControlEvents:UIControlEventValueChanged];

    self.adapter = [[GeoIPAdapter alloc] initWithManagedObjectContext:self.managedObjectContext andTableView:self.tableView];
    self.adapter.delegate = self;
    
}


- (void)refreshIPs {
    
    NSMutableArray *ips = [RandomIPAddressGenerator randomIpsWithCapacity:20];
    
    
    JsonIPAPIWrapper *wrapper = [[JsonIPAPIWrapper alloc] init];
    
    [ips enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ips[idx] = [NSString stringWithFormat:@"%@%@", @"http://www.telize.com/geoip/", obj];
    }];
    
    
    [ips enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [wrapper IPsWithBaseURL:obj completion:^(NSString * _Nullable data) {
            GeoIPJSON *json = [GeoIPJsonParser parseJSONString:data];
            
            [JSONRadarMapper mapJSON:@[json] inContext:self.managedObjectContext];

        } onError:^(NSError * _Nullable error) {
            
        }];
        
        
    }];
    
    [self.refreshControl endRefreshing];

}

#pragma mark - Table View -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSUInteger sections = [[self.adapter sections] count];
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.adapter sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeoIPCell *cell = (GeoIPCell *)[tableView dequeueReusableCellWithIdentifier:@"IPCell" forIndexPath:indexPath];
    
    GeoIP *ip = (GeoIP *)[self.adapter objectAtIndexPath:indexPath];
    
    cell.geoIP = ip;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

#pragma mark - Navigation -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DetailGeoIPSegue"]) {
        DetailGeoIpViewController *vc = (DetailGeoIpViewController *)[segue destinationViewController];
        GeoIP *ip = (GeoIP *)[self.adapter objectAtIndexPath:[self.tableView indexPathForSelectedRow]];

        vc.ip = ip;
    }
}




@end
