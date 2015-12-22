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
    NSString* pseudo_;
    NSString* gender_;
    NSString* email_;
    NSDate* birthday_;
    NSInteger weight_;
    NSInteger height_;
    NSInteger imc_;
    
}
@property (nonatomic,strong)NSString* pseudo;
@property (nonatomic,strong)NSString* email;
@property (nonatomic,strong)NSString* gender;
@property (nonatomic, strong)NSDate* birthday;
@property (nonatomic,assign)NSInteger weight;
@property (nonatomic,assign)NSInteger height;
@property (nonatomic,assign)NSInteger imc;

@end
