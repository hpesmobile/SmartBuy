//
//  RegisterViewController.h
//  Smarter Buy
//
//  Created by Sean McDonald on 10/21/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface RegisterViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *address1;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zip;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIPickerView *statePicker;
@property (strong, nonatomic) NSArray *statesArray;
@property (strong, nonatomic) User *currentUser;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)save:(id)sender;
- (IBAction)clearHint:(UITextField *)sender;

@end
