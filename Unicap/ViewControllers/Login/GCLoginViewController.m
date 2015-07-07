//
//  GCLoginViewController.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "GCLoginViewController.h"
#import "GCLoginService.h"
#import "GCStudentCredentials.h"
#import "AppDelegate.h"


@interface GCLoginViewController ()

@end

@implementation GCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCLoginService *login = [GCLoginService new];
    
    [GCStudentCredentials sharedInstance].matricula = @"";
    [GCStudentCredentials sharedInstance].digito = @"";
    [GCStudentCredentials sharedInstance].senha = @"";
    
    
    [login doLoginWithCompletition:^(bool succeded) {
        
        [[GCStudentCredentials sharedInstance] saveStudentCredentials];
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window setRootViewController:appDelegate.sideMenuViewController];
    } failure:^(NSError *error) {
        
        GCLoggerError(@"%@",error);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end