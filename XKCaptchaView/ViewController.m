//
//  ViewController.m
//  XKCaptchaView
//
//  Created by 浪漫恋星空 on 2017/4/10.
//  Copyright © 2017年 浪漫恋星空. All rights reserved.
//

#import "ViewController.h"
#import "XKCaptchaView.h"

@interface ViewController ()

@property (nonatomic, strong) XKCaptchaView *captchaView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.captchaView];
}

- (XKCaptchaView *)captchaView {
    
    if (!_captchaView) {
        
        _captchaView = [[XKCaptchaView alloc] initWithFrame:CGRectMake(0, 0, 150, 30) reEnableTimeInterval:60 actionBlock:^(XKCaptchaView *view) {
            
            [view startAnimation];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"验证码获取成功" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil] show];
                
                [self.captchaView changToNormal];
                
            });
            
        }];
        
        _captchaView.center = self.view.center;
    }
    return _captchaView;
}
@end
