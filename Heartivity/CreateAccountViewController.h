//
//  CreateAccountViewController.h
//  Heartivity
//
//  Created by Manouana on 13/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAccountViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputEmail;
@property (weak, nonatomic) IBOutlet UITextField *inputPseudo;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *inputPass;
@property (weak, nonatomic) IBOutlet UITextField *inputConfPass;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segGender;

@property (weak, nonatomic) IBOutlet UITextField *inputWeight;
@property (weak, nonatomic) IBOutlet UITextField *inputHeight;
@end
