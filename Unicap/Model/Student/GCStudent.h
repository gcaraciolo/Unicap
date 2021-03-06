//
//  GCStudent.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/30/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCStudent : NSObject

@property (strong, nonatomic) NSString  *registration;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSString  *course;
@property (strong, nonatomic) NSString  *curriculum;
@property (strong, nonatomic) NSString  *shift; 
@property (strong, nonatomic) NSString  *gender;
@property (strong, nonatomic) NSString  *birthday;
@property (strong, nonatomic) NSString  *placeOfBirth;
@property (strong, nonatomic) NSString  *civilStatus;
@property (strong, nonatomic) NSString  *religion;
@property (strong, nonatomic) NSString  *breed;
@property (strong, nonatomic) NSString  *motherName;
@property (strong, nonatomic) NSString  *fatherName;
@property (strong, nonatomic) NSString  *identity;
@property (strong, nonatomic) NSString  *cpf;
@property (strong, nonatomic) NSString  *street;
@property (strong, nonatomic) NSString  *neighboor;
@property (strong, nonatomic) NSString  *city;
@property (strong, nonatomic) NSString  *uf;
@property (strong, nonatomic) NSString  *cep;
@property (strong, nonatomic) NSString  *email;
@property (strong, nonatomic) NSString  *celPhoneNumber;
@property (strong, nonatomic) NSString  *homePhoneNumber;
@property (strong, nonatomic) NSString  *commercialChoneNumber;
@property (strong, nonatomic) NSString  *password;
@property (strong, nonatomic) NSNumber  *courseCoefficient;
@property (strong, nonatomic) NSNumber  *lastCoefficient;
@property (strong, nonatomic) NSArray   *currentSubjects;
@property (strong, nonatomic) NSArray   *pastSubjects;
@property (strong, nonatomic) NSArray   *futureSubjects;


+(instancetype)sharedInstance;

-(void)saveCourseCoefficient:(NSNumber *)courseCoefficient
          andLastCoefficient:(NSNumber *)lastCoefficient;

- (NSArray *)getSubjectsFromDay:(NSInteger)day;

@end
