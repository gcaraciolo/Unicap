//
//  GCStudentCredentials.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCStudentCredentials : NSObject

@property (strong, nonatomic) NSString *matricula;
@property (strong, nonatomic) NSString *digito;
@property (strong, nonatomic) NSString *senha;
@property (strong, nonatomic) NSString *sessionID;


+(instancetype)sharedInstance;


- (void)saveStudentCredentials;
- (BOOL)isLoggedIn;

@end
