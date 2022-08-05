//
//  GroceryHomeViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "GroceryHomeViewController.h"
#import "GroceryCollectionViewCell.h"
#import "Grocery.h"
@import FirebaseCore;
@import FirebaseFirestore;


@interface GroceryHomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    
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
                
                NSLog(@"pnames: %@", document.data[@"pname"]);
                [self.groceryList addObject:grocery1];
            }
            groceryCollectionView.reloadData;
        }
    }];
    
//    Grocery *grocery1 = Grocery.new;
//    grocery1.title = @"Gatorade Frost Thirst Quencher Sports Drink";
//    grocery1.price = @"$6.98";
//    grocery1.imageUrl = @"image1";
//    [self.groceryList addObject:grocery1];
    
//    Grocery *grocery2 = Grocery.new;
//    grocery2.title = @"Great Value White Eggs";
//    grocery2.price = @"$4.42";
//    grocery2.imageUrl = @"image2";
//    [self.groceryList addObject:grocery2];
    
//    Grocery *grocery3 = Grocery.new;
//    grocery3.title = @"Kellogg's Frosted Flakes Breakfast Cereal";
//    grocery3.price = @"$5.98";
//    grocery3.imageUrl = @"image3";
//    [self.groceryList addObject:grocery3];
    
//    Grocery *grocery4 = Grocery.new;
//    grocery4.title = @"Sweet Onions";
//    grocery4.price = @"$5.48";
//    grocery4.imageUrl = @"image4";
//    [self.groceryList addObject:grocery4];
    
//    Grocery *grocery5 = Grocery.new;
//    grocery5.title = @"Great Value Whole Vitamin D Milk";
//    grocery5.price = @"$3.74";
//    grocery5.imageUrl = @"image5";
//    [self.groceryList addObject:grocery5];

//    Grocery *grocery6 = Grocery.new;
//    grocery6.title = @"GGreat Value Broccoli Florets";
//    grocery6.price = @"$2.24";
//    grocery6.imageUrl = @"image6";
//    [self.groceryList addObject:grocery6];

//    Grocery *grocery7= Grocery.new;
//    grocery7.title = @"Nature's Own Honey Wheat";
//    grocery7.price = @"$3.34";
//    grocery7.imageUrl = @"image7";
//    [self.groceryList addObject:grocery7];

//    Grocery *grocery8 = Grocery.new;
//    grocery8.title = @"Stir Fry Frozen Vegetables";
//    grocery8.price = @"$6.8";
//    grocery8.imageUrl = @"image8";
//    [self.groceryList addObject:grocery8];
    
//    Grocery *grocery9 = Grocery.new;
//    grocery9.title = @"Chopped Spinach";
//    grocery9.price = @"$6.8";
//    grocery9.imageUrl = @"image9";
//    [self.groceryList addObject:grocery9];
    
//    Grocery *grocery10 = Grocery.new;
//    grocery10.title = @"Congo Green Plantain";
//    grocery10.price = @"$28.93";
//    grocery10.imageUrl = @"image10";
//    [self.groceryList addObject:grocery10];
    
//    Grocery *grocery11 = Grocery.new;
//    grocery11.title = @"Vegetable Oil";
//    grocery11.price = @"$3.27";
//    grocery11.imageUrl = @"image11";
//    [self.groceryList addObject:grocery11];
    
//    Grocery *grocery12 = Grocery.new;
//    grocery12.title = @"Essentia Bottled Water";
//    grocery12.price = @"$8.98";
//    grocery12.imageUrl = @"image12";
//    [self.groceryList addObject:grocery12];
    
//    Grocery *grocery13 = Grocery.new;
//    grocery13.title = @"Fresh Strawberries";
//    grocery13.price = @"$8.17";
//    grocery13.imageUrl = @"image13";
//    [self.groceryList addObject:grocery13];
    
//    Grocery *grocery14 = Grocery.new;
//    grocery14.title = @"Gala Apples";
//    grocery14.price = @"$1.00";
//    grocery14.imageUrl = @"image14";
//    [self.groceryList addObject:grocery14];
    
//    Grocery *grocery15 = Grocery.new;
//    grocery15.title = @"Fresh Green Bell Pepper";
//    grocery15.price = @"$0.83";
//    grocery15.imageUrl = @"image15";
//    [self.groceryList addObject:grocery15];
    
//    Grocery *grocery16 = Grocery.new;
//    grocery16.title = @"Jasmine Rice";
//    grocery16.price = @"$5.20";
//    grocery16.imageUrl = @"image16";
//    [self.groceryList addObject:grocery16];
    
//    Grocery *grocery17 = Grocery.new;
//    grocery17.title = @"Great Value Fettuccine";
//    grocery17.price = @"$0.92";
//    grocery17.imageUrl = @"image17";
//    [self.groceryList addObject:grocery17];
    
//    Grocery *grocery18 = Grocery.new;
//    grocery18.title = @"Pineapple";
//    grocery18.price = @"$2.38";
//    grocery18.imageUrl = @"image18";
//    [self.groceryList addObject:grocery18];
    
//    Grocery *grocery19 = Grocery.new;
//    grocery19.title = @"Free Chicken Nuggets";
//    grocery19.price = @"$11.98";
//    grocery19.imageUrl = @"image19";
//    [self.groceryList addObject:grocery19];
    
    
//    Grocery *grocery20 = Grocery.new;
//    grocery20.title = @"Beans Canned Vegetables";
//    grocery20.price = @"$12.98";
//    grocery20.imageUrl = @"image20";
//    [self.groceryList addObject:grocery20];
    

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
    NSLog(@"indexPath: %ld", (long)indexPath.row);

    [[cell cartButton] addTarget:self action:@selector(clickEvent:event:) forControlEvents: UIControlEventTouchUpInside];
    
    return cell;
}
- (IBAction)clickEvent:(id)sender event:(id)event{
    NSSet *touches = [event allTouches];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint currenTouchPosition = [touch locationInView:groceryCollectionView];
    
    NSIndexPath *indexPath = [groceryCollectionView indexPathForItemAtPoint:currenTouchPosition];
    

    Grocery *gg = self.groceryList[indexPath.row];
    
    NSLog(@"index: %@", gg.title);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.view.frame.size.width-20)/2, 230);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 5, 10, 5);
}




@end
