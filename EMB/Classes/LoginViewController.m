//
//  RootViewController.m
//  smb
//
//  Created by Rick Wong on 1/26/11.
//  Copyright Hwa Chong Institution 2011. All rights reserved.
//

#import "LoginViewController.h"
#import "studentViewController.h"
#import "EMBAppDelegate.h"
#import "BoardsViewController.h"

@implementation LoginViewController 
@synthesize E,M,B,userID,passWord;

-(IBAction)backgroundTap:(id)sender {
	[userID resignFirstResponder];
	[passWord resignFirstResponder];
	
}

-(IBAction)textFieldDoneEditing: (id)sender{
	if (passWord.text.length > 0 && userID.text.length >0)  {
	BoardsViewController*board = [[BoardsViewController alloc]initWithNibName:@"BoardsViewController" 
																	   bundle:nil];
	
	[UIView beginAnimations:@"FadeAnimation" context:nil];
	[UIView setAnimationDuration:0.80];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	
	[UIView setAnimationTransition:
	 UIViewAnimationTransitionFlipFromLeft
						   forView:self.navigationController.view cache:NO];
	
	[UIView commitAnimations];
	
	[self.navigationController pushViewController:board animated:YES];
	}
	
	else 
	{
		[sender resignFirstResponder];
		
	UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"Alert!"
						  message:@"Please enter your userid and password" delegate:nil
						  cancelButtonTitle:@"Okay" otherButtonTitles:nil]; 
	[alert show]; 
	[alert release];	
		
	}
	
}


-(IBAction) loginTouched:(id)sender {
	if (passWord.text.length > 0 && userID.text.length >0)  {
		BoardsViewController*board = [[BoardsViewController alloc]initWithNibName:@"BoardsViewController" 
																		   bundle:nil];
		
		[UIView beginAnimations:@"FadeAnimation" context:nil];
		[UIView setAnimationDuration:0.80];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		
		[UIView setAnimationTransition:
		 UIViewAnimationTransitionFlipFromLeft
							   forView:self.navigationController.view cache:NO];
		
		[UIView commitAnimations];
		
		[self.navigationController pushViewController:board animated:YES];
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:@"Alert!"
							message:@"Please enter your userid and password" delegate:nil
							cancelButtonTitle:@"Okay" otherButtonTitles:nil]; 
		[alert show]; 
		[alert release];	
	}

}

-(void) viewDidLoad {
	[super viewDidLoad];
	
	popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	
	popAnimation.keyTimes = [NSArray arrayWithObjects:
							 [NSNumber numberWithFloat:0.0],
							 [NSNumber numberWithFloat:0.7],
							 [NSNumber numberWithFloat:1.0],
							 nil];
	popAnimation.values = [NSArray arrayWithObjects:
						   [NSNumber numberWithFloat:0.01],
						   [NSNumber numberWithFloat:1.4],
						   [NSNumber numberWithFloat:1.0],
						   nil];
	[popAnimation retain];
	
	
}

-(void) popView: (UIView*)view{
	[view setHidden:NO];
	[[view layer] addAnimation:popAnimation forKey:@"transform.scale"];
}

-(void) viewWillAppear:(BOOL)animated {
	[popAnimation setDuration:0.3];
	[E setHidden:YES];
	[M setHidden:YES];
	[B setHidden:YES];
	[self performSelector:@selector(popView:) 
			   withObject:E
			   afterDelay:0.25];
	[self performSelector:@selector(popView:) 
			   withObject:M 
			   afterDelay:0.3];
	[self performSelector:@selector(popView:) 
			   withObject:B 
			   afterDelay:0.35];
	
	
}


@end

