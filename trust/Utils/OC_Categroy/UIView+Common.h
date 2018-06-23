//
//  UIView+Common.h
//  trust
//
//  Created by 雷霰霆 on 2018/6/9.
//  Copyright © 2018年 雷霰霆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, EaseBlankPageType)
{
    EaseBlankPageTypeView = 0,
    EaseBlankPageTypeActivity,
    EaseBlankPageTypeTaskResource,
    EaseBlankPageTypeTask,
    EaseBlankPageTypeTopic,
    EaseBlankPageTypeTweet,
    EaseBlankPageTypeTweetAction,
    EaseBlankPageTypeTweetOther,
    EaseBlankPageTypeTweetProject,
    EaseBlankPageTypeProject,
    EaseBlankPageTypeProjectOther,
    EaseBlankPageTypeFileDleted,
    EaseBlankPageTypeMRForbidden,
    EaseBlankPageTypeFolderDleted,
    EaseBlankPageTypePrivateMsg,
    EaseBlankPageTypeMyWatchedTopic,
    EaseBlankPageTypeMyJoinedTopic,
    EaseBlankPageTypeOthersWatchedTopic,
    EaseBlankPageTypeOthersJoinedTopic,
    EaseBlankPageTypeFileTypeCannotSupport,
    EaseBlankPageTypeViewTips,
    EaseBlankPageTypeShopOrders,
    EaseBlankPageTypeShopUnPayOrders,
    EaseBlankPageTypeShopSendOrders,
    EaseBlankPageTypeShopUnSendOrders,
    EaseBlankPageTypeNoExchangeGoods,
    EaseBlankPageTypeProject_ALL,
    EaseBlankPageTypeProject_CREATE,
    EaseBlankPageTypeProject_JOIN,
    EaseBlankPageTypeProject_WATCHED,
    EaseBlankPageTypeProject_STARED,
    EaseBlankPageTypeProject_SEARCH,
    EaseBlankPageTypeTeam,
    EaseBlankPageTypeFile,
    EaseBlankPageTypeMessageList,
    EaseBlankPageTypeViewPurchase,
    EaseBlankPageTypeCode,
    EaseBlankPageTypeWiki,
};

typedef NS_ENUM(NSInteger, BadgePositionType) {

    BadgePositionTypeDefault = 0,
    BadgePositionTypeMiddle
};

@interface UIView (Common)
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable BOOL masksToBounds;

- (void)doCircleFrame;
- (void)doNotCircleFrame;
- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

- (UIViewController *)findViewController;

- (void)addBadgePoint:(NSInteger)pointRadius withPosition:(BadgePositionType)type;
- (void)addBadgePoint:(NSInteger)pointRadius withPointPosition:(CGPoint)point;
- (void)removeBadgePoint;

- (void)setY:(CGFloat)y;
- (void)setX:(CGFloat)x;
- (void)setOrigin:(CGPoint)origin;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setSize:(CGSize)size;
- (CGFloat)maxXOfFrame;

- (void)setSubScrollsToTop:(BOOL)scrollsToTop;


- (void)addGradientLayerWithColors:(NSArray *)cgColorArray;
- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )aPoint endPoint:(CGPoint)endPoint;
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown;
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color;
- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace;

- (void)addRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

- (void)removeViewWithTag:(NSInteger)tag;
- (CGSize)doubleSizeOfFrame;
- (void)outputSubviewTree;//输出子视图的目录树

+ (CGRect)frameWithOutNav;
+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve;
+ (UIView *)lineViewWithPointYY:(CGFloat)pointY;
+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color;
+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace;
+ (void)outputTreeInView:(UIView *)view withSeparatorCount:(NSInteger)count;//输出某个View的subview目录


@end

