//
//  GCTestingScheduleViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/14/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCTestingScheduleViewController.h"
#import "GCTestingScheduleService.h"

@implementation GCTestingScheduleViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    GCTestingScheduleService *testingSchedule = [GCTestingScheduleService new];
    [testingSchedule getTestingScheduleWithCompletition:^(NSArray *schedule) {
        
        GCLoggerInfo(@"%@", schedule);
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@", error);
    }];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
