//
//  HomeViewController.m
//  Grocery
//
//  Created by Mitchel Igolimah on 7/4/22.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "WelcomeViewController.h"


@interface HomeViewController ()
@property (nonatomic, strong )NSArray *groceryArray;
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    WelcomeViewController *welcomeVC = [[WelcomeViewController alloc] init];
    
    [searchVC.tabBarItem setTitle:@"Search"];
    [welcomeVC.tabBarItem setTitle:@"Welcome"];
    
    [self setViewControllers:[NSArray arrayWithObjects:searchVC, welcomeVC, nil]];
    
}


      
@end
