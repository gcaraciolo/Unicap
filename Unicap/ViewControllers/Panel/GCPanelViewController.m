//
//  GCPanelViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCPanelViewController.h"
#import "GCCurrentSubjectsServices.h"
#import "GCStudentService.h"
#import "GCStudent.h"
#import "GCFutureSubjectsService.h"
#import "GCTestingScheduleService.h"


#import "GCPastSubjectsService.h"

@implementation GCPanelViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCCurrentSubjectsServices *currentSubjects = [GCCurrentSubjectsServices new];
    [currentSubjects getInformationsFromCurrentPeriodWithCompletition:^(NSMutableSet *subjects) {
        
        GCLoggerInfo(@"%@\n%d", subjects, [subjects count]);
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
