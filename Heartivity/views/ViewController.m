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
#import "Session.h"
#import "Crypto.h"


@interface ViewController ()
{
    @private
    NSString* email;
    NSString* password;
    NSString* errormsg ;
    WebServices* connect;
    Session* session;
    Crypto* md5;
    
    
}

@end

@implementation ViewController
@synthesize inputEmail;
@synthesize inputPassword;
@synthesize labelError;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    session = [[Session alloc]init];
    md5 = [[Crypto alloc]init];
    labelError.text = @"";
    connect = [[WebServices alloc ]init];
    TableViewController* tab = [[TableViewController alloc]init];
 
    if ([session sessionExist]==true) {
        [self.navigationController pushViewController:tab animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationItem.hidesBackButton = TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTouchConnect:(id)sender {
    errormsg =@"Veuillez remplire tous les champs";
    
    email = inputEmail.text;
    password = [md5 md5:inputPassword.text];
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
        if ([session sessionExist]==TRUE) {
            NSLog(@"%@",@"true");
        }else{
            NSLog(@"%@",@"false");
        }
        //TableViewController *controller= [[TableViewController alloc]init];
        //[self presentViewController:controller animated:YES completion:nil];
        //labelError.text = @"LOL";
    }
    
    
}

- (IBAction)onTouchCreatAccount:(id)sender {
    //change controller
    CreateAccountViewController* newAccountPage = [CreateAccountViewController new];
    //[self presentViewController:newAccountPage animated:YES completion:nil];
    [self.navigationController pushViewController:newAccountPage animated:YES];
}

@end
