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

@end
