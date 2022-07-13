//
//  ViewController.m
//  Grocery
//
//  Created by Mitchel Igolimah on 7/3/22.
//

#import "LandingViewController.h"
#import "RegisterViewController.h"
#import "SignInViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

// MARK: - UIViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction )signUpBtnDidTouch: (id) sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)signInBtnDidTouch:(id)sender {
    SignInViewController *signInVC = [[SignInViewController alloc] initWithNibName:@"SignInViewController" bundle:nil];
    [self.navigationController pushViewController:signInVC animated:YES];
}





@end
