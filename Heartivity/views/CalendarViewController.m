//
//  CalendarViewController.m
//  Heartivity
//
//  Created by Soulier Antoine on 16/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "CalendarViewController.h"
#import <EventKit/EventKit.h>

@interface CalendarViewController ()

@end

@implementation CalendarViewController

@synthesize inputEvent;
@synthesize datePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addEventToCalendar:(id)sender {
    EKEventStore *store = [EKEventStore new];
    EKEvent *event = [EKEvent eventWithEventStore:store];

    event.title = inputEvent.text;;
    event.location = @"";
    event.startDate = datePicker.date;
    event.endDate = [NSDate dateWithTimeInterval:60*60*2 sinceDate:datePicker.date]; // 2 hours from now
    event.calendar = store.defaultCalendarForNewEvents;

    EKAlarm *reminder = [EKAlarm alarmWithRelativeOffset:-2*60*60];
    [event addAlarm:reminder];
    
    NSError *error;
    BOOL saved = [store saveEvent:event span:EKSpanThisEvent error:&error];
    if (saved) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:event.title
                              message:@"L'évènement a été rajouté !"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil,
                              nil];

        [alert show];
    }
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
