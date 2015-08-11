//
//  GCStudentService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/2/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCStudentService.h"
#import "GCBaseService.h"
#import <HTMLReader.h>

@implementation GCStudentService

- (void)getStudentInformationsWithCompletition:(void (^)(GCStudent *))completition
                                       failure:(void (^)(NSError *))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    params[kROUTINE] = kROUTINE_PERSONAL;
    
    NSMutableString *urlAuth = [NSMutableString new];
    [urlAuth appendString:kREQUEST_BASE_URL];
    [urlAuth appendString:[GCStudentCredentials sharedInstance].sessionID];
    
    [GCBaseService doGETRequestURL:urlAuth params:params completition:^(id response) {
        
        HTMLDocument *document = [HTMLDocument documentWithData:response
                                              contentTypeHeader:kREQUEST_CONTENT_TYPE];
        
        completition([self scrapStudentInformations:document]);
    } failure:^(NSError *error) {
        GCLoggerError(@"%@", error);
    }];
}

- (GCStudent *)scrapStudentInformations:(HTMLDocument *)document {
    
    NSArray *allHTMLElements = [document nodesMatchingSelector:@".tab_texto"];
    NSMutableArray *allElements = [NSMutableArray new];
    for (HTMLElement *element in allHTMLElements) {
        NSString *txt = element.textContent;
        NSString *trimmedString = [txt stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [allElements addObject:trimmedString];
    }
    
    
    GCStudent *student = [GCStudent sharedInstance];
    
    if (allElements[0])  {  student.registration            = allElements[0];   }
    if (allElements[1])  {  student.name                    = allElements[1];   }
    if (allElements[2])  {  student.course                  = allElements[2];   }
    if (allElements[3])  {  student.curriculum              = allElements[3];   }
    if (allElements[4])  {  student.shift                   = allElements[4];   }
    if (allElements[5])  {  student.gender                  = allElements[5];   }
    if (allElements[6])  {  student.birthday                = allElements[6];   }
    if (allElements[7])  {  student.placeOfBirth            = allElements[7];   }
    if (allElements[8])  {  student.civilStatus             = allElements[8];   }
    if (allElements[9])  {  student.religion                = allElements[9];   }
    if (allElements[10]) {  student.breed                   = allElements[10];  }
    if (allElements[11]) {  student.motherName              = allElements[11];  }
    if (allElements[12]) {  student.fatherName              = allElements[12];  }
    if (allElements[13]) {  student.identity                = allElements[13];  }
    if (allElements[14]) {  student.cpf                     = allElements[14];  }
    if (allElements[15]) {  student.street                  = allElements[15];  }
    if (allElements[16]) {  student.neighboor               = allElements[16];  }
    if (allElements[17]) {  student.city                    = allElements[17];  }
    if (allElements[18]) {  student.uf                      = allElements[18];  }
    if (allElements[19]) {  student.cep                     = allElements[19];  }
    if (allElements[20]) {  student.email                   = allElements[20];  }
    if (allElements[21]) { 	student.celPhoneNumber          = allElements[21];  }
    if (allElements[22]) { 	student.homePhoneNumber         = allElements[22];  }
    if (allElements[23]) {  student.commercialChoneNumber   = allElements[23];  }
    
    return student;
}


@end
