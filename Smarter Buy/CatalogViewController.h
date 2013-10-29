//
//  CatalogViewController.h
//  Smarter Buy
//
//  Created by Sean McDonald on 10/24/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Item.h"

@interface CatalogViewController : UIViewController <NSFileManagerDelegate> {
    User *user;
}

@property (strong, nonatomic) User *user;
@property (weak, nonatomic) NSString *plistFile;
@property (strong, nonatomic) NSMutableDictionary *plist;
@property (strong, nonatomic) NSMutableArray *allKeys;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPicker;
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;

- (IBAction)selectItem:(id)sender;

@end
