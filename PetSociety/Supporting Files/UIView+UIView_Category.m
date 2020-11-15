//
//  UIView+UIView_Category.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import "UIView+UIView_Category.h"
#import <UIKit/UIKit.h>

IB_DESIGNABLE
@implementation UIView (UIView_Category)

-(void) setBorderColor:(UIColor *)borderColor {
    [borderColor setStroke];
}

- (void)setBorderWidth:(NSInteger)borderWidth{
    self.layer.borderWidth = borderWidth;
}

-(void)setBorderRadius:(NSInteger)borderRadius {
    self.layer.cornerRadius = borderRadius;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (NSInteger)borderRadius{
    return self.layer.cornerRadius;
}

- (NSInteger)borderWidth{
    return self.layer.borderWidth;
}

- (void)setShadowIsEnabled:(BOOL *)shadowIsEnabled {
    self.layer.shadowRadius  = 1.5f;
    self.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    self.layer.shadowOffset  = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowOpacity = 0.9f;
    self.layer.masksToBounds = NO;

    UIEdgeInsets shadowInsets     = UIEdgeInsetsMake(0, 0, -1.5f, 0);
    UIBezierPath *shadowPath      = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(self.bounds, shadowInsets)];
    self.layer.shadowPath    = shadowPath.CGPath;
    self.hasShadow = YES;
}

- (BOOL *)shadowIsEnabled {
    return self.hasShadow;
}

@end
