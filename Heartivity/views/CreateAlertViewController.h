//
//  CreateAlertViewController.h
//  Heartivity
//
//  Created by Manouana on 16/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAlertViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *LibelleTxt;
@property (weak, nonatomic) IBOutlet UIDatePicker *DateRappel;
-(IBAction)save:(id)sender;
@end
