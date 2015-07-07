//
//  GCTestingSchedule.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/7/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCTestingSchedule : NSObject

@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *classCode;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *firstGQFirstCall;
@property (strong, nonatomic) NSString *firstGQSecondCall;
@property (strong, nonatomic) NSString *secondGQ;
@property (strong, nonatomic) NSString *final;
@property (strong, nonatomic) NSString *finalSecondCall;


@end
