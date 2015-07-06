//
//  GCBaseService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCBaseService.h"
#import <AFNetworking.h>

@implementation GCBaseService

+ (void) doGETRequestURL:(NSString *)url
                  params:(NSDictionary *)params
            completition:(void (^)(id))completition
                 failure:(void (^)(NSError *))failure {
    
    GCLoggerInfo(@"url %@",url);
    GCLoggerInfo(@"params %@",params);
    GCLoggerInfo(@"doing request...");

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];    
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        GCLoggerInfo(@"response arrived with success");
        id response = responseObject;
        completition(response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        GCLoggerError(@"response arrived with error");
        failure(error);
    }];
}

@end
