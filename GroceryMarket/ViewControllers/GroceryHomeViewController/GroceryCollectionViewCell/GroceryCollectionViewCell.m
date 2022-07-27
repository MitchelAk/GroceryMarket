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
    
}

- (IBAction)buttonTapped:(UIButton *)sender
{
  NSLog(@"Button Tapped!");
}


- (IBAction)didTapFavorite:(id)sender {
    [self.favoriteButton setImage:[UIImage imageNamed:@"favorite-16"] forState:UIControlStateNormal];
    }

@end
