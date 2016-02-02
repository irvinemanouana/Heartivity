//
//  Session.h
//  Heartivity
//
//  Created by Manouana on 02/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Session : NSObject
-(void)createSession:(Person*)person;
-(void)destroySession;
-(Boolean)sessionExist;

@end
