//
//  SearchViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "SearchViewController.h"
#import "ItemContentViewController.h"
#import "Grocery.h"

@import FirebaseCore;
@import FirebaseFirestore;

@interface SearchViewController ()

@property (nonatomic, strong) NSMutableArray<Grocery *> *groceryList;
@property (readwrite, nonatomic) FIRFirestore *db;


@end

@implementation SearchViewController
- (IBAction)didTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];
    self.groceryList = NSMutableArray.new;

    
    [[self.db collectionWithPath:@"products"] getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        }else{
            self->groceryArray = [[NSMutableArray alloc] init];
            
            for (FIRDocumentSnapshot *document in snapshot.documents){
                NSLog(@"Search Products: %@", document.data[@"pname"]);

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

                
                [self->groceryArray addObject:document.data[@"pname"]];
                

            }
            
            self->displayGrocery = [[NSMutableArray alloc]initWithArray:self->groceryArray];

            
            [self->tableView reloadData];

        }
        
    }];

//    groceryArray = [[NSArray alloc] initWithObjects:@"Gatorade Frost Thirst Quencher Sports Drink", @"Great Value White Eggs", @"Kellogg's Frosted Flakes Breakfast Cereal", @"Sweet Onions", @"Great Value Whole Vitamin D Milk", @"GGreat Value Broccoli Florets", @"Nature's Own Honey Wheat",  @"Stir Fry Frozen Vegetables",  @"Chopped Spinach", @"Congo Green Plantain", @"Vegetable Oil", @"Essentia Bottled Water", @"Fresh Strawberries", @"Gala Apples", @"Fresh Green Bell Pepper", @"Jasmine Rice", @"Great Value Fettuccine", @"Pineapple",  @"Free Chicken Nuggets", @"Beans Canned Vegetables",  nil];
    
//    displayGrocery = [[NSMutableArray alloc]initWithArray:groceryArray];

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return[displayGrocery count];
}

- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [displayGrocery objectAtIndex:indexPath.row];
    
    cell.tag = indexPath.row;
    
    
    return cell;
}

- (void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:( NSIndexPath *)indexPath{


    
    Grocery *gg = self.groceryList[indexPath.row];

    ItemContentViewController  *itemview = [[ItemContentViewController alloc] init];
    itemview.storeloc = gg.storeLoc;
    itemview.storename = gg.storename;
    itemview.latitude = gg.latitude;
    itemview.logitude = gg.longitude;
    itemview.price = gg.price;
    itemview.image = gg.imageUrl;
    itemview.productname = gg.title;
    
    [self.navigationController pushViewController: itemview animated:YES];

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([searchText length] == 0){
        [displayGrocery removeAllObjects];
        [displayGrocery addObjectsFromArray:groceryArray];
    }else {
        [displayGrocery removeAllObjects];
        for (NSString * string in groceryArray){
            NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound){
                [displayGrocery addObject:string];
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(reload) object:nil];
                [self performSelector:@selector(reload) withObject:nil afterDelay:5.5];

            }
        }
        
    }
}

-(void)reload{
    [tableView reloadData];

}

@end
