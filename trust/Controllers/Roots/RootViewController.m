//
//  RootViewController.m
//  trust
//
//  Created by 雷霰霆 on 2018/6/9.
//  Copyright © 2018年 雷霰霆. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarItemClicked{
    DebugLog(@"\ntabBarItemClicked : %@", NSStringFromClass([self class]));
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}


@end
