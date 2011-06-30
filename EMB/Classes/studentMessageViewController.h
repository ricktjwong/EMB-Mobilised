//
//  studentMessageViewController.h
//  EMB
//
//  Created by Rick Wong on 6/7/11.
//  Copyright 2011 Hwa Chong Institution. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface studentMessageViewController : UIViewController {

	IBOutlet UIWebView* embWeb;
	

}

@property(nonatomic, retain) UIWebView* embWeb;
-(IBAction) studentViewTouched:(id)sender;


@end
