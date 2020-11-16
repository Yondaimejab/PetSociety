//
//  BreedDetailViewController.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import "BreedDetailViewController.h"
#import "BreedsApiRequest.h"

@interface BreedDetailViewController ()

@end

@implementation BreedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferences = [NSUserDefaults standardUserDefaults];
    self.DetailsTitleLabel.text = self.breed.name;
    
    [self prepareViewController];
    
    if (self.breed.subBreeds.count > 0) {
        [self.subBreedTableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellIdentifier"];
        self.subBreedTableView.delegate = self;
        self.subBreedTableView.dataSource = self;
    } else {
        [self.subBreedTableView setHidden:true];
    }
}

-(void) prepareViewController {
    if (self.isSubBreed) {
        [self getPictureForSubBreed];
    } else {
        [self getPictureForBreed];
    }
}

-(void) getPictureForBreed {
    [BreedsApiRequest sendRequest:imageByBreed :1 :self.breed.name andCompletionHandler:^(NSDictionary * dict) {
        NSLog(@"%@",dict);
        if ([dict[@"status"] isEqual: @"success"]) {
            self.breed.imageURL = [dict[@"message"] firstObject];
            [self downloadAndReplaceImage: self.breed.imageURL];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorContainerView setHidden:false];
                [self.activityIndicator startAnimating];
            });
        }
    }];
}

-(void) getPictureForSubBreed {
    [BreedsApiRequest sendRequest:imageBySubBreed :1 : self.superBeed : self.breed.name andCompletionHandler:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if ([dict[@"status"] isEqual: @"success"]) {
            self.breed.imageURL = [dict[@"message"] firstObject];
            [self downloadAndReplaceImage: self.breed.imageURL];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorContainerView setHidden:false];
                [self.activityIndicator startAnimating];
            });
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.breed.subBreeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:@"CellIdentifier"];
    cell.textLabel.text = self.breed.subBreeds[indexPath.row].name;
    if ([self.breed.subBreeds[indexPath.row].imageURL isEqual:[self.preferences stringForKey: @"preferedUserImageURL"]]){
        cell.accessoryView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"star_fill"]];
    }else {
        cell.accessoryView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tableview_accesory_image"]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedBreed = indexPath.row;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BreedDetailViewController * detailViewController = (BreedDetailViewController *)[sb instantiateViewControllerWithIdentifier:@"DetailViewControllerIdentifier"];
    detailViewController.breed = self.breed.subBreeds[self.selectedBreed];
    detailViewController.isSubBreed = true;
    detailViewController.superBeed = self.breed.name;
    [self.navigationController pushViewController:detailViewController animated:true];
}

-(void) downloadAndReplaceImage: (NSString *)imageURL {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (imageURL.length > 0) {
            NSURL *newImageURL =  [NSURL URLWithString: imageURL];
            NSData *imageData = [NSData dataWithContentsOfURL:newImageURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.dogImageView.image = [UIImage imageWithData:imageData];
                [self.activityIndicator stopAnimating];
                [self.indicatorContainerView  setHidden:true];
            });
        }
    });
}

@end
