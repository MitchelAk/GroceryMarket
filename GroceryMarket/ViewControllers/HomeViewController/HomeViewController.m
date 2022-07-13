//
//  HomeViewController.m
//  Grocery
//
//  Created by Mitchel Igolimah on 7/4/22.
//

#import "HomeViewController.h"
<<<<<<< HEAD
#import "SearchViewController.h"
#import "WelcomeViewController.h"

=======
>>>>>>> 310dd35b1cb4c87e57d055a03d5365a896dddf8f

@interface HomeViewController ()
@property (nonatomic, strong )NSArray *groceryArray;
@end

@implementation HomeViewController

<<<<<<< HEAD
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    WelcomeViewController *welcomeVC = [[WelcomeViewController alloc] init];
    
    [searchVC.tabBarItem setTitle:@"Search"];
    [welcomeVC.tabBarItem setTitle:@"Welcome"];
    
    [self setViewControllers:[NSArray arrayWithObjects:searchVC, welcomeVC, nil]];
    
}


=======
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    //return self.groceryArray.count;
//    return 5;
//}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SlideShowCell" forIndexPath:indexPath];
//
//    NSDictionary *movies = self.groceryArray[indexPath.item];
//    return cell;
//}
>>>>>>> 310dd35b1cb4c87e57d055a03d5365a896dddf8f
      
@end
