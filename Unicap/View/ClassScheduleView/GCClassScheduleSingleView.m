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

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self awakeFromNib];
    }
    return self;
}

//-(void)awakeFromNib {
//    
//    [self fillViewImage:nil
//         txtSubjectName:@"a"
//               txtStart:@"1"
//               txtClass:@"a702"
//                 txtEnd:@"2"];
//}

- (void)fillViewImage:(UIView *)viewImage
       txtSubjectName:(NSString *)txtSubjectName
             txtStart:(NSString *)txtStart
             txtClass:(NSString *)txtClass
               txtEnd:(NSString *)txtEnd {
    
    self.viewImage = viewImage;
    self.lblSubjectName.text = txtSubjectName;
    self.lblStart.text = txtStart;
    self.lblClass.text = txtClass;
    self.lblEnd.text = txtEnd;
    
}

- (void)changeViewProgressStatus:(NSInteger)percent {
    //TODO: create another view and change its width according to the time.
}

@end
