//
//  GroceryCollectionViewCell.m
//  GroceryMarket
//
//

#import "GroceryCollectionViewCell.h"
@import FirebaseCore;
@import FirebaseFirestore;


@interface GroceryCollectionViewCell()

@property (readwrite, nonatomic) FIRFirestore *db;

@end

@implementation GroceryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 20;
    
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    self.db = [FIRFirestore firestore];

  NSLog(@"Button Tapped!");
}


- (IBAction)didTapFavorite:(id)sender {
//    [self.favoriteButton setImage:[UIImage imageNamed:@"favorite-16"] forState:UIControlStateNormal];
    }

@end
