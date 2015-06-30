//
//  GCSubject.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCSubject : NSObject

@property (strong, nonatomic) NSString *student;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *workload;
@property (strong, nonatomic) NSNumber *credits;
@property (strong, nonatomic) NSNumber *period;

@end
