//
//  GCPanelViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCPanelViewController.h"
#import "GCGradesFromCurrentPeriodService.h"

@implementation GCPanelViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCGradesFromCurrentPeriodService *currentGrandes = [GCGradesFromCurrentPeriodService new];
    [currentGrandes getGradesFromCurrentPeriodWithCompletition:^(bool succeded) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
