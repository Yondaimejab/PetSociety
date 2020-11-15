//
//  HomeViewController.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import "HomeViewController.h"
#import <UIKit/UIKit.h>
#import "BreedsApiRequest.h"
#import "ApiRoutes.h"

@interface HomeViewController ()

@end
@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferences = [NSUserDefaults standardUserDefaults];
    self.imageUrl = [self.preferences stringForKey: @"preferedUserImageURL"];
    [self presentHomeImage];
}

-(void) presentHomeImage {
    if (self.imageUrl) {
        [self downloadAndReplaceImage:self.imageUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indicatorContainerView setHidden:false];
            [self.activityIndicator startAnimating];
        });
    } else {
        [BreedsApiRequest sendRequest: randomBreedImage:0 andCompletionHandler:^(NSDictionary * dict) {
            NSLog(@"%@",dict);
            if ([dict[@"status"] isEqual: @"success"]) {
                self.imageUrl = dict[@"message"];
                [self downloadAndReplaceImage: self.imageUrl];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.indicatorContainerView setHidden:false];
                    [self.activityIndicator startAnimating];
                });
            }
        }];
    }
}

- (IBAction)selectPreferedBreedAction:(id)sender {
    if (self.imageUrl.length > 0) {
        [self.preferences setObject: self.imageUrl forKey: @"preferedUserImageURL"];
        [self.preferences synchronize];
    }
}

- (IBAction)seeMoreBreedsAction:(id)sender {
    UITabBarController *parentTabbar = ((UITabBarController *)self.parentViewController);
    parentTabbar.selectedIndex = 2;
}

-(void) downloadAndReplaceImage: (NSString *)imageURL {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (imageURL.length > 0) {
            NSURL *newImageURL =  [NSURL URLWithString: imageURL];
            NSData *imageData = [NSData dataWithContentsOfURL:newImageURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.favoriteBreedImage.image = [UIImage imageWithData:imageData];
                [self.activityIndicator stopAnimating];
                [self.indicatorContainerView  setHidden:true];
            });
        }
    });
}
@end
