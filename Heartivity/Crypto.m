//
//  Crypto.m
//  Heartivity
//
//  Created by Manouana on 14/02/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

#import "Crypto.h"

@implementation Crypto
-(NSString *)md5:(NSString *)string{
    const char *strTochar = [string UTF8String];
    unsigned char digest[16];
    CC_MD5(strTochar, strlen(strTochar), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
@end
