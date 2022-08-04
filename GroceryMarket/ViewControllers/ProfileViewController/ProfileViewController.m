//
//  ProfileViewController.m
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 7/18/22.
//

#import "ProfileViewController.h"
#import "LandingViewController.h"
@import FirebaseCore;
@import FirebaseFirestore;
@import FirebaseAuth;

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (readwrite, nonatomic) FIRFirestore *db;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.db = [FIRFirestore firestore];

    [self getuserDetails];
}


- (void)getuserDetails{
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *uid = user.uid;
    if (user) {
        
//        NSString *uid = user.uid;
        NSLog(@"user id: %@", user.uid);
        [[[self.db collectionWithPath:@"users"] documentWithPath:uid] getDocumentWithCompletion:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error ){
            if (snapshot.exists) {
                NSLog(@"Document exists %@", snapshot.data);
                NSString *address = snapshot.data[@"address"];
                NSString *username = snapshot.data[@"username"];
                NSString *email = snapshot.data[@"email"];
                NSString *phone = snapshot.data[@"phone"];


                self.AddressField.text = address;
                self.PhoneField.text = phone;
                self.UsernameField.text = username;
                self.EmailField.text = email;
                
                
            }else{
                NSLog(@"Document does not exist");
            }
            
        }];
    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    UIImage *resizedImage = [self resizeImage:originalImage withSize:CGSizeMake(300, 300)];
        self.profileImage.image = resizedImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)ImageViewDidTap:(UITapGestureRecognizer *)sender {
    NSLog(@"Picture tapped");
    
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;


    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (IBAction)didTapLogout:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LandingViewController *landingViewController = [storyboard instantiateViewControllerWithIdentifier:@"LandingViewController"];
    appDelegate.window.rootViewController = landingViewController;
}
@end
