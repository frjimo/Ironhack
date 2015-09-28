//
//  PresentBookmarkTableViewController.m
//  Bookmarks
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "PresentBookmarkTableViewController.h"
#import "AddBookmarkViewController.h"
#import "Bookmark.h"

@interface PresentBookmarkTableViewController () <AddBookmarkViewControllerDelegate>

@property (nonatomic, copy) NSString *path;
@property (nonatomic, strong) NSMutableArray *bookmarks;

@end

@implementation PresentBookmarkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *documentsDirectory = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    self.path = [documentsDirectory stringByAppendingPathComponent:@"bookmarks.dat"];
    
    
    //self.bookmarks = [[NSMutableArray alloc] init];
    //self.bookmarks = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];

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
    return [self.bookmarks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    Bookmark *bookmark = self.bookmarks[indexPath.row];
    cell.textLabel.text = bookmark.name;
    cell.detailTextLabel.text = bookmark.url;
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addBookmark"]){
        UINavigationController *navigationController = segue.destinationViewController;
        AddBookmarkViewController *addBookmarkViewController = (id)navigationController.topViewController;
        addBookmarkViewController.delegate = self;
    
    }
}

#pragma mark - AddBookmarkDelegate

- (void)didPressDoneBookmark:(Bookmark *)bookmark{
    NSLog(@"bookmark");
    
    [self addBormak:bookmark];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)loadBookmarks {
    self.bookmarks = [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
    if (!_bookmarks){
        _bookmarks = [[NSMutableArray alloc]init];
    }
}

- (NSArray *)bookmarks{
    if (!_bookmarks){
        [self loadBookmarks];
    }
    return _bookmarks;
}

- (void)addBormak:(Bookmark *)bookmark {
    if (!_bookmarks){
        [self loadBookmarks];
    }
        
        [self.bookmarks addObject:bookmark];
        
        [NSKeyedArchiver archiveRootObject:self.bookmarks toFile:self.path];
    
    
    
}




@end
