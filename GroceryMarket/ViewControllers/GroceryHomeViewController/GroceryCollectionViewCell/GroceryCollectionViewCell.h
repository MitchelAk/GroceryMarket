//
//  GroceryCollectionViewCell.h
//  GroceryMarket
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroceryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *groceryImage;
@property (weak, nonatomic) IBOutlet UILabel *groceryPrice;
@property (weak, nonatomic) IBOutlet UILabel *groceryTitle;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

@end

NS_ASSUME_NONNULL_END
