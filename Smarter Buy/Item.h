//
//  Item.h
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSURL *itemDescription;
@property (strong, nonatomic) UIImage *itemImage;

- (id)initWithItemName:(NSString*)itemName AndItemDescription:(NSString*)itemDescURL AndImage:(NSString*)itemImage;

@end
