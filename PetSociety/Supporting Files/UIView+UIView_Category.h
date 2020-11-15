//
//  UIView+UIView_Category.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface UIView (UIView_Category)

@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable NSInteger borderRadius;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable BOOL *shadowIsEnabled;
@property (nonatomic) BOOL *hasShadow;



@end

NS_ASSUME_NONNULL_END
