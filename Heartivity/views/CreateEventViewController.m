//
//  CreateEventViewController.m
//  Heartivity
//
//  Created by Manouana on 14/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "CreateEventViewController.h"
#import "Session.h"
#import "WebServices.h"
#import "Person.h"

@interface CreateEventViewController ()
{
    @private
    NSString* idUser;
    Session* session;
    WebServices* webs;
    Person* person;
}
@end

@implementation CreateEventViewController

@synthesize Titretextfield = _Titretextfield;
@synthesize Descriptiontextfield = _Descriptiontextfield;
@synthesize ButtonCreate = _ButtonCreate;


- (void)viewDidLoad {
    webs =[[WebServices alloc]init];
    person = [[Person alloc]init];
    session =[[Session  alloc]init];
    [super viewDidLoad];
    CGRect frameRect = _Descriptiontextfield.frame;
    frameRect.size.height = 200;
    _Descriptiontextfield.frame = frameRect;
    
    
    // Do any additional setup after loading the view from its nib.
    
}
- (IBAction)OnCreateEvent:(id)sender {
    person = [session getUserdata];
    if ([_Titretextfield.text isEqual:@""]) {
       NSLog(@"%@",@"title desc");
    }if ([_Descriptiontextfield.text isEqual:@""]) {
        NSLog(@"%@",@"empty desc");
        
    }else{
        idUser = person.id;
        [webs createEvents:_Titretextfield.text withdescription:_Descriptiontextfield.text withId:idUser];
    }
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
