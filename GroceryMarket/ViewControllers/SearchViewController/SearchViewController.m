//
//  SearchViewController.m
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import "SearchViewController.h"
@import FirebaseCore;
@import FirebaseFirestore;

@interface SearchViewController ()
@property (readwrite, nonatomic) FIRFirestore *db;


@end

@implementation SearchViewController
- (IBAction)didTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.db = [FIRFirestore firestore];
    
    [[self.db collectionWithPath:@"products"] getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        }else{
            
            for (FIRDocumentSnapshot *document in snapshot.documents){
                NSLog(@"Search Products: %@", document.data[@"pname"]);
                
                self->groceryArray = [[NSMutableArray alloc] initWithObjects:document.data[@"pname"], nil];


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
    return cell;
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
                
            }
        }
        
    }
    [tableView reloadData];
}

@end
