//
//  UserSingleton.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/27/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+ (id)sharedManager {
    static UserManager *sharedUserManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserManager = [[self alloc] init];
    });
    return sharedUserManager;
}

- (id)init {
    if (self = [super init]) {
        //initial values
        
    }
    return self;
}

@end
