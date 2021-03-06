//
//  RegisterViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/21/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "RegisterViewController.h"
#import "CatalogViewController.h"
#import "User.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    self.statesArray = [NSArray arrayWithObjects:@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming", nil];
    
    self.statePicker.delegate = self;
    self.statePicker.dataSource = self;
    [self.statePicker reloadAllComponents];
    
    self.firstName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.lastName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.address1.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.city.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.zip.keyboardType = UIKeyboardTypeNumberPad;
    self.phone.keyboardType = UIKeyboardTypePhonePad;
    
//    // Get the stored data before the view loads
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *firstNameText = [defaults objectForKey:@"firstName"];
//    NSString *lastNameText = [defaults objectForKey:@"lastname"];
//    NSString *address1Text = [defaults objectForKey:@"address1"];
//    NSString *cityText = [defaults objectForKey:@"city"];
//    NSString *zipText = [defaults objectForKey:@"zip"];
//    NSString *phoneText = [defaults objectForKey:@"phone"];
//    int stateNumber = [defaults integerForKey:@"state"];
//    
//    // Update the UI elements with the saved data
//    [self.firstName setText:firstNameText];
//    [self.lastName setText:lastNameText];
//    [self.address1 setText:address1Text];
//    [self.city setText:cityText];
//    [self.zip setText:zipText];
//    [self.phone setText:phoneText];
//    [self.statePicker selectRow:stateNumber inComponent:0 animated:YES];
    
    UIControl *viewControl = (UIControl*)self.view;
    [viewControl addTarget:self action:@selector(dismissKeyboard:) forControlEvents:UIControlEventTouchDown];
    [self.firstName addTarget:self action:@selector(clearHint:) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender
{
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.address1 resignFirstResponder];
    [self.city resignFirstResponder];
    [self.zip resignFirstResponder];
    [self.phone resignFirstResponder];
}

- (IBAction)clearHint:(UITextField *)sender {
//    NSLog(@"%@", sender.font.familyName);
//    if ([sender.font.familyName isEqual: @".Helvetica Neue Interface"] && sender.font.pointSize == 12.0) {
//        [sender setText:@""];
//        [sender setFont:[UIFont fontWithName:@"System" size:14.0]];
//        [sender setTextColor:[UIColor blackColor]];
//    }
}

- (IBAction)save:(id)sender {
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.address1 resignFirstResponder];
    [self.city resignFirstResponder];
    [self.zip resignFirstResponder];
    [self.phone resignFirstResponder];
    
    NSString *firstNameText = [self.firstName text];
    NSString *lastNameText  = [self.lastName text];
    NSString *address1Text = [self.address1 text];
    NSString *cityText = [self.city text];
    NSString *zipText = [self.zip text];
    NSString *phoneText = [self.phone text];
    NSInteger row = [self.statePicker selectedRowInComponent:0];
//    NSString *stateText = [self.statesArray objectAtIndex:row];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:firstNameText forKey:@"firstName"];
    [defaults setObject:lastNameText forKey:@"lastname"];
    [defaults setObject:address1Text forKey:@"address1"];
    [defaults setObject:cityText forKey:@"city"];
    [defaults setObject:zipText forKey:@"zip"];
    [defaults setObject:phoneText forKey:@"phone"];
    [defaults setInteger:row forKey:@"state"];
    [defaults synchronize];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"RegisterSegue"])
    {
        // Get reference to the destination view controller
        CatalogViewController *vc = [segue destinationViewController];
        
        NSInteger row = [self.statePicker selectedRowInComponent:0];
        NSString *stateText = [self.statesArray objectAtIndex:row];
        
        User *newUser = [[User alloc] initWithFirstName:[self.firstName text]
                                            AndLastName:[self.lastName text]
                                             AndAddress:[self.address1 text]
                                                AndCity:[self.city text]
                                                 AndZip:[self.zip text]
                                               AndPhone:[self.phone text]
                                               AndState:stateText];
        
        self.currentUser = newUser;
        
        // Pass any objects to the view controller here, like...
        [vc setCurrentUser:self.currentUser];
    }
}

#pragma mark -
#pragma mark PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    if (self.statesArray != nil) {
        return [self.statesArray count];
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.statesArray != nil) {
        return [self.statesArray objectAtIndex:row];
    }
    return @"";
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //Do something based on selected row
}

@end
