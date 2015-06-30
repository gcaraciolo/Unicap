//
//  GCGradesFromCurrentPeriodService.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCGradesFromCurrentPeriodService : NSObject

- (void)getGradesFromCurrentPeriodWithCompletition:(void (^)(bool))completition
                                           failure:(void (^)(NSError *))failure;

@end
