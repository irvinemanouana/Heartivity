//
//  ProfileViewController.m
//  Heartivity
//
//  Created by Soulier Antoine on 20/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "ProfileViewController.h"
#import "Session.h"
#import "Person.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize segGender;
@synthesize email;
@synthesize pseudo;
@synthesize date;
@synthesize weight;
@synthesize height;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Session* session = [Session new];
    
    if ([session sessionExist] == true) {
        Person* p = [session getUserdata];
        email.text = p.email;
        pseudo.text = p.pseudo;
    	if ([p.gender isEqual: @"Homme"]) {
            [segGender setSelectedSegmentIndex:0];
        } else {
            [segGender setSelectedSegmentIndex:1];
        }
        // date.date = p.birthday;

        NSNumberFormatter *f = [NSNumberFormatter new];
        f.numberStyle = NSNumberFormatterDecimalStyle;
    
        weight.text = [p.weight stringValue];
        height.text = [p.height stringValue];
    }
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
