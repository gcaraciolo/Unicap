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

@interface GCPastSubjectsService()

@property (strong, nonatomic) NSMutableSet *pastSubjects;

@end

@implementation GCPastSubjectsService

#pragma mark - Request

- (void)getPastSubjectsWithCompletition:(void (^)(NSMutableSet *))completition
                                failure:(void (^)(NSError *))failure {
    
    self.pastSubjects = [NSMutableSet new];
    
    
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
     
    HTMLElement *table = [self findElementFromDocument:document
                                               WithTag:@"table"
                                               atIndex:6];
    
    NSArray *allElements = [table nodesMatchingSelector:@".tab_texto"];
    
    [self readTable:allElements];
    
}

-(void)readTable:(NSArray *)tableElements {
    
    NSArray *table = [self createTableFromArray:tableElements
                                    withRowSize:5];
    
    NSLog(@"%@", table);
    
    for (NSArray *sub in table) {       
        for (HTMLElement *e in sub) {
            NSLog(@"%@", e.textContent);
        }
    }
    
}

-(NSArray *)createTableFromArray:(NSArray *)array withRowSize:(int)rowSize {
    
    NSMutableArray *table = [NSMutableArray new];
    NSMutableArray *row = [NSMutableArray new];
    
    int count = 0, i = 0;
    for (id obj in array) {
        if (count == rowSize) {
            [table addObject:row];
            count = 0;
            row = [NSMutableArray new];
        }
        [row addObject:obj];
        count++;
        i++;
    }
    
    return [table copy];
}

-(NSString *)trimmedString:(NSString *)string {
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;

}


#pragma mark - Helper

-(HTMLElement *)findElementFromDocument:(HTMLDocument *)document
                                WithTag:(NSString *)tag
                                atIndex:(int)index {
    
    HTMLSelector *selector = [HTMLSelector selectorForString:tag];
    
   int count = 0;
    for (HTMLElement *node in document.treeEnumerator) {
        
        if ([node isKindOfClass:[HTMLElement class]] &&
            [selector matchesElement:node]) {
            
            if (count == index) {
                return node;
            }
            count++;
        }

    }
    return nil;
}




@end
