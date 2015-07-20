//
//  GCFutureSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/14/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCFutureSubjectsViewController.h"
#import "GCFutureSubjectsService.h"


@implementation GCFutureSubjectsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    GCLoggerInfo(@"viewDidLoad");
    
//        GCFutureSubjectsService *futureSubjects = [GCFutureSubjectsService new];
//        [futureSubjects getFutureSubjectsWithCompletition:^(NSArray *subjects) {
//    
//            GCLoggerInfo(@"%@", subjects);
//    
//        } failure:^(NSError *error) {
//    
//            GCLoggerError(@"%@", error);
//        }];
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

-(void)updateViewConstraints {
    [super updateViewConstraints];
    GCLoggerInfo(@"updateViewConstraints");
}


@end
