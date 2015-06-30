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
#import "GCStudent.h"
#import "GCSubject.h"

@implementation GCGradesFromCurrentPeriodService

#pragma mark - Request

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
        
        [self scrapCoefficient:document];
        [self scrapGradesFromCurrentPeriod:document];
        
    } failure:^(NSError *error) {
        GCLoggerError(@"%@", error);
    }];

    
}

#pragma mark - Scrap

-(void)scrapCoefficient:(HTMLDocument *)document {
    
    NSArray *elements = [document nodesMatchingSelector:@".tab_aluno_texto"];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    HTMLElement *courseCoefficientElement = elements[5];
    NSNumber *courseCoefficient = [formatter numberFromString:courseCoefficientElement.textContent];

    
    HTMLElement *lastCoefficientElement = elements[6];
    NSNumber *lastCoefficient = [formatter numberFromString:lastCoefficientElement.textContent];
    
    [[GCStudent sharedInstance] saveCourseCoefficient:courseCoefficient
                                   andLastCoefficient:lastCoefficient];
    
    
}

-(void)scrapGradesFromCurrentPeriod:(HTMLDocument *)document {

    NSArray *allElements = [document nodesMatchingSelector:@".tab_texto"];
    
    int col = 0;
    NSMutableArray *subjectsElements = [NSMutableArray new];
    for (HTMLElement *element in allElements) {
        col++;
        [subjectsElements addObject:element.textContent];
        
        if (col == 8) {
            [self fillCurrentSubject:subjectsElements];
            subjectsElements = [NSMutableArray new];
            col = 0;
        }

    }
}

#pragma mark - Helper

-(void)fillCurrentSubject:(NSArray *)subjectAsArray {
    
    GCSubject *subject          = [GCSubject new];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    //TODO: check wheter regex is ok for each object
    if (subjectAsArray[0]) {
        subject.code            = subjectAsArray[0];
    }
    if (subjectAsArray[1]) {
        subject.classCode       = subjectAsArray[1];
    }
    if (subjectAsArray[2] && ![subjectAsArray[2] isEqualToString:@"--"]) {
        subject.firstGrade      = [formatter numberFromString:subjectAsArray[2]];
    }
    if (subjectAsArray[3] && ![subjectAsArray[3] isEqualToString:@"--"]) {
        subject.secondeGrade    = [formatter numberFromString:subjectAsArray[3]];
    }
    if (subjectAsArray[4] && ![subjectAsArray[4] isEqualToString:@"--"]) {
        subject.average         = [formatter numberFromString:subjectAsArray[4]];
    }
    if (subjectAsArray[5] && ![subjectAsArray[5] isEqualToString:@"--"]) {
        subject.finalGrade      = [formatter numberFromString:subjectAsArray[5]];
    }
    if (subjectAsArray[6] && ![subjectAsArray[6] isEqualToString:@"--"]) {
        subject.finalAverage    = subjectAsArray[6];
    }
    if (subjectAsArray[7]) {
        NSString *situation = subjectAsArray[7];
        NSString *trimmedString = [situation stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        subject.situation       = trimmedString;
    }
    
}


@end
