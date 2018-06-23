//
//  AppDelegate.m
//  trust
//
//  Created by 雷霰霆 on 2018/6/8.
//  Copyright © 2018年 雷霰霆. All rights reserved.
//

#import "AppDelegate.h"

#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
#import <UIImage+YYAdd.h>
#import "RootTabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //网络
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    //设置导航条样式
    [self customizeInterface];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    [self setupTabViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Methods Private

- (void)customizeInterface {
    //设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:kColorNavBG] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTintColor:kColorLightBlue];//返回按钮的箭头颜色
    
    UIFont *font = [UIFont systemFontOfSize:kNavTitleFontSize];
    UIColor *color = kColorNavTitle;
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: font,
                                     NSForegroundColorAttributeName: color,
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    navigationBarAppearance.backIndicatorImage = [UIImage imageNamed:@"back_white_nav"];
    navigationBarAppearance.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back_white_nav"];
    
    [[UITextField appearance] setTintColor:kColorLightBlue];//设置UITextField的光标颜色
    [[UITextView appearance] setTintColor:kColorLightBlue];//设置UITextView的光标颜色
    
}

- (void)setupTabViewController{
    RootTabViewController *rootVC = [[RootTabViewController alloc] init];
    rootVC.tabBar.translucent = YES;
    
    [self.window setRootViewController:rootVC];
}


@end
