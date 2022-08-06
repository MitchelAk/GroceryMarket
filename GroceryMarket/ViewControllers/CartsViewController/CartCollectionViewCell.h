//
//  CartCollectionViewCell.h
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 8/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CartCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *groceryImage;
@property (weak, nonatomic) IBOutlet UILabel *groceryTitle;
@property (weak, nonatomic) IBOutlet UILabel *groceryPrice;

@end

NS_ASSUME_NONNULL_END
