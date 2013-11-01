//
//  CatalogViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "CatalogViewController.h"

@interface CatalogViewController ()

@end

@implementation CatalogViewController

@synthesize currentUser, currentItem;

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
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"catalog" ofType:@"plist"];
    NSDictionary *tempPlist = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    _plist = [tempPlist mutableCopy];
    
    NSInteger row = [self getCurrentRow];
    [self.itemPicker selectRow:row inComponent:0 animated:YES];
    [self updateImage:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if ([_plist allKeys] != nil) {
        return [[_plist allKeys] count];
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([_plist allKeys] != nil) {
        return [self getCurrentItem:row];
    }
    return @"";
}

#pragma mark -
#pragma mark PickerView Delegate
- (void)updateImage:(NSInteger)row
{
    NSString *imageName = [[_plist objectForKey:[[_plist allKeys] objectAtIndex:row]] objectForKey:@"Picture"];
    [self.itemImage setImage:[UIImage imageNamed:imageName]];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self updateImage:row];
    [_itemPicker reloadAllComponents];
}

- (NSInteger)getCurrentRow
{
    NSInteger row = [_itemPicker selectedRowInComponent:0];
    return row;
}

- (id)getCurrentItem:(NSInteger)row
{
    return [[_plist allKeys] objectAtIndex:row];
}

#pragma mark -
#pragma mark Segue Methods
- (IBAction)selectItem:(id)sender {
    NSInteger row = [self getCurrentRow];
    NSString *currentItemName = (NSString *)[self getCurrentItem:row];
    NSString *itemName = [[self.plist objectForKey:currentItemName] objectForKey:@"Name"];
    NSString *itemPrice = [[self.plist objectForKey:currentItemName] objectForKey:@"Price"];
    NSString *itemImage = [[self.plist objectForKey:currentItemName] objectForKey:@"Picture"];
    
    Item *newItem = [[Item alloc] initWithItemName:itemName AndItemPrice:itemPrice AndImage:itemImage];
    self.currentItem = newItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"SelectSegue"])
    {
        // Get reference to the destination view controller
        CheckoutViewController *vc = [segue destinationViewController];
        NSInteger row = [self getCurrentRow];
        NSString *currentItemName = (NSString *)[self getCurrentItem:row];
        NSString *itemName = [[self.plist objectForKey:currentItemName] objectForKey:@"Name"];
        NSString *itemPrice = [[self.plist objectForKey:currentItemName] objectForKey:@"Price"];
        NSString *itemImage = [[self.plist objectForKey:currentItemName] objectForKey:@"Picture"];
        
        Item *newItem = [[Item alloc] initWithItemName:itemName AndItemPrice:itemPrice AndImage:itemImage];
        self.currentItem = newItem;
        // Pass any objects to the view controller here, like...
        [vc setCurrentUser:self.currentUser];
        [vc setCurrentItem:self.currentItem];
    }
}

@end
