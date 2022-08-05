//
//  GroceryHomeViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "CartsViewController.h"
#import "GroceryCollectionViewCell.h"
#import "Grocery.h"
@import FirebaseCore;
@import FirebaseFirestore;
@import FirebaseAuth;


@interface CartsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    
    __weak IBOutlet UICollectionView *groceryCollectionView;
}
@property (nonatomic, strong) NSMutableArray<Grocery *> *groceryList;

@property (readwrite, nonatomic) FIRFirestore *db;


@end

@implementation GroceryHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];

    [self setUpGrcoryList];

    groceryCollectionView.delegate = self;
    groceryCollectionView.dataSource = self;
    
    [groceryCollectionView registerNib:[UINib nibWithNibName:@"GroceryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];

}


-(void) setUpGrcoryList {
    self.groceryList = NSMutableArray.new;
    
    [[self.db collectionWithPath:@"products"] getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        NSLog(@"Fetching docs");
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        }else{
            for (FIRDocumentSnapshot *document in snapshot.documents){
//                NSLog(@"%@ => %@", document.documentID, document.data);
                Grocery *grocery1 = Grocery.new;
                grocery1.title = document.data[@"pname"];
                grocery1.price = document.data[@"price"];
                grocery1.imageUrl = @"image1";
                
                [self.groceryList addObject:grocery1];
            }
            groceryCollectionView.reloadData;
        }
    }];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.groceryList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GroceryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    Grocery *grocery = self.groceryList[indexPath.row];
    NSString *combPrice = [NSString stringWithFormat:@"%s%@", "$", grocery.price];
    cell.groceryImage.image = [UIImage imageNamed:grocery.imageUrl];
    cell.groceryTitle.text = grocery.title;
    cell.groceryPrice.text = combPrice;
    cell.cartButton.tag = indexPath.row;

    [[cell cartButton] addTarget:self action:@selector(clickEvent:event:) forControlEvents: UIControlEventTouchUpInside];
    
    [[cell favoriteButton] addTarget:self action:@selector(likeEvent:withEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    
    return cell;
}

- (IBAction)likeEvent:(id)sender withEvent:(UIEvent*)event {

    UITouch* touch = [[event allTouches] anyObject];
    CGPoint currenTouchPosition = [touch locationInView:groceryCollectionView];
    NSIndexPath *indexPath = [groceryCollectionView indexPathForItemAtPoint:currenTouchPosition];
    
    GroceryCollectionViewCell *cell = [groceryCollectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];

    if (touch.tapCount == 2) {
        NSLog(@"YOU TAPPED TWICE");
            [cell.favoriteButton setImage:[UIImage imageNamed:@"favorite-16"] forState:UIControlStateNormal];
    }
}

- (IBAction)clickEvent:(id)sender event:(id)event{
    NSSet *touches = [event allTouches];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint currenTouchPosition = [touch locationInView:groceryCollectionView];
    
    NSIndexPath *indexPath = [groceryCollectionView indexPathForItemAtPoint:currenTouchPosition];
    

    Grocery *gg = self.groceryList[indexPath.row];
    
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *uid = user.uid;

    if (user) {
    [[[[self.db collectionWithPath:@"users"]
      documentWithPath: uid] collectionWithPath:@"mycart"]
      addDocumentWithData:@{
        @"pname":gg.title,
        @"price":gg.price,
        @"image":gg.imageUrl
      } completion:^(NSError *  _Nullable error){
        if(error != nil){
            NSLog(@"Error adding document: %@", [error localizedDescription]);
        } else{
            NSLog(@"Added product to your cart list: %@", uid);
        }
    }];
        
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width-20)/2, 230);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 10, 5);
}




@end
