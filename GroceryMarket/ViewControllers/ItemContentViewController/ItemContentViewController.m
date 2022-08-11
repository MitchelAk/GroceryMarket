//
//  ItemContentViewController.m
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 8/10/22.
//

#import "ItemContentViewController.h"

@interface ItemContentViewController ()

@end

@implementation ItemContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"ItemView prds %@, %@, %@, %@", self.image, self.price, self.productname, self.storename );
    
    NSString *combPrice = [NSString stringWithFormat:@"%s%@", "$", self.price];

    NSURL *imageurl = [NSURL URLWithString:self.image];
    
    self.productImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageurl]];

    self.productName.text = self.productname;
    self.productPrice.text = combPrice;
    self.storeName.text = self.storename;
    
    self.cartButton
    
}



@end
