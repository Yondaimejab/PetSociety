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
    // Do any additional setup after loading the view.
    [self presentCamera];
    self.isSavingEnabled = NO;
}

-(void)presentCamera {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        pickerController.allowsEditing = true;
        [pickerController setSourceType: UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:pickerController animated:true completion:nil];
    } else {
        [self presentAlertWithTitle:@"Lo Sentimos." :@"No hay una camara disponible para utilizar."];
    }
}

- (IBAction)takePhotoAction:(id)sender {
    [self presentCamera];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    [self.dogImageView setImage:originalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    NSLog(@"Come clouser");
    self.isSavingEnabled = true;
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)saveImage:(id)sender {
    if (self.isSavingEnabled) {
        UIImageWriteToSavedPhotosAlbum(self.dogImageView.image, self, @selector(done:Error:Context:), nil);
    }
}

-(void)done:(UIImage *)image Error:(NSError *)error Context:(void*)context{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (error) {
            [self presentAlertWithTitle:@"Lo sentimos" :@"Su imagen ha no ha podido ser guardada."];
        }else {
            [self presentAlertWithTitle:@"Exito" :@"su imagen ha sido guardada."];
        }
    });
}

-(void)imageSaved {
    
}

-(void) presentAlertWithTitle: (NSString *)title : (NSString *)description {
    UIAlertController *alert = UIAlertController.new;
    [alert setTitle:title];
    [alert setMessage:description];
    [alert setModalPresentationStyle: UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];
    [self presentViewController:alert animated:true completion:nil];
}

@end
