//
//  BreedDetailViewController.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <UIKit/UIKit.h>
#import "DogBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface BreedDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DogBreed *breed;
@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
@property (weak, nonatomic) IBOutlet UITableView *subBreedTableView;
@property (weak, nonatomic) IBOutlet UILabel *DetailsTitleLabel;
@property (weak, nonatomic) NSUserDefaults *preferences;
@property (nonatomic) NSInteger selectedBreed;
@property (weak, nonatomic) IBOutlet UIView *indicatorContainerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic) BOOL isSubBreed;
@property (nonatomic) NSString * superBeed;
@property (weak, nonatomic) IBOutlet UIButton *preferedBreedButton;
@property (nonatomic) BOOL isPreferedBreed;

@end

NS_ASSUME_NONNULL_END
