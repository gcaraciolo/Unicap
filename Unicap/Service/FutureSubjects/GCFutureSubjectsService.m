//
//  GCFutureSubjectsService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/7/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCFutureSubjectsService.h"
#import "GCBaseService.h"
#import <HTMLReader.h>
#import "GCFutureSubject.h"
#import "GCUtils.h"
#import "GCStudent.h"

@interface GCFutureSubjectsService()

@property (strong, nonatomic) NSMutableArray *futureSubjects;

@end

@implementation GCFutureSubjectsService

#pragma mark - Request

- (void)getFutureSubjectsWithCompletition:(void (^)(NSArray *))completition
                                  failure:(void (^)(NSError *))failure {
    
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_SUBJECTS_PENDING;
    
    
    //TODO: verificar se esse codigo deve ir para a baseService.
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {
        
        HTMLDocument *document = [HTMLDocument documentWithData:response
                                              contentTypeHeader:kREQUEST_CONTENT_TYPE];
        [self scrapFutureSubjects:document];
        completition([self.futureSubjects copy]);
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
}

#pragma mark - Scraping

-(void)scrapFutureSubjects:(HTMLDocument *)document {
    
    HTMLElement *tableElements = [GCUtils findElementFromDocument:document
                                                          WithTag:@"table"
                                                          atIndex:6];
    
    NSArray *allElements = [tableElements nodesMatchingSelector:@".tab_texto"];
    
    NSArray *tableContents = [GCUtils createTableFromArray:allElements
                                               numberOfColumns:7];
    
    [self fillStudentFutureSubjects:tableContents];
}

- (void) fillStudentFutureSubjects:(NSArray *)tableContents {
    
    NSMutableArray *futureSubjects = [NSMutableArray new];
    
    for (NSArray *row in tableContents) {
        
        GCFutureSubject *futureSubject = [GCFutureSubject new];
        futureSubject.period        = [GCUtils contentValueFromHTMLElement:row[0]];
        futureSubject.block         = [GCUtils contentValueFromHTMLElement:row[1]];
        futureSubject.code          = [GCUtils contentValueFromHTMLElement:row[2]];
        futureSubject.dot           = [GCUtils contentValueFromHTMLElement:row[3]];
        futureSubject.name          = [GCUtils contentValueFromHTMLElement:row[4]];
        futureSubject.credits       = [GCUtils contentValueFromHTMLElement:row[5]];
        futureSubject.workload      = [GCUtils contentValueFromHTMLElement:row[6]];
        
        [futureSubjects addObject:futureSubject];
    }
    self.futureSubjects = futureSubjects;
    [[GCStudent sharedInstance] setFutureSubjects:futureSubjects];    
    
}

@end
