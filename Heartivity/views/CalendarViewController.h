//
//  CalendarViewController.h
//  Heartivity
//
//  Created by Soulier Antoine on 16/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *inputEvent;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
