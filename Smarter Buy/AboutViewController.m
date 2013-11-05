//
//  AboutViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 11/5/13.
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
//    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    NSString *version    = infoDictionary[(NSString*)kCFBundleVersionKey];
//    NSString *bundleName = infoDictionary[(NSString *)kCFBundleNameKey];
    [self.versionLabel setText:[NSString stringWithFormat:@"Version %@", version]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
