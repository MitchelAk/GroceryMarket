//
//  MapViewController.h
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 7/25/22.
//

#import <UIKit/UIKit.h>
#import "Grocery.h"

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *storename;
@property (nonatomic, retain) NSString *storeLoc;



@end

NS_ASSUME_NONNULL_END
