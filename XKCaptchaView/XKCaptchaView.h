//
//  XKCaptchaView.h
//  XKCaptchaView
//
//  Created by 浪漫恋星空 on 2017/4/10.
//  Copyright © 2017年 浪漫恋星空. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XKCaptchaView;

typedef void(^XKCaptchaActionBlock)(XKCaptchaView *view);

@interface XKCaptchaView : UIView

@property (nonatomic, assign) NSTimeInterval reEnableTimeInterval;

@property (nonatomic, strong) UIColor *progressViewBgColor;

- (instancetype)initWithFrame:(CGRect)frame reEnableTimeInterval:(NSTimeInterval)interval actionBlock:(XKCaptchaActionBlock)actionBlock;

- (void)startAnimation;

- (void)changToNormal;

@end
