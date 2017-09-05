//
//  V_Guide.m
//  ImageOperation
//
//  Created by zhujiamin on 2017/9/5.
//  Copyright © 2017年 zhujiamin. All rights reserved.
//

#import "V_Guide.h"
#import "UIImage+Extension.h"

@interface V_Guide () {
    UIView *_v_guide;//挖取出来的view
    CGPoint _originalPoint;//挖取的原始位置
}

@property (nonatomic, strong) UILabel *lb_description;

@end

@implementation V_Guide

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _placePoint = CGPointMake(-1, -1);
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.7];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideGuide)];
        [self addGestureRecognizer:tap];
        [self setUpNormalViews];
    }
    return self;
}

- (void)setUpNormalViews {
    [self addSubview:self.lb_description];
}

#pragma mark - outside methods

- (void)hideGuide {
    if (_placePoint.x > 0) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect rect = _v_guide.frame;
            rect.origin.x = _originalPoint.x;
            rect.origin.y = _originalPoint.y;
            _v_guide.frame = rect;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else {
        [self removeFromSuperview];
    }
}

- (void)show {
    [self setFrame:[UIScreen mainScreen].bounds];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect rect = CGRectMake(self.cropRect.origin.x - self.marginSize.width / 2,
                             self.cropRect.origin.y - self.marginSize.height / 2,
                             self.cropRect.size.width + self.marginSize.width,
                             self.cropRect.size.height + self.marginSize.height);
    _v_guide = nil;
    if (_forEllipseType) {
        //window绘制为Image
        UIImage *windowImage = [UIImage getImageFromView:window];
        //从windowImage里面挖取newFrame一小块
        UIImage *cropImage = [windowImage cropSubImage:rect];
        //cropImage贝塞尔绘制想要的曲线填充
        UIImage *resultImage = [cropImage drawCustomImage4Image];
        UIImageView *iv_result = [[UIImageView alloc] init];
        iv_result.image = resultImage;
        _v_guide = iv_result;
        
        self.lb_description.text = [NSString stringWithFormat:@"绘制贝塞尔椭圆区域突出挖取的提示\n%@", self.lb_description.text];
    } else {
        //直接从屏幕上挖取一个区域的view
        UIView *v_snapshot = [window resizableSnapshotViewFromRect:rect afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
        _v_guide = v_snapshot;
        self.lb_description.text = [NSString stringWithFormat:@"直接从屏幕挖取一个区域显示在遮罩上\n%@", self.lb_description.text];
    }
    _originalPoint = rect.origin;
    //调整挖取后的位置
    if (_placePoint.x > 0) {
        [_v_guide setFrame:CGRectMake(self.placePoint.x, self.placePoint.y, rect.size.width, rect.size.height)];
    } else {
        [_v_guide setFrame:rect];
    }
    [self addSubview:_v_guide];
    
    [window addSubview:self];
}

#pragma mark - getter

- (UILabel *)lb_description {
    if (_lb_description == nil) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _lb_description = [[UILabel alloc] initWithFrame:CGRectMake((screenSize.width - 300) / 2, 380, 300, 80)];
        
        _lb_description.numberOfLines = 0;
        _lb_description.text = @"点击隐藏遮罩引导";
        _lb_description.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        _lb_description.textAlignment = NSTextAlignmentCenter;
        _lb_description.adjustsFontSizeToFitWidth = YES;
    }
    return _lb_description;
}

@end
