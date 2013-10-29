//
//  Item.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id)initWithItemName:(NSString*)itemName AndItemDescription:(NSString*)itemDescURL AndImage:(NSString*)itemImage {
    self = [super init];
    if (self) {
        _itemName = itemName;
        _itemDescription = [NSURL URLWithString:[itemDescURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        _itemImage = [UIImage imageNamed:itemImage];
    }
    return self;
}

@end
