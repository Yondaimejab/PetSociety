//
//  PhotoViewController.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/14/20.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGestureRecognizer *cameraImageTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(presentCamera)];
    [self.cameraImageView addGestureRecognizer: cameraImageTapped];
    // Do any additional setup after loading the view.
    [self presentCamera];
}

-(void)presentCamera {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        pickerController.allowsEditing = true;
        [pickerController setSourceType: UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:pickerController animated:true completion:nil];
    } else {
        UIAlertController *alert = UIAlertController.new;
        [alert setTitle:@"Lo Sentimos."];
        [alert setMessage:@"No hay una camara disponible para utilizar."];
        [alert setModalPresentationStyle: UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:true completion:nil];
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }
}

- (IBAction)takePhotoAction:(id)sender {
    [self presentCamera];
}


@end
