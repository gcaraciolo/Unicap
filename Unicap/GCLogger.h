//
//  GCLogger.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCLogger : NSObject

void logDebug(NSString *msg, ...);
void logInfo(NSString *msg, ...);
void logError(NSString *msg, ...);

@end
