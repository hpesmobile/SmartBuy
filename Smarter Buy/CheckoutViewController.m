//
//  CheckoutViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController

@synthesize currentItem, currentUser;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.userLabel setText:[NSString stringWithFormat:@"%@ %@\n%@\n%@, %@ %@",
                             [self.currentUser firstName],
                             [self.currentUser lastName],
                             [self.currentUser address1],
                             [self.currentUser city],
                             [self.currentUser state],
                             [self.currentUser zip]]];
    double tax = [self.currentItem.itemPrice doubleValue] * 0.06; // get tax value for state
    [self.itemLabel setText:[NSString stringWithFormat:@"%@\nPrice: $%@\nTax: $%.2f",
                             [self.currentItem itemName],
                             [self.currentItem itemPrice],
                             tax]];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIImage *image = (UIImage *)self.currentItem.itemImage;
    image = self.currentItem.itemImage;
    UIImageView *imageView = self.itemImage;
    [imageView setFrame:self.checkoutScrollView.bounds];
    [imageView setClipsToBounds:YES];
    [imageView setImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.checkoutScrollView addSubview:imageView];
    [self.checkoutScrollView setContentSize:[image size]];
    [self.checkoutScrollView insertSubview:self.itemDesc belowSubview:self.itemImage];
    [self.checkoutScrollView insertSubview:self.itemLabel belowSubview:self.itemDesc];
    [self.checkoutScrollView insertSubview:self.shippingInfo belowSubview:self.itemLabel];
    [self.checkoutScrollView insertSubview:self.userLabel belowSubview:self.shippingInfo];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
