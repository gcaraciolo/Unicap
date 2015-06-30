//
//  GCStudent.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCStudent : NSObject

+(instancetype)sharedInstance;

@property (strong, nonatomic) NSString  *registration;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSString  *course;
@property (strong, nonatomic) NSString  *shift; 
@property (strong, nonatomic) NSString  *gender;
@property (strong, nonatomic) NSString  *birthday;
@property (strong, nonatomic) NSString  *email;
@property (strong, nonatomic) NSString  *password;
@property (strong, nonatomic) NSNumber  *courseCoefficient;
@property (strong, nonatomic) NSNumber  *lastCoefficient;
@property (strong, nonatomic) NSSet     *subjects;




-(void)saveCourseCoefficient:(NSNumber *)courseCoefficient
          andLastCoefficient:(NSNumber *)lastCoefficient;

@end
