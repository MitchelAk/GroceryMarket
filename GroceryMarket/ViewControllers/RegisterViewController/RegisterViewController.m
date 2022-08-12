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
@import FirebaseFirestore;

@interface RegisterViewController ()

@property (readwrite, nonatomic) FIRFirestore *db;
@property (weak, nonatomic) NSURL *url;


@end

@implementation RegisterViewController
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

// MARK: UIViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.db = [FIRFirestore firestore];

}


- (void)createUser {
    NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    NSString *address = self.addressField.text;
    NSString *phone = self.phoneField.text;
    NSString *username = self.usernameField.text;

    
    /// Load activity indicator
    theLoadingView = [[GroceryCommonFunction shared] showLoadingView];
    
    /// create user
    [[FIRAuth auth] createUserWithEmail:email
                               password:password
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
        [[GroceryCommonFunction shared] hideLoadingView:self->theLoadingView];
        if (error == nil ) {
            [[FIRAuth auth] signInWithEmail:email
                                   password:password
                                 completion:^(FIRAuthDataResult * _Nullable authResult,
                                              NSError * _Nullable error) {
                if(error == nil){
                    
                    NSLog(@"The app is logged in successfully");
                    HomeViewController  *homeVC = [[HomeViewController alloc] init];
                    [self.navigationController pushViewController: homeVC animated:YES];

                }else{
                    NSLog(@"Login not successful: %@", [error localizedDescription]);
                }
            }];
            
            NSString *uid = authResult.user.uid;
        
            [[[self.db collectionWithPath:@"users"]
              documentWithPath: uid]
              setData:@{
                @"email":email,
                @"phone":phone,
                @"username":username,
                @"address":address,
                @"profilepic":@""
              } completion:^(NSError *  _Nullable error){
                if(error != nil){
                    NSLog(@"Error adding document: %@", [error localizedDescription]);
                } else{
                    NSLog(@"Document added with ID: %@", uid);
                }
            }];
            
            
            
        } else {
            NSLog(@"error in create user: %@", [error localizedDescription]);
        }
        
        
    }];
}

// MARK: Actions
- (IBAction)registerBtn:(id)sender {
    if ([_usernameField.text isEqualToString:@""] || [_profileImage.image isEqual:nil] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_phoneField.text isEqualToString:@""] || [_addressField.text isEqualToString:@""]) {
        
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

- (IBAction)addImageButton:(id)sender {
    NSLog(@"You want to select image");
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        
    [self presentViewController: picker animated:YES completion:nil];


    }
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:( UIImage *)image editingInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)editingInfo {
    UIImage *selectedimg = image;
    _url = [editingInfo valueForKey:UIImagePickerControllerImageURL];

    self.profileImage.image = selectedimg;
     
    [self.view setNeedsDisplay];
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"You selected an image");
    NSLog(@"%@", _url);

}

@end
