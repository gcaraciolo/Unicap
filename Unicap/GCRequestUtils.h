//
//  GCRequestUtils.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCRequestUtils : NSObject

#pragma mark - URL

extern NSString *const kREQUEST_BASE_URL;

#pragma mark - Request Params key

extern NSString *const kROUTINE;
extern NSString *const kREGISTRATION;
extern NSString *const kDIGIT;
extern NSString *const kPASSWORD;

#pragma mark - Request Params values

extern NSString *const kROUTINE_LOGIN;
extern NSString *const kROUTINE_PERSONAL;
extern NSString *const kROUTINE_SUBJECTS_CURRENT;
extern NSString *const kROUTINE_SUBJECTS_PAST;
extern NSString *const kROUTINE_SUBJECTS_PENDING;
extern NSString *const kROUTINE_SUBJECTS_TESTS;
extern NSString *const kROUTINE_SUBJECTS_CALENDAR;

#pragma mark - Request

extern NSString *const kREQUEST_CONTENT_TYPE;

@end
