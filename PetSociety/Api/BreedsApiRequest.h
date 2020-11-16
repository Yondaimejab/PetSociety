//
//  BreadsApiRequest.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <Foundation/Foundation.h>
#import "ApiEndPoints.m"

@interface BreedsApiRequest : NSObject

+(void) sendRequest: (ApiEndPoints)toEndPoint andCompletionHandler:(void (^)(NSDictionary *))completionHandler;

+(void) sendRequest: (ApiEndPoints)toEndPoint :(NSInteger)value :(NSString *)breedName andCompletionHandler:(void (^)(NSDictionary *))completionHandler;

+(void) sendRequest: (ApiEndPoints)toEndPoint :(NSInteger)value :(NSString *)breedName :(NSString *) subBreedName andCompletionHandler:(void (^)(NSDictionary *))completionHandler;

@end
