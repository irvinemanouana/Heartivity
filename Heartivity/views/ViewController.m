//
//  ViewController.m
//  Heartivity
//
//  Created by Manouana on 13/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "ViewController.h"
#import "CreateAccountViewController.h"
#import "TableViewController.h"
#import "FollowViewController.h"
#import "WebServices.h"
#import "Session.h"


@interface ViewController ()
{
    @private
    NSString* email;
    NSString* password;
    NSString* errormsg ;
    WebServices* connect;
    Session* session;
}

@end

@implementation ViewController
@synthesize inputEmail;
@synthesize inputPassword;
@synthesize labelError;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    session = [Session new];
    labelError.text = @"";
    
    connect = [WebServices new];

    if ([session sessionExist] == true) {
        TableViewController* tableViewController = [TableViewController new];
        [self.navigationController pushViewController:tableViewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchConnect:(id)sender {
    errormsg = @"Veuillez remplir tous les champs";
    
    email = inputEmail.text;
    password = inputPassword.text;
    
    if ([email isEqual:@""]) {
        labelError.text= errormsg;
        [self.view endEditing:YES];
    } else if ([password isEqual:@""]) {
        labelError.text = errormsg;
        [self.view endEditing:YES];
    } else {
        [connect getInfoUser:email withPassword:password withCompletion:^(BOOL connectionError) {
            errormsg = @"L'identifiant ou le mot de passe est incorrecte.";
            
            if (connectionError) {
                labelError.text= errormsg;
                [self.view endEditing:YES];
            } else {
                TableViewController *tableViewController= [TableViewController new];
                [self presentViewController:tableViewController animated:YES completion:nil];
            }
        }];
    }
}

- (IBAction)onTouchCreatAccount:(id)sender {
    CreateAccountViewController* newAccountPage = [CreateAccountViewController new];
    [self.navigationController pushViewController:newAccountPage animated:YES];
}

@end
