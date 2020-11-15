//
//  ApiRoutes.h
//  PetSociety
//
//  Created by Joel Alcantara on 11/15/20.
//

#import <Foundation/Foundation.h>
#import "ApiEndPoints.m"

@interface ApiRoutes : NSObject

+(NSString *) getRequestURL: (ApiEndPoints) route :(NSInteger) value;

@end
