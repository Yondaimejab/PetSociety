//
//  PhotoViewController.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoViewController : UIViewController <UINavigationControllerDelegate , UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
@property (nonatomic) BOOL isSavingEnabled;

@end

NS_ASSUME_NONNULL_END
