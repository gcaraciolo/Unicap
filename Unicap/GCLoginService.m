//
//  GCLoginService.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCLoginService.h"
#import <HTMLReader/HTMLReader.h>
#import <AFNetworking/AFNetworking.h>

#import "GCBaseService.h"
#import "GCStudentCredentials.h"

#define FORM @"form"
#define CONTENT_TYPE @"Content-Type"
#define ACTION @"action"


@interface GCLoginService()

@end

@implementation GCLoginService


-(void)createURLForLoginWithCompletition:(void (^)(NSString *))completition
                                 failure:(void (^)(bool))failure{

    NSURL *URL = [NSURL URLWithString:kREQUEST_BASE_URL];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:URL completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
               
           NSString *contentType = nil;
           if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
               NSDictionary *headers = [(NSHTTPURLResponse *)response allHeaderFields];
               contentType = headers[CONTENT_TYPE];
           }
      
           HTMLDocument *document = [HTMLDocument documentWithData:data
                                                 contentTypeHeader:contentType];
      
           
           //get token
           NSDictionary *formNode = [[document firstNodeMatchingSelector:FORM] attributes];
           NSString *temporarySessionID = formNode[ACTION];
          
          if (!formNode) {
              failure(YES);
          } else {
              //construct full url for request
              NSMutableString *loginURL = [NSMutableString new];
              [loginURL appendString:kREQUEST_BASE_URL];
              [loginURL appendString:temporarySessionID];
              
              completition(loginURL);
          }
          
      }] resume];
}

-(void)doLoginWithCompletition:(void (^)(bool succeded))completition
                       failure:(void (^)(NSError *error))failure {
    
    HTMLDocument *__block document;
    [self createURLForLoginWithCompletition:^(NSString *fullURL) {
        
        NSMutableDictionary *params = [NSMutableDictionary new];
        params[kROUTINE] = kROUTINE_LOGIN;
        params[kREGISTRATION] = [GCStudentCredentials sharedInstance].matricula;
        params[kDIGIT] = [GCStudentCredentials sharedInstance].digito;
        params[kPASSWORD] = [GCStudentCredentials sharedInstance].senha;
        
        
        [GCBaseService doGETRequestURL:fullURL params:params completition:^(id response) {
            
            document = [HTMLDocument documentWithData:response
                                    contentTypeHeader:kREQUEST_CONTENT_TYPE];
            
            HTMLElement *loginError = [document firstNodeMatchingSelector:@".msg"];
            NSError *error = [self checkLogin:loginError];
            
            if (error) {
                failure(error);
            } else {
                //get token
                NSDictionary *formNode = [[document firstNodeMatchingSelector:FORM] attributes];
                NSString *permanentSessionID = formNode[ACTION];
                [GCStudentCredentials sharedInstance].sessionID = permanentSessionID;
                completition(YES);
            }
            
            
        } failure:^(NSError *error) {
            failure(error);
        }];
        
    } failure:^(bool error) {
        GCLoggerError(@"error when construct session string");
    }];
}

//check whether login credentials are valid
-(NSError *)checkLogin:(HTMLElement *)loginError {
    if (loginError) {
        NSString * errorType = loginError.textContent;
        
        NSMutableDictionary *errorDetails = [NSMutableDictionary new];
        [errorDetails setValue:errorType forKey:@"errorType"];
        
        NSError *error = nil;
        
        if ([errorType containsString:@"limite"]) {
            error = [NSError errorWithDomain:@"unicap" code:1001 userInfo:errorDetails];
        } else if ([errorType containsString:@"Senha"]) {
            error = [NSError errorWithDomain:@"unicap" code:1002 userInfo:errorDetails];
        } else if ([errorType containsString:@"A Matr"]) {
            error = [NSError errorWithDomain:@"unicap" code:1003 userInfo:errorDetails];
        } else if ([errorType containsString:@"manuten"]) {
            error = [NSError errorWithDomain:@"unicap" code:1004 userInfo:errorDetails];
        } else {
            [errorDetails setValue:@"Unknow error" forKey:@"errorType"];
            error = [NSError errorWithDomain:@"unicap" code:1005 userInfo:errorDetails];
        }
        
        return error;
    }
    
    return nil;
}

@end
