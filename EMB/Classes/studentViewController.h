//
//  MainMenuViewController.h
//  smb
//
//  Created by Rick Wong on 2/6/11.
//  Copyright 2011 Hwa Chong Institution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "studentMessageViewController.h"

@interface studentViewController : UIViewController {

	studentMessageViewController*messageView;

	IBOutlet UITableView*studentMessages;
	NSArray *sender;
	NSArray *date;
	/*
	IBOutlet UILabel *senderLabel;
	IBOutlet UILabel *dateLabel;
		*/
}/*
@property (nonatomic, retain) IBOutlet UILabel*senderLabel;
@property (nonatomic, retain) IBOutlet UILabel*dateLabel;
*/

@property(nonatomic,retain) studentMessageViewController*messageView;

-(IBAction) boardTouched:(id)sender;

@end
