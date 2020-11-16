//
//  DogBreed.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import "DogBreed.h"

@implementation DogBreed

+ (DogBreed *)initWithName:(NSString *)name :(NSMutableArray<DogBreed *> *)subBreeds {
    DogBreed *breed = DogBreed.new;
    breed.name = name;
    breed.subBreeds = subBreeds;
    return breed;
}

@end
