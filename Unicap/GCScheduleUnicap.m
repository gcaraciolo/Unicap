//
//  GCScheduleUnicap.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 7/2/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCScheduleUnicap.h"

@implementation GCScheduleUnicap

+ (instancetype)sharedInstance {
    static id sharedInstance;
    @synchronized(self) {
        if ( ! sharedInstance ) {
            sharedInstance = [GCScheduleUnicap new];
            [sharedInstance createSchedules];
        }
    }
    return sharedInstance;
}

-(void)createSchedules {
    _schedules = @{
                   @"A" : @"7:30 - 8:20",
                   @"B" : @"8:20 - 9:10",
                   @"C" : @"9:20 - 10:10",
                   @"D" : @"10:10 - 11:00",
                   @"E" : @"11:10 - 12:00",
                   @"F" : @"12:00 - 12:50",
                   @"G" : @"13:00 - 13:50",
                   @"H" : @"13:50 - 14:40",
                   @"I" : @"14:50 - 15:40",
                   @"J" : @"15:40 - 16:30",
                   @"L" : @"16:40 - 17:30",
                   @"M" : @"17:30 - 18:20",
                   @"N" : @"18:30 - 19:20",
                   @"O" : @"19:20 - 20:10",
                   @"P" : @"20:20 - 21:10",
                   @"Q" : @"21:10 - 22:00"
                   };
    _codification = @{
                      @"2" : @"Segunda",
                      @"3" : @"Terça",
                      @"4" : @"Quarta",
                      @"5" : @"Quinta",
                      @"6" : @"Sexta",
                      @"7" : @"Sábado",
                      };
}

@end
