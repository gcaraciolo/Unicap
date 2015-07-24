//
//  GCDayScheduleTableViewCell.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/23/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCDayScheduleTableViewCell.h"
#import "GCSubject.h"


@interface GCDayScheduleTableViewCell()

@property (strong, nonatomic) NSArray *subjects;

@end

@implementation GCDayScheduleTableViewCell

- (void)awakeFromNib {
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillCellWithSubjects:(NSArray *)subjects {
    
    
    //??needed??
    self.subjects = subjects;
    
    //TODO: a forin for each subject be shown (dynamic cell)
    GCSubject *subject = subjects[1];
    
    [self.viewDataSource fillViewImage:nil
                        txtSubjectName:subject.name
                              txtStart:@"4"
                              txtClass:subject.classCode
                                txtEnd:@"5"];

}

@end
