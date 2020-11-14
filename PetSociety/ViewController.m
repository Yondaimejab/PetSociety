//
//  ViewController.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self animateSplashScreen];
    // Do any additional setup after loading the view.
}

-(void) animateSplashScreen {
    NSLayoutConstraint *temp = self.petSplasHeightConstraint;
    [self.petSplasHeightConstraint setActive:false];
    self.petSplasHeightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.petSplashScreen attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0];
    [self.petSplasHeightConstraint setActive: YES];
    
    [UIView animateWithDuration:600 animations:^{
            self.petSplasHeightConstraint = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.petSplashScreen attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0];
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"mainTabbarController" sender:self];
    }];
}


@end
