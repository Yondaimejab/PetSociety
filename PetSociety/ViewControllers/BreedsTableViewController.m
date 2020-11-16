//
//  BreedsTableViewController.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import "BreedsTableViewController.h"
#import "BreedsApiRequest.h"
#import "ApiRoutes.h"
#import "DogBreed.h"
#import "BreedDetailViewController.h"

@interface BreedsTableViewController ()

@end

@implementation BreedsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setPrefersLargeTitles:true];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"BreedCellId"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.preferences = [NSUserDefaults standardUserDefaults];
    [BreedsApiRequest sendRequest:listOfBreeds andCompletionHandler:^(NSDictionary *dict) {
        NSLog(@"%@", dict);
        if ([dict[@"status"] isEqual:@"success"]) {
            self.breeds = NSMutableArray.new;
            NSDictionary *breedsDict = dict[@"message"];
            for (NSDictionary *breedDictKey in breedsDict) {
                NSMutableArray<DogBreed *> *subBreedArray = NSMutableArray.new;
                DogBreed *breed = [DogBreed initWithName:breedDictKey :subBreedArray];
                for (NSString *subBreedKey in breedsDict[breedDictKey]) {
                    DogBreed *subBreed = [DogBreed initWithName:subBreedKey :NSMutableArray.new];
                    [subBreedArray addObject:subBreed];
                }
                [self.breeds addObject:breed];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }else {
            
        }
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.breeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:@"BreedCellId"];
    cell.textLabel.text = self.breeds[indexPath.row].name;
    if ([self.breeds[indexPath.row].imageURL isEqual:[self.preferences stringForKey: @"preferedUserImageURL"]]){
        cell.accessoryView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"star_fill"]];
    }else {
        cell.accessoryView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tableview_accesory_image"]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedBreed = indexPath.row;
    [self performSegueWithIdentifier:@"goToBreedDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqual:@"goToBreedDetail"]) {
        BreedDetailViewController * detailsViewController = segue.destinationViewController;
        detailsViewController.breed = self.breeds[self.selectedBreed];
        detailsViewController.isSubBreed = false;
    }
}

@end
