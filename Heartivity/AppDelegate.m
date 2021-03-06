//
//  AppDelegate.m
//  Heartivity
//
//  Created by Manouana on 13/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <HealthKit/HealthKit.h>
#import <MapKit/MapKit.h>

@interface AppDelegate ()
    @property (strong, nonatomic) HKHealthStore *healthStore;
@end

@implementation AppDelegate
@synthesize healthStore;

-(void)setupHealthStoreIfPossible{
    if ([HKHealthStore isHealthDataAvailable]) {
        self.healthStore= [[HKHealthStore alloc]init];
        
    }
  
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UINavigationController* nv = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    //nv.navigationBarHidden=YES;
    UIWindow* w = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    w.rootViewController = nv;
    self.window = w;
    [self.window makeKeyAndVisible];
    [CLLocationManager locationServicesEnabled];
    [launchOptions valueForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        
        [application registerUserNotificationSettings:[UIUserNotificationSettings
                                                       settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|
                                                       UIUserNotificationTypeSound categories:nil]];
    }
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {
        // Set icon badge number to zero
        application.applicationIconBadgeNumber = 0;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
      
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Rappel"
                                                        message:notification.alertBody
                                                       delegate:self cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    // Request to reload table view data
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    
    // Set icon badge number to zero
    application.applicationIconBadgeNumber = 0;
}


@end
