//
//  GCSubjectsViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/15/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCSubjectsViewController.h"
#import "GCSubjectsSegmentedControlProtocol.h"

#import "GCPastSubjectsViewController.h"
#import "GCCurrentSubjectsViewController.h"
#import "GCFutureSubjectsViewController.h"


@interface GCSubjectsViewController() <GCSubjectsSegmentedControlProtocol>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *currentView;

@property (strong, nonatomic) GCPastSubjectsViewController *pastSubjectsViewController;
@property (strong, nonatomic) GCCurrentSubjectsViewController *currentSubjectsViewController;
@property (strong, nonatomic) GCFutureSubjectsViewController *futureSubjectsViewController;


@end

@implementation GCSubjectsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.segmentedControl addTarget:self
                              action:@selector(didClickOnSegmentedControl:)
                    forControlEvents:UIControlEventValueChanged];
    
    GCLoggerInfo(@"viewDidLoad");
    [self loadViewControllers];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (void)loadViewControllers {
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                         bundle:[NSBundle mainBundle]];
    
    self.pastSubjectsViewController = [storyboard
                                       instantiateViewControllerWithIdentifier:
                                       NSStringFromClass([GCPastSubjectsViewController class])];
    self.pastSubjectsViewController.view.frame = self.currentView.frame;
    
    self.currentSubjectsViewController = [storyboard
                                          instantiateViewControllerWithIdentifier:
                                          NSStringFromClass([GCCurrentSubjectsViewController class])];
    self.currentSubjectsViewController.view.frame = self.currentView.frame;
    
    self.futureSubjectsViewController = [storyboard
                                         instantiateViewControllerWithIdentifier:
                                         NSStringFromClass([GCFutureSubjectsViewController class])];
    self.futureSubjectsViewController.view.frame = self.currentView.frame;

    
    [self addChildViewController:self.pastSubjectsViewController];
    [self addChildViewController:self.currentSubjectsViewController];
    [self addChildViewController:self.futureSubjectsViewController];
    
}

#pragma mark - SegmentedControl

- (void)didClickOnSegmentedControl:(UISegmentedControl *)segmented {
    NSLog(@"%@", self.currentView);
    NSLog(@"%@", self.pastSubjectsViewController.view);
    switch (segmented.selectedSegmentIndex) {
        case 0:
            [self loadPresentationView:self.pastSubjectsViewController.view];
            break;
        case 1:
            [self loadPresentationView:self.currentSubjectsViewController.view];
            break;
        case 2:
            [self loadPresentationView:self.futureSubjectsViewController.view];
            break;
        default:
            break;
    }
    
}

#pragma mark - GCSubjectsSegmentedControlProtocol

- (void)loadPresentationView:(UIView *)view {

    [self.currentView addSubview:view];
    
}



@end
