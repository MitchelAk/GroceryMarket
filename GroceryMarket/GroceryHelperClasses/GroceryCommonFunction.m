//
//  GroceryCommonFunction.m
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 11/07/2022.
//

#import "GroceryCommonFunction.h"

@interface GroceryCommonFunction ()

@end

@implementation GroceryCommonFunction

+ (id)shared
{
    static GroceryCommonFunction *sharedObject = nil;
    
    //used for executing the code once ; only once through the lifetime of the object
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}


+ (BOOL)isKindOfClass:(Class)classType comparedObject:(id)value {
    if(value != nil && ![value isKindOfClass:[NSNull class]] && [value isKindOfClass:classType] ) {
        return YES;
    }
    return NO;
    
}

#pragma mark - Loading View
- (UIView *)showLoadingView
{
    CGSize scrSize = [[[UIApplication sharedApplication] windows] firstObject].bounds.size;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, scrSize.width, scrSize.width, scrSize.height)];
    [containerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    [containerView setBackgroundColor:[UIColor clearColor]];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrSize.width, scrSize.height)];
    [backView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    [backView setBackgroundColor:[UIColor darkGrayColor]];
    [backView setAlpha:0.7];
    [backView setTag:100];
    
    [containerView addSubview:backView];
    
    CGRect loadingFrame = CGRectMake(40, 160, 240, 120);
    UIView *loadingView = [[UIView alloc] initWithFrame:loadingFrame];
    loadingView.center = [[[UIApplication sharedApplication] windows] firstObject].center;
    [loadingView setBackgroundColor:[UIColor colorWithRed:242.0f/255.0f green:241.0f/255.0f blue:241.0/255.0f alpha:1.0f]];
    
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake((loadingFrame.size.width-120)/2, 15,140, 20)];
    /**CGPoint theFarmeCentre = loadingLabel.center;
     theFarmeCentre.x = loadingView.center.x;
     loadingLabel.center = theFarmeCentre;**/
    [loadingLabel setBackgroundColor:[UIColor clearColor]];
    [loadingLabel setTextColor:[UIColor darkTextColor]];
    
    [loadingLabel setFont:[UIFont systemFontOfSize:15]];
    [loadingLabel setText:@"Authenticating..."];
    [loadingView addSubview:loadingLabel];
    
    
    UIActivityIndicatorView *loadingActivity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingActivity setFrame:CGRectMake(loadingLabel.frame.origin.x, loadingLabel.frame.origin.y+loadingLabel.frame.size.height+20, 20, 20)];
    [loadingActivity setHidesWhenStopped:YES];
    [loadingActivity startAnimating];
    [loadingActivity setColor:[UIColor colorWithRed:35.0f/255.0f green:150.0f/255.0f blue:243.0/255.0f alpha:1.0f]];
    [loadingView addSubview:loadingActivity];
    
    
    UILabel *connectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(loadingActivity.frame.origin.x+loadingActivity.frame.size.width+10, loadingActivity.frame.origin.y,100, 20)];
    [connectionLabel setBackgroundColor:[UIColor clearColor]];
    [connectionLabel setTextColor:[UIColor darkTextColor]];

    [connectionLabel setFont:[UIFont systemFontOfSize:12]];
    [connectionLabel setText:@"Connecting"];
    
    [loadingView addSubview:connectionLabel];
    
    [loadingView.layer setCornerRadius:10.0f];
    [containerView addSubview:loadingView];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:containerView];
     [[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:containerView];

    
    [UIView animateKeyframesWithDuration:0.25
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  containerView.frame = CGRectMake(0, 0, scrSize.width, scrSize.height);
                              }
                              completion:^(BOOL finished){
                              }];
    return containerView;
    
}
- (void)hideLoadingView:(UIView *)loadingView
{
    [UIView animateKeyframesWithDuration:0.25
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  loadingView.frame = CGRectMake(loadingView.frame.origin.x, loadingView.frame.size.height, loadingView.frame.size.width, loadingView.frame.size.height);
                              }
                              completion:^(BOOL finished){
                                  
                                  [[loadingView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                  [loadingView removeFromSuperview];
                              }];
    
    
    
}

@end
