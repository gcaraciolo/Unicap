//
//  GCPastSubjectsServices.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/6/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCPastSubjectsService.h"
#import "GCBaseService.h"
#import <HTMLReader.h>
#import "GCPastSubject.h"
#import "GCUtils.h"
#import "GCStudent.h"

@interface GCPastSubjectsService()

@property (strong, nonatomic) NSMutableArray *pastSubjects;

@end

@implementation GCPastSubjectsService

#pragma mark - Request

- (void)getPastSubjectsWithCompletition:(void (^)(NSArray *))completition
                                failure:(void (^)(NSError *))failure {
    
    self.pastSubjects = [NSMutableArray new];
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_SUBJECTS_PAST;
    
    
    //TODO: verificar se esse codigo deve ir para a baseService.
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {
        
        HTMLDocument *document = [HTMLDocument documentWithData:response
                                              contentTypeHeader:kREQUEST_CONTENT_TYPE];
        [self scrapPastSubjects:document];
        completition([self.pastSubjects copy]);
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
    
}

#pragma mark - Scraping

-(void)scrapPastSubjects:(HTMLDocument *)document {
     
    HTMLElement *tableElements = [GCUtils findElementFromDocument:document
                                                  WithTag:@"table"
                                                  atIndex:6];
    
    NSArray *allElements = [tableElements nodesMatchingSelector:@".tab_texto"];
    
    NSArray *tableContents = [GCUtils createTableFromArray:allElements
                                       numberOfColumns:5];
    
    [self fillStudentPastSubjects:tableContents];
}

- (void) fillStudentPastSubjects:(NSArray *)tableContents {
    
    NSMutableArray *pastSubjects = [NSMutableArray new];
    
    for (NSArray *row in tableContents) {
        
        GCPastSubject *pastSubject = [GCPastSubject new];
        pastSubject.period     = [GCUtils contentValueFromHTMLElement:row[0]];
        pastSubject.code       = [GCUtils contentValueFromHTMLElement:row[1]];
        pastSubject.name       = [GCUtils contentValueFromHTMLElement:row[2]];
        pastSubject.average    = [GCUtils contentValueFromHTMLElement:row[3]];
        pastSubject.situation  = [GCUtils contentValueFromHTMLElement:row[4]];
        
        [pastSubjects addObject:pastSubject];
    }
    
    self.pastSubjects = pastSubjects;
//    [[GCStudent sharedInstance] setPastSubjects:pastSubjects];
    
    
}




@end
