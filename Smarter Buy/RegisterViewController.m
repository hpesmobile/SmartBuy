//
//  RegisterViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/21/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "RegisterViewController.h"

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
    
    // Get the stored data before the view loads
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstNameText = [defaults objectForKey:@"firstName"];
    NSString *lastNameText = [defaults objectForKey:@"lastname"];
    NSString *address1Text = [defaults objectForKey:@"address1"];
    NSString *cityText = [defaults objectForKey:@"city"];
    NSString *zipText = [defaults objectForKey:@"zip"];
    NSString *phoneText = [defaults objectForKey:@"phone"];
    
    // Update the UI elements with the saved data
    [self.firstName setText:firstNameText];
    [self.lastName setText:lastNameText];
    [self.address1 setText:address1Text];
    [self.city setText:cityText];
    [self.zip setText:zipText];
    [self.phone setText:phoneText];
//    [self.statePicker selectedRowInComponent:0];
    
    UIControl *viewControl = (UIControl*)self.view;
    [viewControl addTarget:self action:@selector(dismissKeyboard:) forControlEvents:UIControlEventTouchDown];
	// Do any additional setup after loading the view.
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:firstNameText forKey:@"firstName"];
    [defaults setObject:lastNameText forKey:@"lastname"];
    [defaults setObject:address1Text forKey:@"address1"];
    [defaults setObject:cityText forKey:@"city"];
    [defaults setObject:zipText forKey:@"zip"];
    [defaults setObject:phoneText forKey:@"phone"];
    [defaults synchronize];
    NSLog(@"Data saved");
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
        NSLog(@"Array count: %lu", (unsigned long)[self.statesArray count]);
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
    NSLog(@"You selected this: %@", [self.statesArray objectAtIndex:row]);
}

@end
