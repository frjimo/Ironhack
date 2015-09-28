//
//  MoviesTableViewController.m
//  3_ExerciseTVShowsMovies
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "MoviesTableViewController.h"
#import "Movies.h"
#import "NSString+Random.h"
#import "NSArray+Random.h"

@interface MoviesTableViewController ()

@property (nonatomic, strong) NSMutableArray *movies;
@property (nonatomic, copy) NSString *path;

@end

@implementation MoviesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *documentsDirectory = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    self.path = [documentsDirectory stringByAppendingPathComponent:@"movies.dat"];
    
    [self loadMovie];
    
    if([self.movies count] == 0){
        self.movies = [[NSMutableArray alloc]init];
        for (int i = 0; i < 5; i++){
            Movies *movie = [[Movies alloc]initWithid:[NSString mm_randomString] description:[NSString mm_randomString] title:[NSString mm_randomString] rating:(rand() % 74)];
            [self.movies addObject:movie];
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
    return [self.movies count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Movies *movieAux = self.movies[indexPath.row];
    cell.textLabel.text = movieAux.movieTitle;
    cell.detailTextLabel.text = movieAux.movieDescription;
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

- (IBAction)addMovie:(id)sender {
    [self.movies addObject:[self.movies mm_randomObject]];
    [self.tableView reloadData];
}



- (void)loadMovie {
    NSArray *movies = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    if (movies.count) {
        self.movies = [movies mutableCopy];
    }
}


- (IBAction)saveMovie:(id)sender {
    if ([self.movies count]) {
        [NSKeyedArchiver archiveRootObject:self.movies toFile:self.path];
    }
}

@end
