//
//  RootNavViewController.m
//  trust
//
//  Created by 雷霰霆 on 2018/6/9.
//  Copyright © 2018年 雷霰霆. All rights reserved.
//

#import "RootNavViewController.h"

@interface RootNavViewController ()
@property (strong, nonatomic) UIView *navLineV;
@end

@implementation RootNavViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //藏旧
    [self hideBorderInView:self.navigationBar];
//    //添新
//    if (!_navLineV) {
//        _navLineV = [[UIView alloc]initWithFrame:CGRectMake(0, 44, kScreen_Width, kLine_MinHeight)];
//        _navLineV.backgroundColor = kColorD8DDE4;
//        [self.navigationBar addSubview:_navLineV];
//    }
}

- (void)hideNavBottomLine{
    [self hideBorderInView:self.navigationBar];
    if (_navLineV) {
        _navLineV.hidden = YES;
    }
}

- (void)showNavBottomLine{
    _navLineV.hidden = NO;
}

- (void)hideBorderInView:(UIView *)view{
    if ([view isKindOfClass:[UIImageView class]]
        && view.frame.size.height <= 1) {
        view.hidden = YES;
    }
    for (UIView *subView in view.subviews) {
        [self hideBorderInView:subView];
    }
}

- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (BOOL)prefersStatusBarHidden{
    
    return NO;
    
}

@end
