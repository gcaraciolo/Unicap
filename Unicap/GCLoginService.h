//
//  GCLoginService.h
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCLoginService : NSObject

-(void)doLoginWithCompletition:(void (^)(bool succeded))completition
                       failure:(void (^)(NSError *error))failure;

@end
