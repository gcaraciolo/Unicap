//
//  GCLogger.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCLogger.h"

@implementation GCLogger

void logDebug(NSString *msg, ...) {
    NSLog(@"DEBUG - %@", msg);
}

void logInfo(NSString *msg, ...) {
    NSLog(@"INFO - %@", msg);
}

void logError(NSString *msg, ...) {
    NSLog(@"Error - %@", msg);
}

@end
