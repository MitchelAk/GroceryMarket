//
//  GroceryHomeViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "CartViewController.h"
#import "CartViewCollectionCell.h"
#import "MapViewController.h"
#import "Grocery.h"
@import FirebaseCore;
@import FirebaseFirestore;
@import FirebaseAuth;


@interface CartViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    
    __weak IBOutlet UICollectionView *cartViewController;
}
@property (nonatomic, strong) NSMutableArray<Grocery *> *groceryList;

@property (readwrite, nonatomic) FIRFirestore *db;


@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];

    [self setUpGrcoryList];

    cartViewController.delegate = self;
    cartViewController.dataSource = self;
    
    [cartViewController registerNib:[UINib nibWithNibName:@"CartViewCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
}


-(void) setUpGrcoryList {
    self.groceryList = NSMutableArray.new;
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *uid = user.uid;

    
    [[[[self.db collectionWithPath:@"users"] documentWithPath:uid] collectionWithPath:@"mycart"] getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        NSLog(@"Fetching cart docs");
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        }else{
            for (FIRDocumentSnapshot *document in snapshot.documents){
                NSLog(@"%@ => %@", document.documentID, document.data);
                Grocery *grocery1 = Grocery.new;
                grocery1.title = document.data[@"pname"];
                grocery1.price = document.data[@"price"];
                grocery1.latitude = document.data[@"latitude"];
                grocery1.longitude = document.data[@"longitude"];
                grocery1.storename = document.data[@"storename"];
                grocery1.storeid = document.documentID;
                grocery1.imageUrl = document.data[@"image"];
                grocery1.storeLoc = document.data[@"storeloc"];
                                
                [self.groceryList addObject:grocery1];
            }
            self->cartViewController.reloadData;
        }
    }];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.groceryList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CartViewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    Grocery *grocery = self.groceryList[indexPath.row];
    NSString *combPrice = [NSString stringWithFormat:@"%s%@", "$", grocery.price];

    NSURL *imageurl = [NSURL URLWithString:grocery.imageUrl];
    
    cell.groceryImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageurl]];
    cell.groceryTitle.text = grocery.title;
    cell.groceryPrice.text = combPrice;
    cell.mapButton.tag = indexPath.row;
    cell.cancelButton.tag = indexPath.row;

    [[cell mapButton] addTarget:self action:@selector(mapAction:event:) forControlEvents:UIControlEventTouchUpInside];
    
    [[cell cancelButton] addTarget:self action:@selector(removeItem:event:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (IBAction)mapAction:(id)sender event:(id)event {
    UITouch* touch = [[event allTouches] anyObject];
    CGPoint currenTouchPosition = [touch locationInView:cartViewController];
    NSIndexPath *indexPath = [cartViewController indexPathForItemAtPoint:currenTouchPosition];

    Grocery *gg = self.groceryList[indexPath.row];
    NSLog(@"You clicked the map btn for %@", gg.title);

    MapViewController  *mapVC = [[MapViewController alloc] init];
    mapVC.storeLoc = gg.storeLoc;
    mapVC.storename = gg.storename;
    mapVC.latitude = gg.latitude;
    mapVC.longitude = gg.longitude;
    [self.navigationController pushViewController: mapVC animated:YES];

}

- (IBAction)removeItem:(id)sender event:(id)event{
    NSSet *touches = [event allTouches];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint currenTouchPosition = [touch locationInView:cartViewController];
    
    NSIndexPath *indexPath = [cartViewController indexPathForItemAtPoint:currenTouchPosition];
    

    Grocery *gg = self.groceryList[indexPath.row];
    
    FIRUser *user = [FIRAuth auth].currentUser;
    NSString *uid = user.uid;

    if (user) {
    [[[[[self.db collectionWithPath:@"users"]
      documentWithPath: uid] collectionWithPath:@"mycart"]
      documentWithPath:gg.storeid] deleteDocumentWithCompletion:^(NSError * _Nullable error) {
        if (error !=nil) {
            NSLog(@"item was not removed successfuly");
        }else{
            NSLog(@"Item has been removed");
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


