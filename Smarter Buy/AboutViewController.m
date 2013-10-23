//
//  AboutViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/23/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    self.phone.userInteractionEnabled = YES;
    self.email.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [touches anyObject];
    
    if (touch.view.tag == 1) {
        NSURL *url = [NSURL URLWithString:@"tel://1-555-555-5555"];
        [[UIApplication sharedApplication] openURL:url];
    }
    
    if (touch.view.tag == 2) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://smarterbuy@hp.com"]];
        NSLog(@"Opened email program");
    }
        
}

@end
