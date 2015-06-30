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
#import "GCRequestUtils.h"
#import "GCStudentCredentials.h"

#define FORM @"form"
#define CONTENT_TYPE @"Content-Type"
#define ACTION @"action"


@interface GCLoginService()

@end

@implementation GCLoginService


-(void)createURLForLoginWithCompletition:(void (^)(NSString *))completition {

    NSURL *URL = [NSURL URLWithString:kREQUEST_BASE_URL];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:URL completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          
           @try {
               
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
               
               //construct full url for request
               NSMutableString *loginURL = [NSMutableString new];
               [loginURL appendString:kREQUEST_BASE_URL];
               [loginURL appendString:temporarySessionID];
            
               completition(loginURL);
              
          }
          @catch (NSException *exception) {
              //TODO: Create a custom exception for login action
              @throw exception;
          }
          
      }] resume];
}

-(void)doLoginWithCompletition:(void (^)(bool succeded))completition
                       failure:(void (^)(NSError *error))failure {
    
    HTMLDocument *__block document;
    @try {
        [self createURLForLoginWithCompletition:^(NSString *fullURL) {
                
            NSMutableDictionary *params = [NSMutableDictionary new];
            params[kROUTINE] = kROUTINE_LOGIN;
            params[kREGISTRATION] = [GCStudentCredentials sharedInstance].matricula;
            params[kDIGIT] = [GCStudentCredentials sharedInstance].digito;
            params[kPASSWORD] = [GCStudentCredentials sharedInstance].senha;
            
            
            [GCBaseService doGETRequestURL:fullURL params:params completition:^(id response) {
                
                document = [HTMLDocument documentWithData:response
                                        contentTypeHeader:kREQUEST_CONTENT_TYPE];
                
                
                //TODO: check whether login credentials are valid
                HTMLElement *loginError = [document firstNodeMatchingSelector:@".msg"];
                if (loginError) {
                    NSString * errorType = loginError.textContent;
                    
                    NSMutableDictionary *errorDetails = [NSMutableDictionary new];
                    [errorDetails setValue:errorType forKey:@"errorType"];
                    
                    NSError *error = nil;
                    
                    if ([errorType containsString:@"limite"]) {
                        error = [NSError errorWithDomain:@"unicap" code:1001 userInfo:errorDetails];
                        failure(error);
                        
                    } else if ([errorType containsString:@"Senha"]) {
                        error = [NSError errorWithDomain:@"unicap" code:1002 userInfo:errorDetails];
                        failure(error);
                        
                    } else if ([errorType containsString:@"A Matr"]) {
                        error = [NSError errorWithDomain:@"unicap" code:1003 userInfo:errorDetails];
                        failure(error);
                    } else if ([errorType containsString:@"manuten"]) {
                        error = [NSError errorWithDomain:@"unicap" code:1004 userInfo:errorDetails];
                        failure(error);
                    } else {
                        [errorDetails setValue:@"Unknow error" forKey:@"errorType"];
                        error = [NSError errorWithDomain:@"unicap" code:1005 userInfo:errorDetails];
                        failure(error);
                    }
                    
                    return;
                }
                
                
                //get token
                NSDictionary *formNode = [[document firstNodeMatchingSelector:FORM] attributes];
                NSString *permanentSessionID = formNode[ACTION];
                [GCStudentCredentials sharedInstance].sessionID = permanentSessionID;
                completition(YES);
            }];
            
        }];

    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

@end
