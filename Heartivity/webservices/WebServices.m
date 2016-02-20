//
//  WebServices.m
//  Heartivity
//
//  Created by Manouana on 03/12/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "WebServices.h"
#import "Person.h"
#import "Session.h"

@implementation WebServices
{
    Session* userSession;
}

- (NSDate *)convertStringToDate:(NSString *)StringDate{
    NSDateFormatter *dateFormatter =[NSDateFormatter new];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];

    NSDate *dateFromString = [NSDate new];
    dateFromString = [dateFormatter dateFromString:StringDate];
    
    return dateFromString;
}

- (void)createAccount:(NSString *)gender withPseudo:(NSString *)pseudo withEmail:(NSString *)email withBday:(NSString*)birthday withPassword:(NSString *)password withWeight:(int)weight withHeight:(int)height {

    NSString* url = [NSString stringWithFormat:@"http://localhost:3000/user/%@/%@/%@/%@/%@/%d/%d",
                     gender,
                     pseudo,
                     email,
                     birthday,
                     password,
                     weight,
                     height];
    
    dispatch_queue_t queue = dispatch_queue_create("connection queue", NULL);
    
    dispatch_async(queue, ^
    {
        NSURL* URL = [NSURL URLWithString:url];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"POST"];
        
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];

        if (!error) {
            NSString* str =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
        } else {
            NSLog(@"%@",@"error");
        }
    });
}

- (void) updateAccount:(NSString*)gender withPseudo:(NSString*)pseudo withEmail:(NSString*)email withBday:(NSString*)birthday withPassword:(NSString*)password withWeight:(int)weight withHeight:(int)height {
    
    NSString* url = [NSString stringWithFormat:@"http://localhost:3000/user/%@/%@/%@/%@/%@/%d/%d",
                     gender,
                     pseudo,
                     email,
                     birthday,
                     password,
                     weight,
                     height];
    
    dispatch_queue_t queue = dispatch_queue_create("connection queue", NULL);
    
    dispatch_async(queue, ^
    {
        NSURL* URL = [NSURL URLWithString:url];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"POST"];
                       
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];

        if (!error) {
            NSString* str =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
        } else {
            NSLog(@"%@",@"error");
        }
    });
}



- (void)getInfoUser:(NSString *)email withPassword:(NSString *)password withCompletion:(void(^)(BOOL connectionError)) completion {
  
    NSString* url = [NSString stringWithFormat:@"http://localhost:3000/user/%@/%@",
                     email,
                     password];

    dispatch_queue_t queue = dispatch_queue_create("get info queue", NULL);
    dispatch_async(queue, ^
    {
        NSURL* URL = [NSURL URLWithString: url];
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"GET"];
        
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        BOOL loginError = NO;
        
        if (!error) {
            userSession = [Session new];
            NSDictionary* jsonDictData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

            
            Person *p  = [Person new];
            p.id       = [jsonDictData objectForKey:@"_id"];
            p.pseudo   = [jsonDictData objectForKey:@"pseudo"];
            p.gender   = [jsonDictData objectForKey:@"gender"];
            p.email    = [jsonDictData objectForKey:@"email"];
            p.weight   = [jsonDictData objectForKey:@"weight"];
            p.height   = [jsonDictData objectForKey:@"height"];
            p.imc      = [jsonDictData objectForKey:@"imc"];
            p.birthday = [jsonDictData objectForKey:@"bday"];
            
            [userSession createSession:p];
        } else {
            loginError = YES;
        }

        dispatch_async(dispatch_get_main_queue(), ^ {
            completion(loginError);
        });
    });
}

@end
