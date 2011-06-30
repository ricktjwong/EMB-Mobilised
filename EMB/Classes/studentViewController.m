//
//  MainMenuViewController.m
//  smb
//
//  Created by Rick Wong on 2/6/11.
//  Copyright 2011 Hwa Chong Institution. All rights reserved.
//

#import "studentViewController.h"
#import "LoginViewController.h"
#import "BoardsViewController.h"
#import "studentMessageViewController.h" 

@implementation studentViewController
@synthesize messageView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	sender = [[NSArray alloc] initWithObjects:@"Mr X", @"Mr Y", nil];
	date = [[NSArray alloc] initWithObjects:@"11/11/11", @"22/12/11",nil];
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(AddButtonAction:)];
	[self.navigationItem setRightBarButtonItem:addButton];
	UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"Delete" style:UIBarButtonItemStyleBordered target:self action:@selector(DeleteButtonAction:)];
	[self.navigationItem setLeftBarButtonItem:deleteButton];
	[addButton release];
	[deleteButton release];
	studentMessages.alpha = 0.9;


}


-(IBAction) boardTouched:(id)sender {
	
	BoardsViewController*board = [[BoardsViewController alloc]initWithNibName:@"BoardsViewController" 
																	   bundle:nil];
	
	UIView *currentView = self.view;
	// get the the underlying UIWindow, or the view containing the current view view
	UIView *theWindow = [currentView superview];
	
	// remove the current view and replace with myView1
	[currentView removeFromSuperview];
	//[theWindow addSubview:newView];
	
	// set up an animation for the transition between the views
	CATransition *animation = [CATransition animation];
	[animation setDuration:0.5];
	[animation setType:kCATransitionPush];
	[animation setSubtype:kCATransitionFromLeft];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	
	[[theWindow layer] addAnimation:animation forKey:@"SwitchToMainMenu"];
	
	[self.navigationController pushViewController:board animated:YES];
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sender count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
    static NSString *CellIdentifier = @"Cell";
    
	static NSInteger senderTag = 1;
	static NSInteger dateTag = 2;
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		CGRect frame;
		frame.origin.x = 10; 
		frame.origin.y = 5;
		frame.size.height = 20;
		frame.size.width = 200;
		
		UILabel *senderLabel = [[UILabel alloc] initWithFrame:frame];
		senderLabel.tag = senderTag;
		[cell.contentView addSubview:senderLabel];
		[senderLabel release];
		
		
		frame.origin.y += 25;
		UILabel *dateLabel = [[UILabel alloc] initWithFrame:frame];
		dateLabel.tag = dateTag;
		[cell.contentView addSubview:dateLabel];
		[dateLabel release];
		
    }
    
    // Set up the cell...	
	// cell.text = [NSString stringWithFormat:@"State: %@ Capital: %@",[capitals objectAtIndex:indexPath.row],[states objectAtIndex:indexPath.row]];
	UILabel * senderLabel = (UILabel *) [cell.contentView viewWithTag:senderTag];
	UILabel * dateLabel = (UILabel *) [cell.contentView viewWithTag:dateTag];
	
	senderLabel.text = [sender objectAtIndex:indexPath.row];
	dateLabel.text = [date objectAtIndex:indexPath.row];
	cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
	//UITableViewCellAccessoryDetailDisclosureButton,
	//UITableViewCellAccessoryCheckmark
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 70.0; //returns floating point which will be used for a cell row height at specified row index
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Navigation logic
	if(self.messageView == nil) {
		studentMessageViewController *view2 = [[studentMessageViewController alloc] initWithNibName:@"studentMessage" bundle:[NSBundle mainBundle]];
		self.messageView = view2;
		[view2 release];
	}
	
	[self.navigationController pushViewController:self.messageView animated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];

}


@end
