//
//  GCStudentCredentials.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCStudentCredentials.h"

@interface GCStudentCredentials()

@property (nonatomic) BOOL loggedIn;

@end

@implementation GCStudentCredentials

+ (instancetype)sharedInstance {
    static id sharedInstance;
    @synchronized(self) {
        if ( ! sharedInstance ) {
            sharedInstance = [GCStudentCredentials new];
            [sharedInstance getStudentCredentials];
        }
    }
    return sharedInstance;
}

- (void)getStudentCredentials {
    if ( ! [GCStudentCredentials sharedInstance].sessionID) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *matricula = [defaults objectForKey:@"matricula"];
        if (matricula) {
            [GCStudentCredentials sharedInstance].matricula     = matricula;
            NSString *senha = [defaults objectForKey:@"senha"];
            [GCStudentCredentials sharedInstance].senha         = senha;
            NSString *digito = [defaults objectForKey:@"digito"];
            [GCStudentCredentials sharedInstance].digito        = digito;
            NSString *sessionID = [defaults objectForKey:@"sessionID"];
            [GCStudentCredentials sharedInstance].sessionID 	= sessionID;
            _loggedIn = YES;
        } else {
            _loggedIn = NO;
        }
    }
}

- (void)saveStudentCredentials {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[GCStudentCredentials sharedInstance].matricula forKey:@"matricula"];
    [defaults setObject:[GCStudentCredentials sharedInstance].digito forKey:@"digito"];
    [defaults setObject:[GCStudentCredentials sharedInstance].senha forKey:@"senha"];
    [defaults setObject:[GCStudentCredentials sharedInstance].sessionID forKey:@"sessionID"];
    [defaults synchronize];
}

-(BOOL)isLoggedIn {
    return _loggedIn;
}

-(void)resetApp {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"matricula"];
    [defaults removeObjectForKey:@"digito"];
    [defaults removeObjectForKey:@"senha"];
    [defaults removeObjectForKey:@"sessionID"];
    [defaults synchronize];
}
@end
