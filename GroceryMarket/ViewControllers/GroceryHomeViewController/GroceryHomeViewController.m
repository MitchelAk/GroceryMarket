//
//  GroceryHomeViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "GroceryHomeViewController.h"
#import "GroceryCollectionViewCell.h"
#import "Grocery.h"

@interface GroceryHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    
    __weak IBOutlet UICollectionView *groceryCollectionView;
}
@property (nonatomic, strong) NSMutableArray<Grocery *> *groceryList;

@end

@implementation GroceryHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGrcoryList];
    
//    self.navigationItem.title = @"Grocery List";
//    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    groceryCollectionView.delegate = self;
    groceryCollectionView.dataSource = self;
    
    [groceryCollectionView registerNib:[UINib nibWithNibName:@"GroceryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
}

-(void) setUpGrcoryList {
    self.groceryList = NSMutableArray.new;
    
    Grocery *grocery1 = Grocery.new;
    grocery1.title = @"Organic Orange";
    grocery1.price = @"$300";
    grocery1.imageUrl = @"image1";
    [self.groceryList addObject:grocery1];
    
    Grocery *grocery2 = Grocery.new;
    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
    grocery2.price = @"$6.8";
    grocery2.imageUrl = @"image2";
    [self.groceryList addObject:grocery2];
    
    Grocery *grocery3 = Grocery.new;
    grocery3.title = @"Kellogg's Frosted Flakes Breakfast Cereal";
    grocery3.price = @"$43.2";
    grocery3.imageUrl = @"image3";
    [self.groceryList addObject:grocery3];
    
    Grocery *grocery4 = Grocery.new;
    grocery4.title = @"Sweet Onions";
    grocery4.price = @"$5.8";
    grocery4.imageUrl = @"image4";
    [self.groceryList addObject:grocery4];
    
    Grocery *grocery5 = Grocery.new;
    grocery5.title = @"Gatorade Frost Thirst Quencher Sports Drink";
    grocery5.price = @"$6.8";
    grocery5.imageUrl = @"image5";
    [self.groceryList addObject:grocery5];
//
    Grocery *grocery6 = Grocery.new;
    grocery6.title = @"Great Value Whole Vitamin D Milk";
    grocery6.price = @"$9.2";
    grocery6.imageUrl = @"image6";
    [self.groceryList addObject:grocery6];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery2.price = @"$6.8";
//    grocery2.imageUrl = @"image1";
//    [self.groceryList addObject:grocery2];
//    [self.groceryList add]
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.groceryList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GroceryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    Grocery *grocery = self.groceryList[indexPath.row];
    cell.groceryImage.image = [UIImage imageNamed:grocery.imageUrl];
    cell.groceryTitle.text = grocery.title;
    cell.groceryPrice.text = grocery.price;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width-20)/2, 230);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 10, 5);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
