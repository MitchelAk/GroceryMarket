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
    
    
    [searchVC.tabBarItem setTitle:@"Search"];
    [cartsVC.tabBarItem setTitle:@"Cart"];
    [groceryHomeVC.tabBarItem setTitle:@"Home"];
    [profileVC.tabBarItem setTitle:@"Profile"];
    
    
    [self setViewControllers:[NSArray arrayWithObjects:groceryHomeVC, searchVC, cartsVC, profileVC, nil]];
    
}
      
@end
