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
@property (weak, nonatomic) IBOutlet UIButton *cartButton;
@property (weak, nonatomic) IBOutlet UIButton *mapButton;

//@property (weak, nonatomic) IBOutlet UIButton *buttonTap;

@end

NS_ASSUME_NONNULL_END
