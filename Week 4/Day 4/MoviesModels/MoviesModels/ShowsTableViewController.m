//
//  ShowsTableViewController.m
//  MoviesModels
//
//  Created by Joan Romano on 9/27/15.
//  Copyright © 2015 Ironhack. All rights reserved.
//

#import "ShowsTableViewController.h"

#import <libextobjc/EXTScope.h>

#import "Show.h"
#import "UserEntity.h"
#import "ShowsProvider.h"
#import "NSArray+Random.h"
#import "NSString+Random.h"
#import "BlockButtonItem.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "ShowDetailViewController.h"
#import "UserEntity+CoreDataProperties.h"
#import "UIImageView+Downloads.h"

static NSString * const savedShowsFileName = @"shows";

@interface ShowsTableViewController () <UITabBarControllerDelegate>

@property (strong,nonatomic) NSMutableArray *shows;
@property (strong,nonatomic) NSMutableArray *likes;
@property (strong,nonatomic) ShowsProvider *showsProvider;

@end

@implementation ShowsTableViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin:) name:UserDidLogNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogout:) name:UserDidLogoutNotification object:nil];
        self.title = @"Shows";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    @weakify(self)

    BlockButtonItem *saveShowsButton = [[BlockButtonItem alloc] initWithTitle:@"Save" block:^{
        @strongify(self)
        if (self.shows.count)
        {
            [NSKeyedArchiver archiveRootObject:self.shows toFile:[self archivePath]];
            [self saveLikes];
        }
    }];
    self.navigationItem.leftBarButtonItem = saveShowsButton;

    BlockButtonItem *duplicateMovieButton = [[BlockButtonItem alloc] initWithTitle:@"Duplicate" block:^{
        @strongify(self)
        [self.shows addObject:[self.shows mm_randomObject]];
        [self.tableView reloadData];
    }];
    BlockButtonItem *addMovieButton = [[BlockButtonItem alloc] initWithTitle:@"Add" block:^{
        @strongify(self)
        [self.shows addObject:[self randomShow]];
        [self.tableView reloadData];
    }];
    self.navigationItem.rightBarButtonItems = @[duplicateMovieButton, addMovieButton];
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateTitleWithLoggedUser:[self loggedUser]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![self loggedUser])
    {
        [self presentLoginView];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[LoginViewController class]])
    {
        LoginViewController *loginViewController = segue.destinationViewController;
        loginViewController.managedObjectContext = self.managedObjectContext;
    }
    else
    {
        ShowDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.show = self.shows[[self.tableView indexPathForSelectedRow].row];
    }
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

- (void)presentLoginView
{
    [self performSegueWithIdentifier:@"presentLogin" sender:self];
}

- (void)updateTitleWithLoggedUser:(UserEntity *)user
{
    self.navigationItem.title = user? [NSString stringWithFormat:@"Movies (%@)",user.userName] : @"Shows";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    Show *show = self.shows[indexPath.item];
    cell.textLabel.text=show.showTitle;
    cell.detailTextLabel.text=show.showDescription;
    cell.accessoryType = [self.likes containsObject:show.showId] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    @weakify(cell);
    [cell.imageView setImageWithURL:[[self.shows objectAtIndex:indexPath.row] posterURL] completion:^(BOOL succes) {
        @strongify(cell);
        [cell layoutSubviews];
    }];
    
    //cell.imageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:[[self.shows objectAtIndex:indexPath.row] posterURL]]];
    
    
    return cell;
}

#pragma mark - Notifications

- (void)userDidLogin:(NSNotification *)notification
{
    [self updateTitleWithLoggedUser:[self loggedUser]];
}

- (void)userDidLogout:(NSNotification *)notification
{
    [self loadData];
    [self.tableView reloadData];
}

#pragma mark - Add

- (Show *)randomShow
{
    Show *show = [[Show alloc] init];
    show.showId = [NSString mm_randomString];
    show.showTitle = [NSString mm_randomString];
    show.showDescription = [NSString mm_randomString];
    show.showRating = arc4random()/10.0f;
    
    return show;
}

#pragma mark - Load

- (void)loadData
{
    [self loadLikes];
    [self loadShows];
}

- (void)loadShows
{
    @weakify(self)
    
    self.showsProvider = [[ShowsProvider alloc] init];
    [self.showsProvider showsWithSuccessBlock:^(id data) {
        @strongify(self)
        self.shows = data;
        [self.tableView reloadData];
    } errorBlock:^(NSError *error) {
        NSLog(@"Error");
    }];
}

- (void)loadLikes
{
    NSString *savesFilePath = [self savesFilePath];
    NSDictionary *likesDictionary = [NSDictionary dictionaryWithContentsOfFile:savesFilePath];
    self.likes = likesDictionary ? [likesDictionary[@"likes"] mutableCopy] : [NSMutableArray array];
}

- (NSString *)archivePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    
    return [documentsDirectory stringByAppendingPathComponent:savedShowsFileName];
}

#pragma mark - Save

- (NSString *)savesFilePath
{
    UserEntity *loggedUser = [self loggedUser];
    NSString *savesFilePath;
    if (loggedUser)
    {
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        savesFilePath = [cachesPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_saves.plist",loggedUser.userName]];
    }
    return savesFilePath;
}

- (void)saveLikes
{
    NSString *savesFilePath = [self savesFilePath];
    if (savesFilePath) {
        [@{@"likes":self.likes} writeToFile:savesFilePath atomically:YES];
    }
}

@end
