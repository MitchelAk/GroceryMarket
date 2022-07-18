//
//  GroceryCollectionViewCell.h
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroceryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *groceryImage;
@property (weak, nonatomic) IBOutlet UILabel *groceryPrice;
@property (weak, nonatomic) IBOutlet UILabel *groceryTitle;

@end

NS_ASSUME_NONNULL_END
