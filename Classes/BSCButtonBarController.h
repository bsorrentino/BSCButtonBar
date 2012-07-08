//
//  UIButtonBar.h
//  TabBarHeader
//
//  Created by Bartolomeo Sorrentino on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSCButtonBarController : UIViewController


@property (nonatomic,retain) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, retain) IBOutlet UIImageView *tabBarArrow;

-(void)setAsTableHeaderView:(UITableView*)tableView;

@end
