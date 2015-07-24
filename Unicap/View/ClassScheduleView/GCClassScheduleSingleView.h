//
//  GCClassScheduleSingleView.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/22/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCClassScheduleSingleView : UIView

- (void)fillViewImage:(UIView *)viewImage
       txtSubjectName:(NSString *)txtSubjectName
             txtStart:(NSString *)txtStart
             txtClass:(NSString *)txtClass
               txtEnd:(NSString *)txtEnd;

@end
