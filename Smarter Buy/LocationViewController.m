//
//  LocationViewController.m
//  Smarter Buy
//
//  Created by Sean McDonald on 11/4/13.
//  Copyright (c) 2013 Hewlett-Packard. All rights reserved.
//

#import "LocationViewController.h"
#import "JPSThumbnail.h"
#import "JPSThumbnailAnnotation.h"
#define METERS_PER_MILE 1609.344

@interface LocationViewController ()

@end

@implementation LocationViewController

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
    [self.mapView setShowsUserLocation:YES];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    // Create locations here
    [self.mapView addAnnotations:[self generateAnnotations]];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 42.619986;
    zoomLocation.longitude= -83.263062;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5 * METERS_PER_MILE, 0.5 * METERS_PER_MILE);
    
    [_mapView setRegion:viewRegion animated:YES];
}
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)launchNavigation:(JPSThumbnail *)location {
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        // Create an MKMapItem to pass to the Maps app
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:location.coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:location.title];
        
        // Set the directions mode to "Walking"
        // Can use MKLaunchOptionsDirectionsModeDriving instead
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        // Get the "Current User Location" MKMapItem
        MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
        // Pass the current location and destination map items to the Maps app
        // Set the direction mode in the launchOptions dictionary
        [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem] 
                       launchOptions:launchOptions];
    }
}

- (JPSThumbnail *)weakLocation:(JPSThumbnail *)location {
    __weak typeof(JPSThumbnail) *weakLocation = location;
    return weakLocation;
}

- (NSArray *)generateAnnotations {
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    // Empire State Building
    JPSThumbnail *empire = [[JPSThumbnail alloc] init];
    empire.image = [UIImage imageNamed:@"store.png"];
    empire.title = @"Empire State Building";
    empire.subtitle = @"NYC Landmark";
    empire.coordinate = CLLocationCoordinate2DMake(40.75, -73.99);
    JPSThumbnail *weakLocation = [self weakLocation:empire];
    empire.disclosureBlock = ^{
        [self launchNavigation:weakLocation];
    };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:empire]];
    
    // Apple HQ
    JPSThumbnail *apple = [[JPSThumbnail alloc] init];
    apple.image = [UIImage imageNamed:@"store.png"];
    apple.title = @"Apple HQ";
    apple.subtitle = @"Apple Headquarters";
    apple.coordinate = CLLocationCoordinate2DMake(37.33, -122.03);
    weakLocation = [self weakLocation:apple];
    apple.disclosureBlock = ^{
        [self launchNavigation:weakLocation];
    };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:apple]];
    
    // Parliament of Canada
    JPSThumbnail *ottawa = [[JPSThumbnail alloc] init];
    ottawa.image = [UIImage imageNamed:@"store.png"];
    ottawa.title = @"Parliament of Canada";
    ottawa.subtitle = @"Oh Canada!";
    ottawa.coordinate = CLLocationCoordinate2DMake(45.43, -75.70);
    weakLocation = [self weakLocation:ottawa];
    ottawa.disclosureBlock = ^{
        [self launchNavigation:weakLocation];
    };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:ottawa]];
    
    // HP
    JPSThumbnail *hp = [[JPSThumbnail alloc] init];
    hp.image = [UIImage imageNamed:@"store.png"];
    hp.title = @"HP Pontiac";
    hp.subtitle = @"Smarter Buy HQ";
    hp.coordinate = CLLocationCoordinate2DMake(42.619986, -83.263062);
    weakLocation = [self weakLocation:hp];
    hp.disclosureBlock = ^{
        [self launchNavigation:weakLocation];
    };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:hp]];
    
    JPSThumbnail *microsoft = [[JPSThumbnail alloc] init];
    hp.image = [UIImage imageNamed:@"store.png"];
    hp.title = @"Microsoft";
    hp.subtitle = @"Microsoft HQ";
    hp.coordinate = CLLocationCoordinate2DMake(47.640071, -122.129598);
    weakLocation = [self weakLocation:microsoft];
    hp.disclosureBlock = ^{
        [self launchNavigation:weakLocation];
    };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:microsoft]];
    
    return annotations;
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didSelectAnnotationViewInMap:mapView];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didDeselectAnnotationViewInMap:mapView];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation conformsToProtocol:@protocol(JPSThumbnailAnnotationProtocol)]) {
        return [((NSObject<JPSThumbnailAnnotationProtocol> *)annotation) annotationViewInMap:mapView];
    }
    return nil;
}

@end
