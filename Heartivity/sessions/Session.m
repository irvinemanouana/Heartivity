//
//  Session.m
//  Heartivity
//
//  Created by Manouana on 02/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "Session.h"

@implementation Session


-(void)createSession:(Person *)person{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    [defaultUser setBool:TRUE forKey:@"firstRun"];
    [defaultUser setValue:person.id forKey:@"id"];
    [defaultUser setValue:person.pseudo forKey:@"pseudo"];
    [defaultUser setValue:person.email forKey:@"email"];
    [defaultUser setValue:person.gender forKey:@"gender"];
    [defaultUser setObject:person.birthday forKey:@"birth"];
    [defaultUser setObject:person.weight forKey:@"weight"];
    [defaultUser setObject:person.height forKey:@"height"];
    [defaultUser setObject:person.imc forKey:@"imc"];
    [defaultUser synchronize];
    NSLog(@"%@",@"lol");
     NSLog(@"%@",[defaultUser objectForKey:@"id"]);

}
-(Person*)getUserdata{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    Person* p =[[Person alloc]init];
    p.id =[defaultUser stringForKey:@"id"];
    p.pseudo = [defaultUser  stringForKey:@"pseudo"];
    p.email = [defaultUser  stringForKey:@"email"];
    p.birthday =[defaultUser  objectForKey:@"birth"];
    p.gender = [defaultUser stringForKey:@"gender"];
    p.weight = [defaultUser objectForKey:@"weight"];
    p.height = [defaultUser objectForKey:@"height"];
    p.imc =[defaultUser objectForKey:@"imc"];
    return p;
}


-(void)destroySession{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    
    [defaultUser removeObjectForKey:@"id"];
    [defaultUser removeObjectForKey:@"pseudo"];
    [defaultUser removeObjectForKey:@"email"];
    [defaultUser removeObjectForKey:@"gender"];
    [defaultUser removeObjectForKey:@"birth"];
    [defaultUser removeObjectForKey:@"weight"];
    [defaultUser removeObjectForKey:@"height"];
    [defaultUser removeObjectForKey:@"imc"];
    [defaultUser synchronize];
   
    
}

-(Boolean)sessionExist{
    Person* user = [self getUserdata];
    NSLog(@"%@, %@",user.pseudo,user.gender);
    if (user.id==NULL) {
        return false;
    }else{
        return  true;
    }
    
}

@end
