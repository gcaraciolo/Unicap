//
//  GCSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/15/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCSubjectsViewController.h"

@interface GCSubjectsViewController()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GCSubjectsViewController

#pragma mark - Lifecycle

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.segmentedControl addTarget:self
                              action:@selector(didClickOnSegmentedControl:)
                    forControlEvents:UIControlEventValueChanged];
    
    GCLoggerInfo(@"viewDidLoad");
    
    [self loadViewControllerFromSegmentedControl:1];
    
}

-(void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - SegmentedControl

-(void)didClickOnSegmentedControl:(UISegmentedControl *)segmented {
    
    switch (segmented.selectedSegmentIndex) {
        case 0:
            [self loadViewControllerFromSegmentedControl:0];
            break;
        case 1:
            [self loadViewControllerFromSegmentedControl:1];
            break;
        case 2:
            [self loadViewControllerFromSegmentedControl:2];
            break;
        default:
            break;
    }
    
}

-(void)loadViewControllerFromSegmentedControl:(NSInteger)selectedSegmentIndex {

    GCLoggerInfo(@"load %d subjects", selectedSegmentIndex);
}



@end
