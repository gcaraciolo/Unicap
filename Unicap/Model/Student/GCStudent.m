//
//  GCStudent.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCStudent.h"

@implementation GCStudent

//TODO: core data
+(instancetype)sharedInstance {
    static id sharedInstance;
    @synchronized(self) {
        if ( ! sharedInstance )
            sharedInstance = [GCStudent new];
    }
    return sharedInstance;
}

-(void)saveCourseCoefficient:(NSNumber *)courseCoefficient
          andLastCoefficient:(NSNumber *)lastCoefficient {
    
    
    self.courseCoefficient = courseCoefficient;
    self.lastCoefficient   = lastCoefficient;
    
    
}

- (NSArray *)getSubjectsFromDay:(NSInteger)day {
    //TODO
    if (! self.currentSubjects) {
        return nil;
    }
    NSMutableArray *twoSubjects = [NSMutableArray new];
    [twoSubjects addObject:self.currentSubjects[0]];
    [twoSubjects addObject:self.currentSubjects[1]];
    return [twoSubjects copy];
}


@end
