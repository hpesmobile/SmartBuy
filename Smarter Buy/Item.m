//
//  Item.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id)initWithItemName:(NSString*)itemName AndItemPrice:(NSNumber*)itemPrice AndImage:(NSString*)itemImage {
    self = [super init];
    if (self) {
        _itemName = itemName;
        _itemPrice = itemPrice;
        _itemImage = [UIImage imageNamed:itemImage];
    }
    return self;
}

@end
