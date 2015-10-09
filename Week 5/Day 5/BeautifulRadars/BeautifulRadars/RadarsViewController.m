#import "RadarsViewController.h"
#import "RadarCell.h"
#import "EditRadarViewController.h"
#import "RadarAPIWrapper.h"
#import "JSONParser.h"
#import "JSONRadarMapper.h"
#import "RadarsViewController+DFNSFetchResultsController.h"

@interface RadarsViewController () 

@end

@implementation RadarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(self.managedObjectContext != nil, @"Programmer exception: I need a Managed Object Context and the programmer responsible from calling should be fired. Inmediatelly");
    
    NSAssert([NSThread currentThread] == [NSThread mainThread], @"Cuidadín, no estás en el hilo main, quietor, pecador, ...");
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshRadars:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"EditRadarSegue"]) {
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        Radar *radar = [self.fetchedResultsController objectAtIndexPath:ip]
        ;
        
        EditRadarViewController *vc = [segue destinationViewController];
        vc.radar = radar;
    }
    
    
}

- (IBAction)refreshRadars:(id)sender {
    
    RadarAPIWrapper *apiWrapper = [[RadarAPIWrapper alloc] init];
    
    __weak RadarsViewController *weakSelf = self;
    
    [apiWrapper radarsWithBaseURL:@"https://openradar.appspot.com/api/radars"
                       completion:^(NSString * _Nullable returnData) {
                           
                        NSAssert([NSThread currentThread] == [NSThread mainThread], @"OMG");
                           
                        NSArray<RadarJSON *> *jsonRadars = [JSONParser parseJSONString:returnData];
                        
                        [JSONRadarMapper mapJSONRadars:jsonRadars inContext:self.managedObjectContext];
                           
                        [weakSelf.tableView reloadData];
                        [weakSelf.refreshControl endRefreshing];
                        [self.managedObjectContext save:nil];
                           
    } onError:^(NSError * _Nullable error) {
        NSLog(@"OMG!");
    }];
    
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RadarCell *cell = (RadarCell *)[tableView dequeueReusableCellWithIdentifier:@"RadarCell" forIndexPath:indexPath];

    Radar *radar = (Radar *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.radar = radar;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 90;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
    
    Radar *radar = (Radar *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    RadarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderSectionCell"];
    cell.radar = radar;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
    
    Radar *radar = (Radar *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    return radar.user;
}


@end
