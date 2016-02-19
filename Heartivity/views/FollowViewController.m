//
//  FollowViewController.m
//  Heartivity
//
//  Created by Manouana on 07/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "FollowViewController.h"
#import "Session.h"
#import "Person.h"

@interface FollowViewController ()
{
    Session* session;
    Person* person;

}

@end

@implementation FollowViewController

@synthesize imcLabel;
@synthesize heightLabel;
@synthesize weightLabe;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    session = [[Session alloc]init];
    person = [session  getUserdata];
    CGFloat val = person.imc.floatValue;
    CGFloat imc = floorf(val * 100);
    NSLog(@"%f imc ",imc);
    imcLabel.text =[NSString stringWithFormat:@"%f",imc];
    heightLabel.text = person.height.stringValue;
    weightLabe.text = person.weight.stringValue;
    
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
