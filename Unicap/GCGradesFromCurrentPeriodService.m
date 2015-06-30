//
//  GCGradesFromCurrentPeriodService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCGradesFromCurrentPeriodService.h"
#import "GCBaseService.h"
#import <HTMLReader/HTMLReader.h>

@implementation GCGradesFromCurrentPeriodService

- (void)getGradesFromCurrentPeriodWithCompletition:(void (^)(bool))completition
                                           failure:(void (^)(NSError *))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_SUBJECTS_TESTS;
       
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {

        HTMLDocument *document = [HTMLDocument documentWithData:response
                                contentTypeHeader:kREQUEST_CONTENT_TYPE];
        
        [self getCoefficient:document];
        
        
    } failure:^(NSError *error) {
        GCLoggerError(@"%@", error);
    }];

    
}


-(void)getCoefficient:(HTMLDocument *)document {
    
    
    NSArray *coefficient = [document nodesMatchingSelector:@".tab_aluno_texto"];
    GCLoggerInfo(@"%@",coefficient);   
    
}


@end
