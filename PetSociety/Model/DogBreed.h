//
//  DogBreed.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DogBreed : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSMutableArray<DogBreed *> *subBreeds;

+(DogBreed *) initWithName: (NSString *)name :(NSMutableArray<DogBreed *> *)subBreeds;

@end

NS_ASSUME_NONNULL_END
