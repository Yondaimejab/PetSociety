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

+(NSString *) getRequestURL:(ApiEndPoints)route :(NSInteger) value {
    switch (route) {
        case listOfBreeds:
            return [baseURL stringByAppendingString:@"breeds/list/all"];
            break;
        case randomBreedImage:
            return [baseURL stringByAppendingString:@"breeds/image/random"];
        case seletedbreedImage:
            return [baseURL stringByAppendingString: [NSString stringWithFormat:@"breeds/image/random/%ld", (long)value]];
        case subBreedImages:
            return [baseURL stringByAppendingString: @"breed/hound/images"];
        case subBreedRandomImage:
            return [baseURL stringByAppendingString:@"breed/hound/image/random"];
        case SubBreedSelectedImage:
            return [baseURL stringByAppendingString: [NSString stringWithFormat:@"breed/hound/image/random/%ld", (long)value]];
        default:
            return @"";
            break;
    }
    return @"";
}


@end
