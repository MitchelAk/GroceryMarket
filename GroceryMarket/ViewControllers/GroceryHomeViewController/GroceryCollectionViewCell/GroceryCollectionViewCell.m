//
//  GroceryCollectionViewCell.m
//  GroceryMarket
//
//

#import "GroceryCollectionViewCell.h"


@interface GroceryCollectionViewCell()



@end

@implementation GroceryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 20;
    [self.favoriteButton setTitle:@"" forState: UIControlStateNormal];
    [self.cartButton setTitle:@"" forState: UIControlStateNormal];
    [self.mapButton setTitle:@"" forState: UIControlStateNormal];
    
}

- (IBAction)buttonTapped:(UIButton *)sender
{

}


- (IBAction)didTapFavorite:(id)sender {
    [self.favoriteButton setImage:[UIImage imageNamed:@"favorite-16"] forState:UIControlStateNormal];
    }

@end
