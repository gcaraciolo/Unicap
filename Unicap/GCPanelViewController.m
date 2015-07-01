//
//  GCPanelViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCPanelViewController.h"
#import "GCCurrentSubjectsServices.h"

@implementation GCPanelViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCCurrentSubjectsServices *currentSubjects = [GCCurrentSubjectsServices new];
    [currentSubjects getSubjectsFromCurrentPeriodWithCompletition:^(NSMutableSet *subjects) {
        GCLoggerInfo(@"%@", subjects);
    } failure:^(NSError *error) {
        GCLoggerError(@"%@", error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
