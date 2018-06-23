//
//  RootTabViewController.m
//  trust
//
//  Created by 雷霰霆 on 2018/6/9.
//  Copyright © 2018年 雷霰霆. All rights reserved.
//

#import "RootTabViewController.h"

#import "RootNavViewController.h"
#import "GameRootViewController.h"
#import "WalletRootViewController.h"
#import "MineRootViewController.h"

#import "RDVTabBarItem.h"

#import "UIView+Common.h"

@interface RootTabViewController ()

@end

@implementation RootTabViewController

@synthesize description;

@synthesize hash;

@synthesize superclass;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Private_M
- (void)setupViewControllers {
    // 游戏
    GameRootViewController *game = [[GameRootViewController alloc] init];
    UINavigationController *nav_game = [[RootNavViewController alloc] initWithRootViewController:game];
    
    // 钱包
    WalletRootViewController *wallet = [[WalletRootViewController alloc] init];
    UINavigationController *nav_wallet = [[RootNavViewController alloc] initWithRootViewController:wallet];
    
    //个人中心
    MineRootViewController *mine = [[MineRootViewController alloc] init];
    UINavigationController *nav_mine = [[RootNavViewController alloc] initWithRootViewController:mine];
    
    [self setViewControllers:@[nav_wallet, nav_game,nav_mine]];
    
    [self customizeTabBarForController];
    self.delegate = self;
}

- (void)customizeTabBarForController {
    NSArray *tabBarItemImages = @[ @"wallet",@"game", @"mine"];
    NSArray *tabBarItemTitles = @[ @"钱包",@"游戏", @"个人中心"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        item.titlePositionAdjustment = UIOffsetMake(0, 3);
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        item.badgePositionAdjustment = UIOffsetMake(0, kSafeArea_Bottom / 2);
        index++;
    }
    [self.tabBar setHeight:49 + kSafeArea_Bottom];
    [self.tabBar setContentEdgeInsets:UIEdgeInsetsMake(kSafeArea_Bottom / 2, 0, 0, 0)];
    self.tabBar.backgroundView.backgroundColor = kColorNavBG;
    [self.tabBar addLineUp:YES andDown:NO andColor:kColorCCC];
}

#pragma mark RDVTabBarControllerDelegate
- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedViewController != viewController) {
        return YES;
    }
    if (![viewController isKindOfClass:[UINavigationController class]]) {
        return YES;
    }
    UINavigationController *nav = (UINavigationController *)viewController;
    if (nav.topViewController != nav.viewControllers[0]) {
        return YES;
    }
    
    if ([nav.topViewController isKindOfClass:[RootViewController class]]) {
        RootViewController *rootVC = (RootViewController *)nav.topViewController;
        [rootVC tabBarItemClicked];
    }

    return YES;
}

- (BOOL)prefersStatusBarHidden{
    
    return NO;
    
}



@end
