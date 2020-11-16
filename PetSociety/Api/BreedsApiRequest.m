//
//  BreedApiRequest.m
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <Foundation/Foundation.h>
#import "BreedsApiRequest.h"
#import "ApiRoutes.h"
#import "ApiEndPoints.m"

@implementation BreedsApiRequest

+(void) sendRequest: (ApiEndPoints)toEndPoint :(NSInteger)value :(NSString *)breedName andCompletionHandler:(void (^)(NSDictionary *))completionHandler {
    NSString *urlString = [ApiRoutes getRequestURL:toEndPoint :value :breedName];
    NSURL *requestURL = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSError *writeError;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&writeError];
            completionHandler(dict);
        }] resume];
}

+ (void)sendRequest:(ApiEndPoints)toEndPoint andCompletionHandler:(void (^)(NSDictionary *))completionHandler {
    NSString *urlString = [ApiRoutes getRequestURL:toEndPoint];
    NSURL *requestURL = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSError *writeError;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&writeError];
            completionHandler(dict);
        }] resume];
}

+ (void)sendRequest:(ApiEndPoints)toEndPoint :(NSInteger)value :(NSString *)breedName :(NSString *)subBreedName andCompletionHandler:(void (^)(NSDictionary *))completionHandler {
    NSString *urlString = [ApiRoutes getRequestURL:toEndPoint :value :breedName :subBreedName];
    NSURL *requestURL = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSError *writeError;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&writeError];
            completionHandler(dict);
        }] resume];
}

@end
