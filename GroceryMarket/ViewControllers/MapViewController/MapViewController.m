//
//  MapViewController.m
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 7/25/22.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController()

@end

@implementation MapViewController
id sproduct;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *latstring = self.latitude;
    NSString *longstring = self.longitude;
    
    
    NSLog(@"lat: %@ & long: %@ & location: %@ & name: %@",self.latitude, self.longitude, self.storeLoc, self.storename);
    
    double latitude = [latstring doubleValue];
    double longitude = [longstring doubleValue];

    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude
                                                              longitude:longitude
                                                                   zoom:6];
      GMSMapView *mapView = [GMSMapView mapWithFrame:self.view.frame camera:camera];
      mapView.myLocationEnabled = YES;
      [self.view addSubview:mapView];

//       Creates a marker in the center of the map.
      GMSMarker *marker = [[GMSMarker alloc] init];
      marker.position = CLLocationCoordinate2DMake(latitude, longitude);
      marker.title = self.storename;
      marker.snippet = self.storeLoc;
      marker.map = mapView;
}



@end
