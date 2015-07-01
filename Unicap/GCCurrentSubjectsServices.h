//
//  GCCurrentSubjectsServices.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCCurrentSubjectsServices : NSObject

- (void)getSubjectsFromCurrentPeriodWithCompletition:(void (^)(NSMutableSet *))completition
                                             failure:(void (^)(NSError *))failure;

@end
