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

- (IBAction)placeOrder:(id)sender {
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    // NSTimeInterval is defined as double
    NSNumber *timeStampObj = [NSNumber numberWithDouble: timeStamp];
    
    NSString *post = [NSString stringWithFormat:@"firstName=%@&lastName=%@&address=%@&city=%@&state=%@&zip=%@&itemName=%@&timestamp=%@",
                      [self urlEncodeValue:[self.currentUser firstName]],
                      [self urlEncodeValue:[self.currentUser lastName]],
                      [self urlEncodeValue:[self.currentUser address1]],
                      [self urlEncodeValue:[self.currentUser city]],
                      [self urlEncodeValue:[self.currentUser state]],
                      [self urlEncodeValue:[self.currentUser zip]],
                      [self urlEncodeValue:[self.currentItem itemName]],
                      timeStampObj];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://posttestserver.com/post.php"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //start the connection
    [connection start];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    int code = [httpResponse statusCode];
    if (code == 200) {
        NSLog(@"POST Successful");
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Order Status"
                                                          message:@"Your order posted to the server successfully."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Order Status"
                                                          message:@"Your order posted to the server failed!"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
}

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8));
    return result;
}

@end
