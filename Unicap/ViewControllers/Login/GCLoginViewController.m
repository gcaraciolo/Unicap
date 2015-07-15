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
#import "GCStudentService.h"

@interface GCLoginViewController ()

@end

@implementation GCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GCLoginService *login = [GCLoginService new];
    
    [GCStudentCredentials sharedInstance].matricula = @"201210799";
    [GCStudentCredentials sharedInstance].digito = @"5";
    [GCStudentCredentials sharedInstance].senha = @"159753";
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window setRootViewController:appDelegate.sideMenuViewController];

    
//    [login doLoginWithCompletition:^(bool succeded) {
//        
//        [[GCStudentCredentials sharedInstance] saveStudentCredentials];
//        
//        GCStudentService *studentService = [GCStudentService new];
//        [studentService getStudentInformationsWithCompletition:^(GCStudent *student) {
//            
//            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//            [appDelegate.window setRootViewController:appDelegate.sideMenuViewController];
//            GCLoggerInfo(@"%@",student);
//        } failure:^(NSError *error) {
//            
//            GCLoggerError(@"%@",error);
//        }];
//        
//    } failure:^(NSError *error) {
//        
//        GCLoggerError(@"%@",error);
//    }];
//    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end