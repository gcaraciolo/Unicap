//
//  GCTestingScheduleService.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/7/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCTestingScheduleService : NSObject

- (void)getTestingScheduleWithCompletition:(void (^)(NSArray *))completition
                                 failure:(void (^)(NSError *))failure;

@end
