//
//  GCStudentCredentials.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCStudentCredentials.h"

@implementation GCStudentCredentials

+ (instancetype)sharedInstance {
    static id sharedInstance;
    @synchronized(self) {
        if ( ! sharedInstance )
            sharedInstance = [GCStudentCredentials new];
    }
    return sharedInstance;
}

@end
