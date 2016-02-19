//
//  AppDelegate.h
//  Heartivity
//
//  Created by Manouana on 13/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HealthKit/HealthKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


-(void)setupHealthStoreIfPossible;

@end

