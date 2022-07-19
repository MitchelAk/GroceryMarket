//
//  SearchViewController.h
//  GroceryMarket
//
//  Created by Obinna Aguwa on 13/07/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController <UITableViewDataSource, UITableViewDataSource, UISearchBarDelegate> {
    
    IBOutlet UITableView * tableView;
    IBOutlet UISearchBar * searchBar;
    
    NSArray * groceryArray;
    NSMutableArray * displayGrocery;
}

@end

NS_ASSUME_NONNULL_END
