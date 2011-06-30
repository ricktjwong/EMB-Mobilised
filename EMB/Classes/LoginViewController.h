//
//  RootViewController.h
//  smb
//
//  Created by Rick Wong on 1/26/11.
//  Copyright Hwa Chong Institution 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController : UIViewController <UIActionSheetDelegate>{
	
	IBOutlet UIButton* E;
	IBOutlet UIButton* M;
	IBOutlet UIButton* B;
	
	IBOutlet UITextField* userID;
	IBOutlet UITextField* passWord;
	CAKeyframeAnimation* popAnimation;
}

@property (nonatomic, retain) UIButton*E;
@property (nonatomic, retain) UIButton*M;
@property (nonatomic, retain) UIButton*B;
@property (nonatomic, retain) UITextField*userID;
@property (nonatomic, retain) UITextField*passWord;

-(IBAction)loginTouched:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)textFieldDoneEditing: (id)sender;


@end
