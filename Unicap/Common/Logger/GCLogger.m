//
//  GCLogger.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCLogger.h"

static BOOL DEBUG_MODE = NO;

@implementation GCLogger

+(void)setLogOn:(BOOL)logOn {
    DEBUG_MODE=logOn;
}

+(void)initialize {
    char * env=getenv("DEBUG_MODE");
    if(strcmp(env==NULL?"":env,"NO")!=0)
        DEBUG_MODE=YES;
}


+(void)logFileInfo:(char*)sourceFile lineNumber:(int)lineNumber
        format:(NSString*)format, ...;
{
    va_list ap;
    NSString *print,*file;
    if(DEBUG_MODE==NO)
        return;
    va_start(ap,format);
    file=[[NSString alloc] initWithBytes:sourceFile
                                  length:strlen(sourceFile)
                                encoding:NSUTF8StringEncoding];
    print=[[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    //NSLog handles synchronization issues
    NSLog(@"%@ - %s:%d %@", @"INFO", [[file lastPathComponent] UTF8String],
          lineNumber,print);
    
    return;
}

+(void)logFileError:(char*)sourceFile lineNumber:(int)lineNumber
            format:(NSString*)format, ...;
{
    va_list ap;
    NSString *print,*file;
    if(DEBUG_MODE==NO)
        return;
    va_start(ap,format);
    file=[[NSString alloc] initWithBytes:sourceFile
                                  length:strlen(sourceFile)
                                encoding:NSUTF8StringEncoding];
    print=[[NSString alloc] initWithFormat:format arguments:ap];
    va_end(ap);
    //NSLog handles synchronization issues
    NSLog(@"%@ - %s:%d %@", @"ERROR", [[file lastPathComponent] UTF8String],
          lineNumber,print);
    
    return;
}



@end
