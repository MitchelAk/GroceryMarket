//
//  ItemContentViewController.h
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 8/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *storeName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;
@property (weak, nonatomic) IBOutlet UIButton *cartButton;

@property (nonatomic, retain) NSString *storename;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *productname;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *storeloc;



@end

NS_ASSUME_NONNULL_END
