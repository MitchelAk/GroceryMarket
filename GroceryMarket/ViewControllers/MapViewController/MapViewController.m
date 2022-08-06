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
    
    MapViewController  *mapVC = [[MapViewController alloc] init];

    NSString *latstring = mapVC.latitude;
    NSString *longstring = mapVC.longitude;
    
    
    NSLog(@"%@ & %@",latstring, longstring);
    
    double latitude = [latstring doubleValue];
    double longitude = [longstring doubleValue];

    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:47.608013
                                                              longitude:-122.335167
                                                                   zoom:6];
      GMSMapView *mapView = [GMSMapView mapWithFrame:self.view.frame camera:camera];
      mapView.myLocationEnabled = YES;
      [self.view addSubview:mapView];

//       Creates a marker in the center of the map.
      GMSMarker *marker = [[GMSMarker alloc] init];
      marker.position = CLLocationCoordinate2DMake(47.608013, -122.336167);
      marker.title = mapVC.storename;
      marker.snippet = mapVC.storeLoc;
      marker.map = mapView;
}



@end
