//
//  GCCurrentSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/15/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCCurrentSubjectsViewController.h"

@interface GCCurrentSubjectsViewController()

@end

@implementation GCCurrentSubjectsViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)didReceiveMemoryWarning {
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
