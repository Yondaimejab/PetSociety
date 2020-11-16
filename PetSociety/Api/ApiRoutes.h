//
//  ApiRoutes.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <Foundation/Foundation.h>
#import "ApiEndPoints.m"

@interface ApiRoutes : NSObject

+(NSString *) getRequestURL:(ApiEndPoints)route;

+(NSString *) getRequestURL: (ApiEndPoints) route :(NSInteger) value :(NSString *) breedName;

+(NSString *) getRequestURL:(ApiEndPoints)route :(NSInteger)value :(NSString *)breedName :(NSString *)subBreedName;

@end
