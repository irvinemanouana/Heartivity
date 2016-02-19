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


-(NSDate *)convertStringToDate:(NSString *)StringDate{
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:StringDate];
    return dateFromString;
}
-(void)createAccount:(NSString *)gender withpseudo:(NSString *)pseudo withemail:(NSString *)email withbday:(NSString*)birthday withpassword:(NSString *)password withweight:(int)weight withheight:(int)height{
    
    NSString* url = @"http://localhost:8080/api/users";
    NSString* stringJson = [NSString stringWithFormat:@"{\"gender\":\"%@\",\"pseudo\":\"%@\",\"email\":\"%@\",\"bday\":\"%@\",\"password\":\"%@\",\"height\":\"%d\",\"weight\":\"%d\"}",gender,pseudo,email,birthday,password,height,weight];
    NSLog(@"String to json %@",stringJson);
    NSData *postData = [stringJson dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    dispatch_queue_t queue = dispatch_queue_create("connection queue", NULL);
    dispatch_async(queue, ^{
        NSURL* URL = [NSURL URLWithString:url];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        if (!error) {
            NSString* str =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
        }else{
            NSLog(@"%@",@"error");
        }
        
    });
}
-(void)getInfoUser:(NSString *)email withpassword:(NSString *)password{
  
    NSString* url = [NSString stringWithFormat:@"http://localhost:8080/api/users/%@/%@",email,password];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL* URL = [NSURL URLWithString: url];
        NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"GET"];
        NSError* error = nil;
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        if (!error) {
            userSession = [[Session alloc]init];
            NSDictionary* jsonDictData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSLog(@"%@",[jsonDictData description]);
            Person *p = [[Person alloc]init];
            p.id =[jsonDictData objectForKey:@"_id"];
            p.pseudo = [jsonDictData objectForKey:@"pseudo"];
            p.gender =[jsonDictData objectForKey:@"gender"];
            p.email = [jsonDictData objectForKey:@"email"];
            p.weight =[jsonDictData objectForKey:@"weight"];
            p.height = [jsonDictData objectForKey:@"height"];
            p.imc =[jsonDictData objectForKey:@"imc"];
            p.birthday=[jsonDictData objectForKey:@"bday"];
            
            [userSession createSession:p];
            Person* person=  [userSession getUserdata];
             NSLog(@"%@",person.pseudo);
          
        }else{
            NSLog(@"%@",@"error");
        }
        
    });

}
-(void)createEvents:(NSString *)title withdescription:(NSString *)description withId:(NSString *)id{
   
        NSString* url = @"http://localhost:8080/api/events";
        NSString* stringJson = [NSString stringWithFormat:@"{\"title\":\"%@\",\"desc\":\"%@\",\"userId\":\"%@\"}",title,description,id];
        NSLog(@"String to json %@",stringJson);
        NSData *postData = [stringJson dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        dispatch_queue_t queue = dispatch_queue_create("connection queue", NULL);
        dispatch_async(queue, ^{
            NSURL* URL = [NSURL URLWithString:url];
            NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
            [request setHTTPMethod:@"POST"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSError* error = nil;
            NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
            if (!error) {
                NSString* str =[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"%@",str);
            }else{
                NSLog(@"%@",@"error");
            }
            
        });
}

@end
