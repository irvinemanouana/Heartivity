//
//  Person.h
//  Heartivity
//
//  Created by Manouana on 16/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>
{
    @private
    NSString* id_;
    NSString* pseudo_;
    NSString* gender_;
    NSString* email_;
    NSDate* birthday_;
    NSNumber* weight_;
    NSNumber* height_;
    NSNumber* imc_;
    
}
@property (nonatomic,strong)NSString* id;
@property (nonatomic,strong)NSString* pseudo;
@property (nonatomic,strong)NSString* email;
@property (nonatomic,strong)NSString* gender;
@property (nonatomic, strong)NSDate* birthday;
@property (nonatomic,strong)NSNumber* weight;
@property (nonatomic,strong)NSNumber* height;
@property (nonatomic,strong)NSNumber* imc;
@end
