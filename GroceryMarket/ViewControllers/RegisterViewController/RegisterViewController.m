//
//  RegisterViewController.m
//  Grocery
//
//  Created by Mitchel Igolimah on 7/3/22.
//

#import "RegisterViewController.h"
#import "HomeViewController.h"
@import FirebaseCore;
@import FirebaseAuth;

@interface RegisterViewController ()

@end

@implementation RegisterViewController

// MARK: UIViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// MARK: Create User
- (void)createUser {
    NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    
    /// Load activity indicator
    theLoadingView = [[GroceryCommonFunction shared] showLoadingView];
    
    /// create user
    [[FIRAuth auth] createUserWithEmail:email
                               password:password
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
        [[GroceryCommonFunction shared] hideLoadingView:theLoadingView];
        if ([error isEqual:nil]) {
            [[FIRAuth auth] signInWithEmail:email password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                NSLog(@"The app is logged in successfully");
            }];
        } else {
            NSLog(@"error in create user %@", [error localizedDescription]);
            HomeViewController  *homeVC = [[HomeViewController alloc] init];
            [self.navigationController pushViewController: homeVC animated:YES];
        }
        
    }];
}

// MARK: Actions
- (IBAction)registerBtn:(id)sender {
    if ([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_phoneField.text isEqualToString:@""] || [_addressField.text isEqualToString:@""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oooops"
                                                                       message:@"Please fill out all required fields"
                                                                preferredStyle:(UIAlertControllerStyleAlert)];
        // create a cancel action
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                               style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * _Nonnull action) {
            // handle cancel response here. Doing nothing will dismiss the view.
        }];
        // add the cancel action to the alertController
        [alert addAction:cancelAction];
        
        // create an OK action
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
            // handle response here.
        }];
        
        // add the OK action to the alert controller
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];
        
    } else {
        [self createUser];
    }
}


@end
