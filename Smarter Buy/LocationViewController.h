//
//  LocationViewController.h
//  Smarter Buy
//
//  Created by Sean McDonald on 11/4/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
