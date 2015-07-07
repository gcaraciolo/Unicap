//
//  GCRequestUtils.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCRequestUtils.h"

@implementation GCRequestUtils

#pragma mark - URL

NSString *const kREQUEST_BASE_URL                       = @"http://www.unicap.br/PortalGraduacao/";

#pragma mark - Request Params key

NSString *const kROUTINE                                = @"rotina";
NSString *const kREGISTRATION                           = @"Matricula";
NSString *const kDIGIT                                  = @"Digito";
NSString *const kPASSWORD                               = @"Senha";

#pragma mark - Request Params values

NSString *const kROUTINE_LOGIN                          = @"1";
NSString *const kROUTINE_PERSONAL                       = @"2";
NSString *const kROUTINE_SUBJECTS_CURRENT               = @"14";
NSString *const kROUTINE_SUBJECTS_PAST                  = @"5";
NSString *const kROUTINE_SUBJECTS_PENDING               = @"6";
NSString *const kROUTINE_SUBJECTS_TESTS                 = @"4";
NSString *const kROUTINE_SUBJECTS_TESTING_SCHEDULE      = @"3";


#pragma mark - Request

NSString *const kREQUEST_CONTENT_TYPE                   = @"text/html";



@end
