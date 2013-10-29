//
//  User.h
//  Smarter Buy
//
//  Created by Sean McDonald on 10/25/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *zip;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *state;

- (id)initWithFirstName:(NSString*)firstName AndLastName:(NSString*)lastName AndAddress:(NSString*)address1 AndCity:(NSString*)city AndZip:(NSString*)zip AndPhone:(NSString*)phone AndState:(NSString*)state;
@end
