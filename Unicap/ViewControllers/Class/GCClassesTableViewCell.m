//
//  GCClassesTableViewCell.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/23/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCClassesTableViewCell.h"

@implementation GCClassesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setFrame:(CGRect)frame {
    
    frame.size.width -= 40;
    frame.size.height -= 20;
    frame.origin.x += 20;
    frame.origin.y += 20;

    [super setFrame:frame];
}

@end
