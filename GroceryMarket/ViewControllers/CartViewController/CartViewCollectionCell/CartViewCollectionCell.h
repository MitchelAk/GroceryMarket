//
//  CartViewCollectionCell.h
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 8/6/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CartViewCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *groceryImage;
@property (weak, nonatomic) IBOutlet UILabel *groceryTitle;
@property (weak, nonatomic) IBOutlet UILabel *groceryPrice;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

NS_ASSUME_NONNULL_END
