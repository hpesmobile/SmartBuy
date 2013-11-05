//
//  AboutViewController.h
//  Smarter Buy
//
//  Created by Sean McDonald on 10/23/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *email;

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;

@end
