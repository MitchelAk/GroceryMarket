//
//  SignInViewController.m
//  Grocery
//
//  Created by Mitchel Igolimah on 7/3/22.
//

#import "SignInViewController.h"
#import "HomeViewController.h"
@import FirebaseAuth;

@interface SignInViewController ()

@end

@implementation SignInViewController
- (IBAction)didTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)loginUser {
    NSString *email= self.emailField.text;
    NSString *password = self.passwordField.text;
    
    /// Load activity indicator
    theLoadingView = [[GroceryCommonFunction shared] showLoadingView];
    
    [[FIRAuth auth] signInWithEmail:email password:password completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        [[GroceryCommonFunction shared] hideLoadingView:theLoadingView];
        HomeViewController  *homeVC = [[HomeViewController alloc] init];
        [self.navigationController pushViewController: homeVC animated:YES];
        NSLog(@"The app is logged in successfully");
    }];
}

- (IBAction)loginBtn:(id)sender {
    if ([self.emailField.text isEqual:@""] || [self.passwordField.text isEqual:@""]){
        
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
    }else{
        [self loginUser];
    }
}


@end
