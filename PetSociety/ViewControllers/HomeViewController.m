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

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (![self.imageUrl isEqual:[self.preferences stringForKey: @"preferedUserImageURL"]]) {
        self.imageUrl = [self.preferences stringForKey: @"preferedUserImageURL"];
        [self presentHomeImage];
    }
}

-(void) presentHomeImage {
    if (self.imageUrl && ![self.imageUrl isEqual:@""]) {
        NSString *parentBreed = [self.preferences stringForKey:@"parentBreed"];
        NSString *preferedBreed = [self.preferences stringForKey:@"breedName"];;
        if (parentBreed && ![parentBreed isEqual:@""]) {
            if (preferedBreed && ![preferedBreed isEqual:@""]) {
                [self getPictureForSubBreed:preferedBreed :parentBreed];
            } else {
                NSLog(@"Verify why would there be a subBreed with no parentBreed");
            }
        } else if (preferedBreed && ![preferedBreed isEqual:@""]) {
            [self getPictureForBreed:preferedBreed];
        } else {
            [self downloadAndReplaceImage:self.imageUrl];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorContainerView setHidden:false];
                [self.activityIndicator startAnimating];
                [self.favoriteSelectionButton setImage:[UIImage imageNamed:@"star_fill"] forState:UIControlStateNormal];
            });
        }
    } else {
        [BreedsApiRequest sendRequest: randomBreedImage andCompletionHandler:^(NSDictionary * dict) {
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

-(void) getPictureForBreed: (NSString *)breedName {
    [BreedsApiRequest sendRequest:imageByBreed :1 :breedName andCompletionHandler:^(NSDictionary * dict) {
        NSLog(@"%@",dict);
        if ([dict[@"status"] isEqual: @"success"]) {
            self.imageUrl = [dict[@"message"] firstObject];
            [self downloadAndReplaceImage: self.imageUrl];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorContainerView setHidden:false];
                [self.activityIndicator startAnimating];
                [self.favoriteSelectionButton setImage:[UIImage imageNamed:@"star_fill"] forState:UIControlStateNormal];
            });
        }
    }];
}

-(void) getPictureForSubBreed: (NSString *)subBread :(NSString *)superBreed {
    [BreedsApiRequest sendRequest:imageBySubBreed :1 :superBreed  :subBread andCompletionHandler:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([dict[@"status"] isEqual: @"success"]) {
            self.imageUrl = [dict[@"message"] firstObject];
            [self downloadAndReplaceImage: self.imageUrl];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorContainerView setHidden:false];
                [self.activityIndicator startAnimating];
                [self.favoriteSelectionButton setImage:[UIImage imageNamed:@"star_fill"] forState:UIControlStateNormal];
            });
        }else {
            NSLog(@"loglog");
        }
    }];
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
