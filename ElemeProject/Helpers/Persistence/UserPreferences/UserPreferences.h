//
//  UserPreferences.h
//  
//
//  Created by Sam Lau on 6/19/15.
//
//

#import <Foundation/Foundation.h>

@interface UserPreferences : NSObject

+ (void)enableAutoLocation;
+ (void)disableAutoLocation;
+ (BOOL)isAutoLocation;

@end
