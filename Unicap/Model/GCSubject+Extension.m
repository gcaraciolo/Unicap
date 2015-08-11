//
//  GCSubject+Extension.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 8/11/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCSubject+Extension.h"

@implementation GCSubject (Extension)

- (NSString *)getBlock {
    NSString *block = [self.classroom substringToIndex:1];
    return block;
}

- (NSString *)getClassroom {
    NSString *classroom = [self.classroom substringFromIndex:2];
    return classroom;
}

@end
