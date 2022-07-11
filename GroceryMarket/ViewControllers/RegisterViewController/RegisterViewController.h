//
//  RegisterViewController.h
//  Grocery
//
//  Created by Mitchel Igolimah on 7/3/22.

//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController {
    UIView *theLoadingView;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
- (IBAction)registerBtn:(id)sender;

@end

NS_ASSUME_NONNULL_END
