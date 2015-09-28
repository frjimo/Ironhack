//
//  TVShowsTableViewController.m
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "TVShowsTableViewController.h"
#import "TVShows.h"
#import "NSString+Random.h"
#import "NSArray+Random.h"

@interface TVShowsTableViewController ()

@property (nonatomic, strong) NSMutableArray *shows;
@property (nonatomic, copy) NSString *path;

@end

@implementation TVShowsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *documentsDirectory = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    self.path = [documentsDirectory stringByAppendingPathComponent:@"shows.dat"];
    
    [self loadTVShow];
    
    if([self.shows count] == 0){
        self.shows = [[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++){
            TVShows *show = [[TVShows alloc]initWithid:[NSString mm_randomString] description:[NSString mm_randomString] title:[NSString mm_randomString] rating:(rand() % 74)];
            [self.shows addObject:show];
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shows count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    TVShows *showAux = self.shows[indexPath.row];
    cell.textLabel.text = showAux.showTitle;
    cell.detailTextLabel.text = showAux.showDescription;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addShow:(id)sender {
    [self.shows addObject:[self.shows mm_randomObject]];
    [self.tableView reloadData];
}

- (void)loadTVShow {
    NSArray *shows = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    if (shows.count) {
        self.shows = [shows mutableCopy];
    }
}

- (IBAction)saveTVShow:(id)sender {
    if ([self.shows count]) {
        [NSKeyedArchiver archiveRootObject:self.shows toFile:self.path];
    }
}

@end
