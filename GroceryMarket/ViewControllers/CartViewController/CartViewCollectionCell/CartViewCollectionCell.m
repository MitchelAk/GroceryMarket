//
//  GroceryCollectionViewCell.m
//  GroceryMarket
//
//

#import "CartViewCollectionCell.h"
//@import FirebaseCore;
//@import FirebaseFirestore;


@interface CartViewCollectionCell()

//@property (readwrite, nonatomic) FIRFirestore *db;

@end

@implementation CartViewCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 20;
}

@end
