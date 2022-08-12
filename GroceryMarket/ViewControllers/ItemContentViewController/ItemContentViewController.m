//
//  ItemContentViewController.m
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 8/10/22.
//

#import "ItemContentViewController.h"
#import "MapViewController.h"
@import FirebaseCore;
@import FirebaseFirestore;
@import FirebaseAuth;


@interface ItemContentViewController ()
@property (readwrite, nonatomic) FIRFirestore *db;

@end

@implementation ItemContentViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.cartButton setTitle:@"" forState: UIControlStateNormal];
    [self.mapButton setTitle:@"" forState: UIControlStateNormal];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.db = [FIRFirestore firestore];

    NSLog(@"ItemView prds %@, %@, %@, %@", self.image, self.price, self.productname, self.storename );
    
    NSString *combPrice = [NSString stringWithFormat:@"%s%@", "$", self.price];

    NSURL *imageurl = [NSURL URLWithString:self.image];
    
    self.productImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageurl]];

    self.productName.text = self.productname;
    self.productPrice.text = combPrice;
    self.storeName.text = self.storename;
    
}

- (IBAction)mapTapped:(id)sender {
    NSLog(@"You tapped mapBtn");
    MapViewController  *mapVC = [[MapViewController alloc] init];
    mapVC.storeLoc = self.storeloc;
    mapVC.storename = self.storename;
    mapVC.latitude = self.latitude;
    mapVC.longitude = self.longitude;
    [self.navigationController pushViewController: mapVC animated:YES];


}

- (IBAction)cartTapped:(id)sender {
    NSLog(@"You tapped cartBtn");

    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *uid = user.uid;

    if (user) {
    [[[[self.db collectionWithPath:@"users"]
      documentWithPath: uid] collectionWithPath:@"mycart"]
      addDocumentWithData:@{
        @"pname":self.productname,
        @"price":self.price,
        @"image":self.image,
        @"longitude":self.longitude,
        @"latitude":self.latitude,
        @"storeloc":self.storeloc,
        @"storename":self.storename,

      } completion:^(NSError *  _Nullable error){
        if(error != nil){
            NSLog(@"Error adding document: %@", [error localizedDescription]);
        } else{
            NSLog(@"Added product to your cart list: %@", uid);
        }
    }];
        
    }

}

@end
