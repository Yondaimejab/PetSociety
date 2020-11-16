//
//  BreedsTableViewController.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <UIKit/UIKit.h>
#import "DogBreed.h"
NS_ASSUME_NONNULL_BEGIN

@interface BreedsTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray<DogBreed *> *breeds;
@property (weak, nonatomic) NSUserDefaults *preferences;
@property (nonatomic) NSInteger selectedBreed;

@end

NS_ASSUME_NONNULL_END
