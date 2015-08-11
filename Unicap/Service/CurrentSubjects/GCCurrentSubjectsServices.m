//
//  GCCurrentSubjectsServices.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCCurrentSubjectsServices.h"
#import "GCBaseService.h"
#import <HTMLReader/HTMLReader.h>
#import "GCStudent.h"
#import "GCSubject.h"

@interface GCCurrentSubjectsServices()

@property (strong, nonatomic) NSMutableArray *currentSubjects;

@end

@implementation GCCurrentSubjectsServices

#pragma mark - Request

- (void)getInformationsFromCurrentPeriodWithCompletition:(void (^)(NSArray *))completition
                                                 failure:(void (^)(NSError *))failure {
    
    
    self.currentSubjects = [NSMutableArray new];
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_SUBJECTS_CURRENT;
    
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {
        
        HTMLDocument *document = [HTMLDocument documentWithData:response
                                              contentTypeHeader:kREQUEST_CONTENT_TYPE];

        [self scrapSubjectsFromCurrentPeriod:document];
        [self getGradesFromCurrentPeriodWithCompletition:^() {
            
            completition([self.currentSubjects copy]);
        } failure:^(NSError *error) {
            
            GCLoggerError(@"%@", error);
        }];
    
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
    
}

- (void)getGradesFromCurrentPeriodWithCompletition:(void (^)())completition
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
        completition();
        
    } failure:^(NSError *error) {
        GCLoggerError(@"%@", error);
    }];
    
    
}

#pragma mark - Scrap

-(void)scrapSubjectsFromCurrentPeriod:(HTMLDocument *)document {
    
    NSArray *allElements = [document nodesMatchingSelector:@".tab_texto"];
    
    int col = 0;
    NSMutableArray *subjectsElements = [NSMutableArray new];
    for (HTMLElement *element in allElements) {
        col++;
        NSString *txt = element.textContent;
        NSString *trimmedString = [txt stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        //last valid field? TODO: check with other students
        if (!trimmedString || [trimmedString isEqualToString:@""]) {
            break;
        }
        
        [subjectsElements addObject:trimmedString];
        
        if (col == 8) {
            [self fillSubjectFromSubjectRequest:subjectsElements];
            subjectsElements = [NSMutableArray new];
            col = 0;
        }
        
    }
}

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
        NSString *txt = element.textContent;
        NSString *trimmedString = [txt stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [subjectsElements addObject:trimmedString];
        
        if (col == 8) {
            [self fillSubjectFromGradesRequest:subjectsElements];
            subjectsElements = [NSMutableArray new];
            col = 0;
        }
        
    }
}

#pragma mark - Helper

-(void)fillSubjectFromSubjectRequest:(NSArray *)subjectAsArray {
    
    GCSubject *subject          = [GCSubject new];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    if (subjectAsArray[0]) {
        subject.subjectCode            = subjectAsArray[0];
    }
    if (subjectAsArray[1]) {
        subject.name            = subjectAsArray[1];
    }
    if (subjectAsArray[2]) {
        subject.classCode       = subjectAsArray[2];
    }
    if (subjectAsArray[3]) {
        subject.classroom    = subjectAsArray[3];
    }
    if (subjectAsArray[4]) {
        subject.schedule         = subjectAsArray[4];
//        NSArray *times = [subjectAsArray[4] componentsSeparatedByCharactersInSet:
//                            [NSCharacterSet characterSetWithCharactersInString:@" "]];
//        subject.schedule         = times;
    }
    if (subjectAsArray[5] && ![subjectAsArray[5] isEqualToString:@"--"]) {
        subject.workload      = [formatter numberFromString:subjectAsArray[5]];
    }
    if (subjectAsArray[6] && ![subjectAsArray[6] isEqualToString:@"--"]) {
        subject.credits    = subjectAsArray[6];
    }
    if (subjectAsArray[7] && ![subjectAsArray[7] isEqualToString:@"--"]) {
        subject.period    = subjectAsArray[7];
    }
    
    //TODO: check this subject is the same as the request for get grades!
    [self.currentSubjects addObject:subject];
}


-(void)fillSubjectFromGradesRequest:(NSArray *)subjectAsArray {
    
    GCSubject *subject;
    
    for (GCSubject *s in self.currentSubjects) {
        if([s.subjectCode isEqualToString:subjectAsArray[0]]) {
            subject = s;
        }
    }
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;

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
        subject.currentSituation = subjectAsArray[7];
    }
    
}




@end
