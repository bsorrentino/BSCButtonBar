//
//  BSCTableViewController.h
//  ButtonBar
//
//  Created by softphone on 08/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSCButtonBarController;

@interface BSCTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet BSCButtonBarController *headerController;

@end
