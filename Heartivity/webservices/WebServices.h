//
//  WebServices.h
//  Heartivity
//
//  Created by Manouana on 03/12/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject

- (void) createAccount:(NSString*)gender withPseudo:(NSString*)pseudo withEmail:(NSString*)email withBday:(NSString*)birthday withPassword:(NSString*)password withWeight:(int)weight withHeight:(int)height;
// - (void) getInfoUser:(NSString*)email withPassword:(NSString*)password;
- (void)getInfoUser:(NSString*) email withPassword:(NSString*)password withCompletion:(void(^)(BOOL exists)) completion;


- (NSDate*) convertStringToDate:(NSString*)StringDate;
@end
