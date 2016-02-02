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
    [defaultUser setBool:true forKey:@"exist"];
    [defaultUser setValue:person.id forKey:@"id"];
    [defaultUser setValue:person.pseudo forKey:@"pseudo"];
    [defaultUser setValue:person.email forKey:@"email"];
    [defaultUser setValue:person.gender forKey:@"gender"];
    [defaultUser setObject:person.birthday forKey:@"birth"];
    [defaultUser setObject:person.weight forKey:@"weight"];
    [defaultUser setObject:person.height forKey:@"height"];
    [defaultUser setObject:person.imc forKey:@"imc"];
    [defaultUser synchronize];

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
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    if (![[defaultUser stringForKey:@"id"] isEqualToString:@""]){
        NSLog(@"%@",@"true");
        return true;
    }else{
        NSLog(@"%@",@"false");
        return false;
    }
}

@end
