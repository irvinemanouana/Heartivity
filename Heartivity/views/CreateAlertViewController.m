//
//  CreateAlertViewController.m
//  Heartivity
//
//  Created by Manouana on 16/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "CreateAlertViewController.h"
#import <AddressBook/AddressBook.h>
#import "AlertTableViewController.h"
@interface CreateAlertViewController ()

@end

@implementation CreateAlertViewController
@synthesize LibelleTxt = _LibelleTxt;
@synthesize DateRappel = _DateRappel;
@synthesize mapview= _mapview;
@synthesize locationManager = _locationManager;
@synthesize location = _location;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate =self;
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)mylocation:(id)sender{
    float spanX = 0.00725;
    float spanY = 0.00725;
    self.location = self.locationManager.location;
    NSLog(@"%@", self.location.description); //A quick NSLog to show us that location data is being received.
    MKCoordinateRegion region;
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span = MKCoordinateSpanMake(spanX, spanY);
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.mapview setRegion:region animated:NO];
    [self getAdress:self.location];
}

    - (void)getAdress:(CLLocation *)location {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Finding address");
            if (error) {
                NSLog(@"Error %@", error.description);
            } else {
               CLPlacemark *placemark = [placemarks lastObject];
                [NSString stringWithFormat:@"%@", ABCreateStringWithAddressDictionary(placemark.addressDictionary, NO)];
            }
        }];
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
    //AlertTableViewController* alert =[[AlertTableViewController alloc]init];
    
    //[[[self presentingViewController] presentingViewController]  dismissViewControllerAnimated:YES completion:nil];
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
