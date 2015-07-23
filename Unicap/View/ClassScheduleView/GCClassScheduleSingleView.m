//
//  GCClassScheduleSingleView.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/22/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCClassScheduleSingleView.h"

@interface GCClassScheduleSingleView()

@property (weak, nonatomic) IBOutlet UIView *viewImage;
@property (weak, nonatomic) IBOutlet UILabel *lblSubjectName;
@property (weak, nonatomic) IBOutlet UILabel *lblStart;
@property (weak, nonatomic) IBOutlet UILabel *lblClass;
@property (weak, nonatomic) IBOutlet UILabel *lblEnd;
@property (weak, nonatomic) IBOutlet UIView *viewProgress;

@end

@implementation GCClassScheduleSingleView

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/




- (void)fillViewImage:(UIView *)viewImage
       lblSubjectName:(UILabel *)lblSubjectName
             lblStart:(UILabel *)lblStart
             lblClass:(UILabel *)lblClass
               lblEnd:(UILabel *)lblEnd {
    
    self.viewImage = viewImage;
    self.lblSubjectName = lblSubjectName;
    self.lblStart = lblStart;
    self.lblClass = lblClass;
    self.lblEnd = lblEnd;
    
}

- (void)changeViewProgressStatus:(NSInteger)percent {
    //TODO
}

@end
