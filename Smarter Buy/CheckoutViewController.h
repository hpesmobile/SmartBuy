//
//  CheckoutViewController.h
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Item.h"

@interface CheckoutViewController : UIViewController {
}

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UIButton *orderButton;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *shippingInfo;
@property (weak, nonatomic) IBOutlet UILabel *itemDesc;
@property (weak, nonatomic) IBOutlet UIScrollView *checkoutScrollView;

- (IBAction)placeOrder:(id)sender;

@property (strong, nonatomic) User *currentUser;
@property (strong , nonatomic) Item *currentItem;

@end
