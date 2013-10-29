//
//  User.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/25/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "User.h"

@implementation User

- (id)init
{
    return self;
}

- (id)initWithFirstName:(NSString*)firstName AndLastName:(NSString*)lastName AndAddress:(NSString*)address1 AndCity:(NSString*)city AndZip:(NSString*)zip AndPhone:(NSString*)phone AndState:(NSString*)state
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _address1 = address1;
        _city = city;
        _zip = zip;
        _phone = phone;
        _state = state;
    }
    return self;
}

@end
