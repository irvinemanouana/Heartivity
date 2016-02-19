//
//  CreateAccountViewController.m
//  Heartivity
//
//  Created by Manouana on 13/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "ViewController.h"
#import "WebServices.h"
#import "TableViewController.h"
#import <HealthKit/HealthKit.h>

@interface CreateAccountViewController ()
{
    NSString* email;
    NSString* pseudo;
    NSString* password;
    NSString* Confpassword;
    NSDate* date;
    NSString* gender;
    NSInteger weight;
    NSInteger height;
    WebServices* wbs;
}

@end

@implementation CreateAccountViewController

@synthesize inputEmail;
@synthesize inputPass;
@synthesize inputPseudo;
@synthesize inputConfPass;
@synthesize inputWeight;
@synthesize inputHeight;
@synthesize datePicker;
@synthesize segGender;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    wbs = [[WebServices alloc]init];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTouchBack:(id)sender {
    ViewController* controller = [ViewController new];
    [self presentViewController:controller animated:YES completion:nil];
   
}
- (IBAction)onTouchCreate:(id)sender {
    email = inputEmail.text;
    pseudo = inputPseudo.text;
    password = inputPass.text;
    Confpassword = inputConfPass.text;
    //get int from string
    weight = [inputWeight.text intValue];
    height =[inputHeight.text intValue];
    
    //get value from UISegmentedControl
    gender=[segGender titleForSegmentAtIndex:segGender.selectedSegmentIndex];
    date = datePicker.date;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];
    //For Fr format
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    NSString* dateToString = [dateFormat stringFromDate:date];
    NSLog(@"%@, birthday",dateToString);
    [wbs createAccount:gender withpseudo:pseudo withemail:email withbday:dateToString withpassword:password withweight:weight withheight:height];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Bravo" message:@"Votre compte a bien été créer" preferredStyle:UIAlertControllerStyleAlert] ;
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              ViewController* controller = [ViewController new];
                                                              [self.navigationController pushViewController:controller animated:YES];
                                                            
                                                          }];
    
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
     
    
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
