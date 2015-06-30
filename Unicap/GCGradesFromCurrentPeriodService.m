//
//  GCGradesFromCurrentPeriodService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCGradesFromCurrentPeriodService.h"
#import "GCBaseService.h"

@implementation GCGradesFromCurrentPeriodService

- (void)getGradesFromCurrentPeriodWithCompletition:(void (^)(bool))completition
                                           failure:(void (^)(NSError *))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_SUBJECTS_TESTS;
       
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {
        GCLoggerInfo(@"%@",response);
    } failure:^(NSError *error) {
        GCLoggerError(@"%@", error);
    }];

    
}

@end
