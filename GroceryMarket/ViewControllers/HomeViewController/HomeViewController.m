//
//  HomeViewController.m
//  Grocery
//
//  Created by Mitchel Igolimah on 7/4/22.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "CartsViewController.h"
#import "GroceryHomeViewController.h"
#import "ProfileViewController.h"
#import "MapViewController.h"


@interface HomeViewController ()
@property (nonatomic, strong )NSArray *groceryArray;
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ProfileViewController *profileVC = [[ProfileViewController alloc] init];
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    CartsViewController *cartsVC = [[CartsViewController alloc] init];
    GroceryHomeViewController *groceryHomeVC = [[GroceryHomeViewController alloc] init];
    MapViewController *mapVC = [[MapViewController alloc] init];
    
    [searchVC.tabBarItem setTitle:@"Search"];
    [cartsVC.tabBarItem setTitle:@"Cart"];
    [groceryHomeVC.tabBarItem setTitle:@"Home"];
    [profileVC.tabBarItem setTitle:@"Account"];
    [mapVC.tabBarItem setTitle:@"Map"];
    
    
    searchVC.tabBarItem.image = [UIImage imageNamed:@"search2.png"];
    cartsVC.tabBarItem.image = [UIImage imageNamed:@"cart.png"];
    groceryHomeVC.tabBarItem.image = [UIImage imageNamed:@"home.png"];
    profileVC.tabBarItem.image = [UIImage imageNamed:@"user-16.png"];
    mapVC.tabBarItem.image = [UIImage imageNamed:@"map.png"];
    
    
    
    [self setViewControllers:[NSArray arrayWithObjects:groceryHomeVC, searchVC, cartsVC, mapVC, profileVC, nil]];
    
}
      
@end

