//
//  ApiRoutes.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import "ApiRoutes.h"
#import "ApiEndPoints.m"

@implementation ApiRoutes

static NSString *baseURL = @"https://dog.ceo/api/";

+(NSString *)getRequestURL:(ApiEndPoints)route {
    switch (route) {
        case listOfBreeds:
            return [baseURL stringByAppendingString: @"breeds/list/all"];
        case randomBreedImage:
            return [baseURL stringByAppendingString: @"breeds/image/random"];
        default:
            return @"";
    }
}

+(NSString *) getRequestURL:(ApiEndPoints)route :(NSInteger)value :(NSString *)breedName :(NSString *)subBreedName {
    switch(route) {
        case imageBySubBreed:
            return [baseURL stringByAppendingString: [NSString stringWithFormat: @"breed/%@/%@/images/random/%ld", breedName, subBreedName, (long)value]];
        default:
            return @"";
    }
}

+(NSString *) getRequestURL:(ApiEndPoints)route :(NSInteger) value :(NSString *)breedName {
    switch (route) {
        case imageByBreed:
            return [baseURL stringByAppendingString: [NSString stringWithFormat: @"breed/%@/images/random/%ld", breedName, (long)value]];
        default:
            return @"";
    }
}


@end
