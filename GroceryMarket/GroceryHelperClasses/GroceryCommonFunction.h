//
//  GroceryCommonFunction.h
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 11/07/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroceryCommonFunction : NSObject

#pragma mark - Shared Instance
+ (id)shared;

#pragma mark - Loading View
- (UIView *)showLoadingView;
- (void)hideLoadingView:(UIView *)loadingView;

+ (BOOL)isKindOfClass:(Class)classType comparedObject:(id)value;

@end

NS_ASSUME_NONNULL_END
