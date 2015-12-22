//
//  WebServices.h
//  Heartivity
//
//  Created by Manouana on 03/12/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject

-(void)createAccount:(NSString*)gender withpseudo:(NSString*)pseudo withemail:(NSString*)email withpassword:(NSString*)password withweight:(int)weight withheight:(int)height;
-(void)getInfoUser:(NSString*)email withpassword:(NSString*)password;
@end
