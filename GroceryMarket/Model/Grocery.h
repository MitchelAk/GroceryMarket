//
//  Grocery.h
//  GroceryMarket
//
//  Created by Obinna Aguwa on 17/07/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Grocery : NSObject
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString * price;
@property(nonatomic,strong) NSString *imageUrl;
@property(nonatomic,strong) NSString *storename;
@property(nonatomic,strong) NSString *storeLoc;
@property(nonatomic,strong) NSString *longitude;
@property(nonatomic,strong) NSString *latitude;
@property(nonatomic,strong) NSString *storeid;

@property (nonatomic) BOOL favorited;

@end

NS_ASSUME_NONNULL_END
