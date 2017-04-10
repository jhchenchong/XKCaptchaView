//
//  XKCaptchaView.m
//  XKCaptchaView
//
//  Created by 浪漫恋星空 on 2017/4/10.
//  Copyright © 2017年 浪漫恋星空. All rights reserved.
//

#import "XKCaptchaView.h"

@implementation XKCaptchaView {
    
    UIView *_reEnableProgressView;
    
    UILabel *_titleLabel;
    
    XKCaptchaActionBlock _actionBlock;
    
    NSTimer *_timer;
    
    NSInteger _timerInteger;
}

- (void)dealloc {
    
    [_timer invalidate];
    
    _timer = nil;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (instancetype)initWithFrame:(CGRect)frame reEnableTimeInterval:(NSTimeInterval)interval actionBlock:(XKCaptchaActionBlock)actionBlock {
    
    if (self = [super initWithFrame:frame]) {
        
        _reEnableTimeInterval = interval;
        
        _reEnableProgressView = [[UIView alloc] initWithFrame:self.bounds];
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        _reEnableProgressView.backgroundColor = [UIColor orangeColor];
        
        if (actionBlock) {
            _actionBlock = actionBlock;
        }
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
        
        [self addGestureRecognizer:tap];
        
        [self addSubview:_reEnableProgressView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        
        _titleLabel.text = @"获取验证码";
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _titleLabel.textColor = [UIColor whiteColor];
        
        _timerInteger = interval;
        
        [self addSubview:_titleLabel];
    }
    
    return self;
}

- (void)handleTap {
    
    if (_actionBlock) {
     
        _actionBlock(self);
    }
}

- (void)change {
    
    if (_timerInteger == 0) {
        
        [_timer invalidate];
        
        _titleLabel.text = @"获取验证码";
        
        _timerInteger = _reEnableTimeInterval;
        
        return;
    }
    
    _timerInteger--;
    
    _titleLabel.text = [NSString stringWithFormat:@"获取验证码(%ld)",(long)_timerInteger];
}

- (void)startAnimation {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
    [_timer fire];
    
    self.userInteractionEnabled = NO;
    
    _reEnableProgressView.frame = CGRectMake(0, 0, 0, _reEnableProgressView.frame.size.height);
    
    [UIView animateWithDuration:_reEnableTimeInterval animations:^{
        
        _reEnableProgressView.frame = self.bounds;
        
    } completion:^(BOOL finished) {
        
        self.userInteractionEnabled = YES;
    }];
}

- (void)changToNormal {
    
    [_timer invalidate];
    
    _timerInteger = _reEnableTimeInterval;
    
    [_reEnableProgressView.layer removeAllAnimations];
    
    _titleLabel.text = @"获取验证码";
}

- (void)setProgressViewBgColor:(UIColor *)progressViewBgColor {
    
    _progressViewBgColor = progressViewBgColor;
    
    _reEnableProgressView.backgroundColor = progressViewBgColor;
}

@end
