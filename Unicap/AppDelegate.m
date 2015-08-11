//
//  AppDelegate.m
//  Unicap
//
//  Created by Guilherme Caraciolo on 6/29/15.
//  Copyright (c) 2015 Guilherme Caraciolo. All rights reserved.
//

#import "AppDelegate.h"

#import "GCLeftMenuViewController.h"
#import "GCPanelViewController.h"
#import "GCLoginViewController.h"

@interface AppDelegate () <RESideMenuDelegate>

@property (strong, nonatomic) GCLeftMenuViewController *leftMenuViewController;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) GCLoginViewController *loginViewController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //TODO: remove later
//    REFRESH_CREDENTIALS
    [GCStudentCredentials sharedInstance];
    [self instantiateViewControllers];
    [self createMenu];
    
    return YES;
}

#pragma mark - Instantiate ViewControllers

-(void)instantiateViewControllers {
    NSString *storyboardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    
    _navigationController = [[UINavigationController alloc]
                             initWithRootViewController:[storyboard instantiateInitialViewController]];
    
    _leftMenuViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GCLeftMenuViewController class])];
    
    _loginViewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GCLoginViewController class])];
}

#pragma mark - ResideMenu

-(void)createMenu {
    _sideMenuViewController = [[RESideMenu alloc]   initWithContentViewController:self.navigationController
                                                           leftMenuViewController:self.leftMenuViewController
                                                          rightMenuViewController:nil];
    
    [_sideMenuViewController setDelegate:self];
    [_sideMenuViewController setMenuPreferredStatusBarStyle:UIStatusBarStyleLightContent];
    [_sideMenuViewController setPanGestureEnabled:YES];
    [_sideMenuViewController setParallaxEnabled:NO];
    [_sideMenuViewController setScaleContentView:NO];
    [_sideMenuViewController setScaleBackgroundImageView:NO];
    [_sideMenuViewController setScaleMenuView:NO];
    [_sideMenuViewController setContentViewShadowEnabled:YES];
    [_sideMenuViewController setContentViewInPortraitOffsetCenterX:([[UIScreen mainScreen] bounds].size.width)*0.2125];
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if ([[GCStudentCredentials sharedInstance] isLoggedIn]) {
        [_window setRootViewController:_sideMenuViewController];
    } else {
        [_window setRootViewController:_loginViewController];
    }

    [_window setBackgroundColor:[UIColor whiteColor]];
    [_window makeKeyAndVisible];
    
}

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
//    GCLoggerInfo(@"menu will show");
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
//    GCLoggerInfo(@"menu did show");
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
//    GCLoggerInfo(@"menu will hide");
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
//    GCLoggerInfo(@"menu did hide");
}

@end
