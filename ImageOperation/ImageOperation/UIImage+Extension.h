//
//  UIImage+Extension.h
//  ImageOperation
//
//  Created by zhujiamin on 2017/8/29.
//  Copyright © 2017年 zhujiamin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)getImageFromView:(UIView *)view;
- (UIImage *)cropSubImage:(CGRect)rect;
- (UIImage *)drawCustomImage4Image;

@end
