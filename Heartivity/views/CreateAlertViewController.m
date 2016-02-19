//
//  CreateAlertViewController.m
//  Heartivity
//
//  Created by Manouana on 16/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "CreateAlertViewController.h"

@interface CreateAlertViewController ()

@end

@implementation CreateAlertViewController
@synthesize LibelleTxt = _LibelleTxt;
@synthesize DateRappel = _DateRappel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIApplication* objApp = [UIApplication sharedApplication];
    NSArray*    oldNotifications = [objApp scheduledLocalNotifications];
    NSLog(@" oldNotifications : %@",oldNotifications);
    UILocalNotification* local;
    for (int i =0; i<[oldNotifications count]; i++) {
        local= [oldNotifications objectAtIndex:i];
        NSLog(@"Object at index %d for date :%@",i,local);
    }
    //[objApp cancelAllLocalNotifications];
 
    //NSLog(@" oldNotifications 2 : %@",oldNotifications);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)save:(id)sender{
    
    NSDate* dateTime = _DateRappel.date;
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    // fireDate - The time when the notification is delivered. We set it here on 5 seconds.
    localNotification.fireDate = dateTime;
    //alertBody - The message displayed in the notification alert.
    localNotification.alertBody = _LibelleTxt.text;
    localNotification.category = @"INVITE_CATEGORY";
    //timeZone - The time zone of the notfication's fire date
    localNotification.timeZone =[NSTimeZone defaultTimeZone];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.alertTitle = @"";
    //applicationIconBadgeNumber - The number to diplay on the icon badge. We will increment this number by one.
    localNotification.applicationIconBadgeNumber =[[UIApplication sharedApplication] applicationIconBadgeNumber]+ 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    [[[self presentingViewController] presentingViewController]  dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
