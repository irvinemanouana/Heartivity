//
//  CreateAlertViewController.h
//  Heartivity
//
//  Created by Manouana on 16/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CreateAlertViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *LibelleTxt;
@property (weak, nonatomic) IBOutlet UIDatePicker *DateRappel;
-(IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic)CLLocation* location;
@end
