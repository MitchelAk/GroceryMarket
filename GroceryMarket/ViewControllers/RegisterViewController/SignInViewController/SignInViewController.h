//
//  SignInViewController.h
//  Grocery
//
//  Created by Mitchel Igolimah on 7/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignInViewController : UIViewController {
    UIView *theLoadingView;
}
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)loginBtn:(id)sender;

@end

NS_ASSUME_NONNULL_END
