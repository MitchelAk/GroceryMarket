//
//  GroceryCollectionViewCell.m
//  GroceryMarket
//
//

#import "CartViewCollectionCell.h"


@interface CartViewCollectionCell()



@end

@implementation CartViewCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 20;
    [self.cancelButton setTitle:@"" forState: UIControlStateNormal];
    [self.mapButton setTitle:@"" forState: UIControlStateNormal];
    
}

@end
