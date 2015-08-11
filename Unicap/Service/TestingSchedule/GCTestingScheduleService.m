//
//  GCTestingScheduleService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/7/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCTestingScheduleService.h"
#import "GCBaseService.h"
#import <HTMLReader.h>
#import "GCUtils.h"
#import "GCStudent.h"
#import "GCTestingSchedule.h"

@interface GCTestingScheduleService()

@property (strong, nonatomic) NSMutableArray *testingSchedules;

@end


@implementation GCTestingScheduleService

#pragma mark - Request

- (void)getTestingScheduleWithCompletition:(void (^)(NSArray *))completition
                                 failure:(void (^)(NSError *))failure {
    
    self.testingSchedules = [NSMutableArray new];
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_SUBJECTS_TESTING_SCHEDULE;
    
    
    //TODO: verificar se esse codigo deve ir para a baseService.
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {
        
        HTMLDocument *document = [HTMLDocument documentWithData:response
                                              contentTypeHeader:kREQUEST_CONTENT_TYPE];
        [self scrapTestingSchedule:document];
        completition([self.testingSchedules copy]);
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
    
}

#pragma mark - Scraping

-(void)scrapTestingSchedule:(HTMLDocument *)document {
    
    HTMLElement *tableElements = [GCUtils findElementFromDocument:document
                                                          WithTag:@"table"
                                                          atIndex:5];
    
    NSArray *allElements = [tableElements nodesMatchingSelector:@".tab_texto"];
    
    NSArray *tableContents = [GCUtils createTableFromArray:allElements
                                               numberOfColumns:8];
    
    [self fillStudentFutureSubjects:tableContents];
}

- (void) fillStudentFutureSubjects:(NSArray *)tableContents {
    
    NSMutableArray *testingSchedules = [NSMutableArray new];
    
    for (NSArray *row in tableContents) {
        
        GCTestingSchedule *testingSchedule = [GCTestingSchedule new];
        testingSchedule.code                = [GCUtils contentValueFromHTMLElement:row[0]];
        testingSchedule.classCode           = [GCUtils contentValueFromHTMLElement:row[1]];
        testingSchedule.name                = [GCUtils contentValueFromHTMLElement:row[2]];
        testingSchedule.firstGQFirstCall    = [GCUtils contentValueFromHTMLElement:row[3]];
        testingSchedule.firstGQSecondCall   = [GCUtils contentValueFromHTMLElement:row[4]];
        testingSchedule.secondGQ            = [GCUtils contentValueFromHTMLElement:row[5]];
        testingSchedule.final               = [GCUtils contentValueFromHTMLElement:row[6]];
        testingSchedule.finalSecondCall     = [GCUtils contentValueFromHTMLElement:row[7]];
        
        [testingSchedules addObject:testingSchedule];
    }
    
    self.testingSchedules = testingSchedules;    
}

@end
