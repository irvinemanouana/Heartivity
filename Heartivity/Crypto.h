//
//  Crypto.h
//  Heartivity
//
//  Created by Manouana on 14/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface Crypto : NSObject
- (NSString *) md5:(NSString *) string;
@end
