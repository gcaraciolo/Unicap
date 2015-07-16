//
//  GCPastSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/14/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCPastSubjectsViewController.h"
#import "GCPastSubjectsService.h"



@implementation GCPastSubjectsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    GCLoggerInfo(@"viewDidLoad");
    
//    GCPastSubjectsService *pastSubjects = [GCPastSubjectsService new];
//        [pastSubjects getPastSubjectsWithCompletition:^(NSArray *subjects) {
//    
//            GCLoggerInfo(@"%@\n%d", subjects, [subjects count]);
//        } failure:^(NSError *error) {
//    
//            GCLoggerError(@"%@",error);
//        }];
//

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    GCLoggerInfo(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    GCLoggerInfo(@"viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    GCLoggerInfo(@"viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    GCLoggerInfo(@"viewDidDisapear");
}


@end
