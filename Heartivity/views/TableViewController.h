//
//  TableViewController.h
//  Heartivity
//
//  Created by Manouana on 24/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITabBarControllerDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tablemenu;

@end
