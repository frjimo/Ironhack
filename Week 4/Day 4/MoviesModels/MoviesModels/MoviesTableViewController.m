//
//  MoviesTableViewController.m
//  MoviesModels
//
//  Created by Joan Romano on 9/27/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "MoviesTableViewController.h"

#import <libextobjc/EXTScope.h>

#import "Movie.h"
#import "UserEntity.h"
#import "NSArray+Random.h"
#import "NSString+Random.h"
#import "LoginViewController.h"
#import "BlockButtonItem.h"
#import "UserEntity+CoreDataProperties.h"

static NSString *const savedMoviesFileName = @"movies";

@interface MoviesTableViewController ()

@property (strong,nonatomic) NSMutableArray *movies;

@end

@implementation MoviesTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin:) name:UserDidLogNotification object:nil];
        
        self.title = @"Movies";
        self.movies = [NSMutableArray array];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    @weakify(self)
    
    BlockButtonItem *saveMoviesButton = [[BlockButtonItem alloc] initWithTitle:@"Save" block:^{
        @strongify(self)
        if (self.movies.count)
        {
            [NSKeyedArchiver archiveRootObject:self.movies toFile:[self archivePath]];
        }
    }];
    self.navigationItem.leftBarButtonItem = saveMoviesButton;
    BlockButtonItem *duplicateMovieButton = [[BlockButtonItem alloc] initWithTitle:@"Duplicate" block:^{
        @strongify(self)
        [self.movies addObject:[self.movies mm_randomObject]];
        [self.tableView reloadData];
    }];
    BlockButtonItem *addMovieButton = [[BlockButtonItem alloc] initWithTitle:@"Add" block:^{
        @strongify(self)
        [self.movies addObject:[self randomMovie]];
        [self.tableView reloadData];
    }];
    self.navigationItem.rightBarButtonItems = @[duplicateMovieButton, addMovieButton];
    
    [self loadMovies];
    
    if (!self.movies.count)
    {
        for (NSInteger i = 0; i < 5; i++) {
            [self.movies addObject:[self randomMovie]];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateTitleWithLoggedUser:[self loggedUser]];
}

- (void)userDidLogin:(NSNotification *)notification
{
    [self updateTitleWithLoggedUser:[self loggedUser]];
}

- (UserEntity *)loggedUser
{
    UserEntity *loggedUser;
    NSFetchRequest *request=[[NSFetchRequest alloc] initWithEntityName:NSStringFromClass([UserEntity class])];
    request.predicate=[NSPredicate predicateWithFormat:@"1=1"];
    NSArray *users=[self.managedObjectContext executeFetchRequest:request error:nil];
    if (users.count) {
        loggedUser=[users firstObject];
    }
    return loggedUser;
}

- (void)updateTitleWithLoggedUser:(UserEntity *)user
{
    self.navigationItem.title = user? [NSString stringWithFormat:@"Movies (%@)",user.userName] : @"Shows";
}

- (void)addDuplicatedMovie:(id)sender
{
    [self.movies addObject:[self.movies mm_randomObject]];
    
    [self.tableView reloadData];
}

- (void)addMovie:(id)sender
{
    [self.movies addObject:[self randomMovie]];
    
    [self.tableView reloadData];
}

- (Movie *)randomMovie
{
    Movie *movie = [[Movie alloc] init];
    movie.movieId = [NSString mm_randomString];
    movie.movieTitle = [NSString mm_randomString];
    movie.movieDescription = [NSString mm_randomString];
    movie.movieRating = arc4random()/10.0f;
    
    return movie;
}

- (NSString *)archivePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:savedMoviesFileName];
}

- (void)loadMovies
{
    NSArray *movies = [NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
    if (movies.count)
    {
        self.movies = [movies mutableCopy];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    Movie *movie=[self.movies objectAtIndex:indexPath.item];
    cell.textLabel.text=movie.movieTitle;
    cell.detailTextLabel.text=movie.movieDescription;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Movie *movie = [self.movies objectAtIndex:indexPath.item];
    
    if (indexPath.row>=0 && indexPath.row<=1)
    {
        [self compareWithFirstMovie:movie];
    }
    else
    {
        [self findMovie:movie];
    }
}

- (void)compareWithFirstMovie:(Movie *)movie
{
    UIAlertController *alert;
    Movie *firstMovie = [self.movies firstObject];
    
    if ([firstMovie isEqual:movie])
    {
        alert = [UIAlertController alertControllerWithTitle:@"Equal Movie" message:@"It is equal !!" preferredStyle:UIAlertControllerStyleAlert];
    }
    else
    {
        alert = [UIAlertController alertControllerWithTitle:@"Equal Movie" message:@"IIt is NOT equal" preferredStyle:UIAlertControllerStyleAlert];
    }
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)findMovie:(Movie *)movie
{
    UIAlertController *alert;
    
    if ([self.movies containsObject:movie])
    {
        alert = [UIAlertController alertControllerWithTitle:@"Find Movie" message:@"Found !" preferredStyle:UIAlertControllerStyleAlert];
    }
    else
    {
        alert = [UIAlertController alertControllerWithTitle:@"Find Movie" message:@"Not in dataSource" preferredStyle:UIAlertControllerStyleAlert];
    }
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [alert dismissViewControllerAnimated:YES completion:nil];
                             
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
