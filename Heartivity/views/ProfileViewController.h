//
//  ProfileViewController.h
//  Heartivity
//
//  Created by Soulier Antoine on 20/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UISegmentedControl *segGender;
    @property (weak, nonatomic) IBOutlet UITextField *email;
    @property (weak, nonatomic) IBOutlet UITextField *pseudo;
    @property (weak, nonatomic) IBOutlet UIDatePicker *date;
    @property (weak, nonatomic) IBOutlet UITextField *weight;
    @property (weak, nonatomic) IBOutlet UITextField *height;
@end
