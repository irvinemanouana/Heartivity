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
#import "WebServices.h"


@interface ViewController ()
{
    @private
    NSString* email;
    NSString* password;
    NSString* errormsg ;
    WebServices* connect;
}
@end

@implementation ViewController
@synthesize inputEmail;
@synthesize inputPassword;
@synthesize labelError;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    labelError.text = @"";
    connect = [[WebServices alloc ]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTouchConnect:(id)sender {
    errormsg =@"Veuillez remplire tous les champs";
    
    email = inputEmail.text;
    password = inputPassword.text;
    if ([email isEqual:@""]) {
        labelError.text= errormsg;
        [self.view endEditing:YES];
    }else if ([password isEqual:@""]){
        labelError.text = errormsg;
        [self.view endEditing:YES];

    }
    else{
        
        [connect getInfoUser:email withpassword:password];
        NSLog(@"yes");
        //TableViewController *controller= [[TableViewController alloc]init];
        //[self presentViewController:controller animated:YES completion:nil];
        //labelError.text = @"LOL";
    }
    
    
}

- (IBAction)onTouchCreatAccount:(id)sender {
    //change controller
    CreateAccountViewController* newAccountPage = [CreateAccountViewController new];
    [self presentViewController:newAccountPage animated:YES completion:nil];
}

@end
