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
    
//    NSString *label = self.nameText.text;
//    
//    if (label.length != 0){
//        
//    }
    Bookmark *bookmark = [[Bookmark alloc]init];
    
    bookmark.url = self.urlText.text;
    bookmark.name = self.nameText.text;
    [self.delegate didPressDoneBookmark:bookmark];
}


@end
