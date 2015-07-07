//
//  GCStudentService.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/2/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCStudent.h"

@interface GCStudentService : NSObject

- (void)getStudentInformationsWithCompletition:(void (^)(GCStudent *))completition
                                       failure:(void (^)(NSError *))failure;

@end
