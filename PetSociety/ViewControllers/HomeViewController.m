//
//  HomeViewController.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import "HomeViewController.h"
#import <UIKit/UIKit.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)selectPreferedBreedAction:(id)sender {
}

- (IBAction)seeMoreBreedsAction:(id)sender {
    UITabBarController *parentTabbar = ((UITabBarController *)self.parentViewController);
    parentTabbar.selectedIndex = 2;
}


@end
