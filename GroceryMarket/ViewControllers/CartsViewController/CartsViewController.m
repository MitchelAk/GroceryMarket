//
//  GroceryHomeViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "CartsViewController.h"
#import "CartViewCollectionCell.h"
#import "Grocery.h"

@import FirebaseCore;
@import FirebaseFirestore;
@import FirebaseAuth;


@interface CartsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    __weak IBOutlet UICollectionView *cartCollectionView;
}
@property (nonatomic, strong) NSMutableArray<Grocery *> *cartList;

@property (readwrite, nonatomic) FIRFirestore *db;


@end

@implementation CartsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];

    [self setUpGrcoryList];

    cartCollectionView.delegate = self;
    cartCollectionView.dataSource = self;
    
    [cartCollectionView registerNib:[UINib nibWithNibName:@"CartCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];

}


-(void) setUpGrcoryList {
    self.cartList = NSMutableArray.new;
    
    [[self.db collectionWithPath:@"products"] getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        NSLog(@"Fetching cart docs");
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        }else{
            for (FIRDocumentSnapshot *document in snapshot.documents){
//                NSLog(@"%@ => %@", document.documentID, document.data);
                Grocery *grocery1 = Grocery.new;
                grocery1.title = document.data[@"pname"];
                grocery1.price = document.data[@"price"];
                grocery1.imageUrl = @"image1";
                
                [self.cartList addObject:grocery1];
            }
            self->cartCollectionView.reloadData;
        }
    }];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cartList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CartViewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    Grocery *grocery = self.cartList[indexPath.row];
    NSString *combPrice = [NSString stringWithFormat:@"%s%@", "$", grocery.price];
    
    cell.groceryImage.image = [UIImage imageNamed:grocery.imageUrl];
    cell.groceryTitle.text = grocery.title;
    cell.groceryPrice.text = combPrice;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width-20)/2, 230);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 10, 5);
}


@end
