//
//  ProfileViewController.m
//  Heartivity
//
//  Created by Manouana on 04/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "ProfileViewController.h"
#import "Session.h"
#import "Person.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*Session* session = [[Session alloc]init];
    if ([session sessionExist]==true) {
     NSLog(@"%@",@"true");
    }else{
         NSLog(@"%@",@"false");
    }*/
    /*Person* p = [session getUserdata];
    NSString* pseudo =p.pseudo;*/
   
    //labelgender.text = p.gender;
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
