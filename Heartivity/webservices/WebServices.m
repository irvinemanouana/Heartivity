//
//  WebServices.m
//  Heartivity
//
//  Created by Manouana on 03/12/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "WebServices.h"


@implementation WebServices


-(void)createAccount:(NSString *)gender withpseudo:(NSString *)pseudo withemail:(NSString *)email withpassword:(NSString *)password withweight:(int)weight withheight:(int)height{
    
    NSString* url = [NSString stringWithFormat:@"http://localhost:3000/user/%@/%@/%@/%@/%d/%d",gender,pseudo,email,password,weight,height];
    dispatch_queue_t queue = dispatch_queue_create("connection queue", NULL);
    dispatch_async(queue, ^{
        NSURL* URL = [NSURL URLWithString:url];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"POST"];
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
    NSString* url = [NSString stringWithFormat:@"localhost:3000/user/%@/%@",email,password];
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    dispatch_async(queue, ^{
        NSURL* URL = [NSURL URLWithString:url];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
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
