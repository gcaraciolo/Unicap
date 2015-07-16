//
//  GCSubjectsSegmentedControlProtocol.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/15/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GCSubjectsSegmentedControlProtocol <NSObject>

- (void)loadViewControllerFromSegmentedControl:(NSInteger)selectedSegmentIndex;

@end

