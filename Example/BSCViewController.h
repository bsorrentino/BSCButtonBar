//
//  BSCViewController.h
//  TabBarHeader
//
//  Created by Bartolomeo Sorrentino on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSCButtonBarController;

@interface BSCViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIViewController *example2;
- (IBAction)showExample2:(id)sender;
@property (nonatomic, retain ) IBOutlet BSCButtonBarController *tableHeader;
@end
