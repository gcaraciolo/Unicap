//
//  GCLogger.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCLogger : NSObject

+(void)logFileInfo:(char*)sourceFile lineNumber:(int)lineNumber
            format:(NSString*)format, ...;
+(void)logFileError:(char*)sourceFile lineNumber:(int)lineNumber
             format:(NSString*)format, ...;

@end
