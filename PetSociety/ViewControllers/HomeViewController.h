//
//  HomeViewController.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import <UIKit/UIKit.h>
#import "BreedsApiRequest.h"
#import "ApiRoutes.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *moreBreedsButton;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteBreedImage;
@property (weak, nonatomic) IBOutlet UIButton *favoriteSelectionButton;
@property (weak, nonatomic) IBOutlet UIView *indicatorContainerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) NSUserDefaults *preferences;
@property (weak, nonatomic) NSString *imageUrl;



@end

NS_ASSUME_NONNULL_END
