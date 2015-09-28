//
//  AddBookmarkViewController.m
//  Bookmarks
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import "AddBookmarkViewController.h"

@interface AddBookmarkViewController ()

@end

@implementation AddBookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}



- (IBAction)addBookmark:(id)sender {
    
    NSString *labelName = self.nameText.text;
    NSString *labelUrl = self.urlText.text;
    Bookmark *bookmark;
    
    if (labelName.length == 0 || labelUrl.length == 0){
        [self.delegate didPressDoneBookmark:bookmark];
        
    }
    else{
        bookmark = [[Bookmark alloc]init];
        
        bookmark.url = self.urlText.text;
        bookmark.name = self.nameText.text;
        [self.delegate didPressDoneBookmark:bookmark];
    }
}


@end
