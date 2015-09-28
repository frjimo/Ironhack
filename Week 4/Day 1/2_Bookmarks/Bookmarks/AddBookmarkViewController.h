//
//  AddBookmarkViewController.h
//  Bookmarks
//
//  Created by Fran on 28/9/15.
//  Copyright (c) 2015 Fran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookmark.h"

@protocol AddBookmarkViewControllerDelegate <NSObject>

- (void)didPressDoneBookmark:(Bookmark *)bookmark;

@end

@interface AddBookmarkViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *urlText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;

@property (weak, nonatomic) id<AddBookmarkViewControllerDelegate> delegate;


//@property (strong, nonatomic) Bookmark *bookmark;

@end
