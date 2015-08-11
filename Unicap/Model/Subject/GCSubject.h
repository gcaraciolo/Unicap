//
//  GCSubject.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCStudent.h"

@interface GCSubject : NSObject

@property (strong, nonatomic) NSString  *subjectCode;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSNumber  *workload;
@property (strong, nonatomic) NSNumber  *credits;
@property (nonatomic)         BOOL      *attended;
@property (strong, nonatomic) NSDate    *studiedIn;
@property (strong, nonatomic) NSString  *classCode;
@property (strong, nonatomic) NSString  *classroom;
@property (strong, nonatomic) NSString   *schedule;
@property (strong, nonatomic) NSString  *period;
@property (strong, nonatomic) NSNumber  *firstGrade;
@property (strong, nonatomic) NSNumber  *secondeGrade;
@property (strong, nonatomic) NSNumber  *average;
@property (strong, nonatomic) NSNumber  *finalGrade;
@property (strong, nonatomic) NSNumber  *finalAverage;
@property (strong, nonatomic) NSString  *currentSituation;
@property (strong, nonatomic) NSString  *pastSituation;

- (NSInteger)numberOfClassesPerWeek;

@end