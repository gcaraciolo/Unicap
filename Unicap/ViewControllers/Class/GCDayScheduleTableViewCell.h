//
//  GCDayScheduleTableViewCell.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/23/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCClassScheduleSingleView.h"

@interface GCDayScheduleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet GCClassScheduleSingleView *viewDataSource;


- (void)fillCellWithSubjects:(NSArray *)subjects;

@end
