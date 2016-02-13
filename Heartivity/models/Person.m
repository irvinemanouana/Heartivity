//
//  Person.m
//  Heartivity
//
//  Created by Manouana on 16/11/2015.
//  Copyright © 2015 Manouana. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize id = id_;
@synthesize gender=gender_;
@synthesize pseudo = pseudo_;
@synthesize email = email_;
@synthesize birthday= birthday_;
@synthesize weight= weight_;
@synthesize height=height_;
@synthesize imc=imc_;

- (id)copyWithZone:(NSZone *)zone{
    Person *p = [[[self class] allocWithZone:zone ]init];
    p.pseudo =[self.pseudo copy];
    p.email =[self.email copy];
    p.birthday=[self.birthday copy];
    return p;
}


@end
