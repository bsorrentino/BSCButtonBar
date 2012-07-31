//
//  UIButtonBar.m
//  TabBarHeader
//
//  Created by Bartolomeo Sorrentino on 6/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BSCButtonBarController.h"

@interface BSCButtonBarController ( /*Private*/ )

- (void) initialize;
- (CGFloat) horizontalLocationForButton:(id)sender;
- (CGFloat) horizontalLocationForIndex:(NSInteger)buttonIndex;

- (IBAction)willSelectButton:(id)sender;


@end

@implementation BSCButtonBarController

@synthesize buttons;
@synthesize tabBarArrow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self initialize];

    for (UIButton *b in self.buttons ) {
    
        [b addTarget:self action:@selector(willSelectButton:) forControlEvents:UIControlEventTouchDown];
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - Nipple Management

- (void) initialize
{
    
    UIButton *b = [self.buttons objectAtIndex:0];
    
    CGFloat verticalLocation = self.view.frame.origin.y + self.view.frame.size.height - 4 ;
    self.tabBarArrow.frame = 
        CGRectMake([self horizontalLocationForButton:b], 
                   verticalLocation, 
                   self.tabBarArrow.frame.size.width, 
                   self.tabBarArrow.frame.size.height);
    
    b.selected = YES;
}

- (CGFloat) horizontalLocationForButton:(id)sender
{
    NSInteger buttonIndex = [self.buttons indexOfObject:sender];

    return [self horizontalLocationForIndex:buttonIndex];
}

- (CGFloat) horizontalLocationForIndex:(NSInteger)buttonIndex
{
    // A single tab item's width is the entire width of the tab bar divided by number of items
    CGFloat tabItemWidth = self.view.frame.size.width / self.buttons.count;
    // A half width is tabItemWidth divided by 2 minus half the width of the arrow
    CGFloat halfTabItemWidth = (tabItemWidth / 2.0) - (self.tabBarArrow.frame.size.width / 2.0);
    
    // The horizontal location is the index times the width plus a half width
    return (buttonIndex * tabItemWidth) + halfTabItemWidth;
    
}

- (IBAction)willSelectButton:(id)sender
{
    
    for (UIButton *b in self.buttons) {
        if( b.selected ) {
            b.selected = NO;  
            break;
        }
    }
    ((UIButton *)sender).selected = YES;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = tabBarArrow.frame;
        frame.origin.x = [self horizontalLocationForButton:sender];
        self.tabBarArrow.frame = frame;
        
    } ];

/*    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    CGRect frame = tabBarArrow.frame;
    frame.origin.x = [self horizontalLocationForButton:sender];
    self.tabBarArrow.frame = frame;
    [UIView commitAnimations];  
*/    
}

-(void)setAsTableHeaderView:(UITableView*)tableView
{
    NSParameterAssert(tableView);    
    if( tableView == nil ) return;
    
    NSAssert(self.tabBarArrow != nil, @"tab bar arrow must be not nil!");
    
    if( self.tabBarArrow != nil ) {
        CGRect rect = self.tabBarArrow.frame;
    
        rect.origin.y = self.view.frame.origin.y + self.view.frame.size.height;
    
        self.tabBarArrow.frame = rect;
    
        if ( ![tableView.subviews containsObject:self.tabBarArrow]) {
            [tableView addSubview:self.tabBarArrow];
        }
    }
    
    tableView.tableHeaderView = self.view;
    
}

@end
