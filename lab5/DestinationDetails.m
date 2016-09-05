//
//  ShoppingCart.h
//  Lab05
//
//  Created by Jose Rodriguez on 01/09/16.
//  Copyright © 2016 jose. All rights reserved.
//

#import "DestinationDetails.h"
#import <Google/Analytics.h>
@import GoogleMaps;

@interface DestinationDetails ()

@end

@implementation DestinationDetails{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*[maProductTitle addObject:@"Hola"];

    [maProductImg addObject:@"Adios"];

    [maProductPrice addObject:@"raka"];*/
    
    
    self.lblDestination.text          = self.destinationTitle;
    self.lblDestinationDetails.text    = self.destinationDescription;
    self.imgDestination.image   = [UIImage imageNamed:self.destinationPhoto];
    
    self.lblDestinationDetails.numberOfLines = 0;
    [self.lblDestinationDetails sizeToFit];
    
    
    
    /*if([self.destinationTitle  isEqual: @"Matías Romero"])
    {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:16.876796
                                                            longitude:-95.041210
                                                                 zoom:14];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(16.876796, -95.041210);
    marker.title = self.destinationTitle;
    marker.snippet = self.destinationDescription;
    marker.map = mapView_;
    }

    if([self.destinationTitle  isEqual: @"Calpulalpam"])
    {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:17.305988
                                                                longitude:-96.445644
                                                                     zoom:14];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(17.305988, -96.445644);
        marker.title = self.destinationTitle;
        marker.snippet = self.destinationDescription;
        marker.map = mapView_;
    }
    
    if([self.destinationTitle  isEqual: @"Oaxaca"])
    {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:17.058579
                                                                longitude:-96.722826
                                                                     zoom:14];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(17.058579, -96.722826);
        marker.title = self.destinationTitle;
        marker.snippet = self.destinationDescription;
        marker.map = mapView_;
    }
    
    if([self.destinationTitle  isEqual: @"San Lorenzo"])
    {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:16.393916
                                                                longitude:-97.873319
                                                                     zoom:14];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(16.393916, -97.873319);
        marker.title = self.destinationTitle;
        marker.snippet = self.destinationDescription;
        marker.map = mapView_;
    }
    
    if([self.destinationTitle  isEqual: @"El Tule"])
    {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:17.046389
                                                                longitude:-96.636088
                                                                     zoom:14];
        mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        mapView_.myLocationEnabled = YES;
        self.view = mapView_;
        
        // Creates a marker in the center of the map.
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(17.046389, -96.636088);
        marker.title = self.destinationTitle;
        marker.snippet = self.destinationDescription;
        marker.map = mapView_;
    }*/
    
}


-(void) viewWillAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"DestinationDetails"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCarritoPressed:(id)sender {
    [self performSegueWithIdentifier:@"ShoppingCart1" sender:self];
}

- (IBAction)btnCartPressed:(id)sender {
    
    [maProductTitle addObject:self.destinationTitle];
     
    [maProductImg addObject:self.destinationPhoto];
     
    [maProductPrice addObject:self.destinationDescription];
    
    NSUInteger arrayLength = [maProductTitle count];
    
    
    self.addCart.hidden = true;

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*if ([segue.destinationViewController isKindOfClass:[Municipios class]]) {
        Municipios *destination     = [segue destinationViewController];
        destination.IStateForMun        = self.IState;
        //        destination.destinationDescription  = self.stDescriptionSelected;
        //        destination.destinationPhoto        = self.stPhotoSelected;
        //
    }*/
}

@end

