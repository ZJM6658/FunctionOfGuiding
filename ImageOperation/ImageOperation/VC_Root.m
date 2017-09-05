//
//  VC_Root.m
//  ImageOperation
//
//  Created by zhujiamin on 2017/9/5.
//  Copyright © 2017年 zhujiamin. All rights reserved.
//

#import "VC_Root.h"
#import "V_Guide.h"

@interface VC_Root () {
    BOOL _shouldShowGuide;
}

@end

@implementation VC_Root

- (instancetype)init {
    if (self = [super init]) {
        _shouldShowGuide = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"省份选择" style:UIBarButtonItemStylePlain target:self action:@selector(chooseProvince:event:)];


    UILabel *description = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 150, 100, 300, 250)];
    description.numberOfLines = 0;
    description.text =
    @"\
    参数说明：\n\
    cropRect：当前要挖取的区域Rect；\
    marginSize：有时候获取到的需要挖取的控件frame不符合挖取需求，设置marginSize会从中心扩大；\n\
    forEllipseType：是否绘制椭圆区域，默认为NO；\n\
    placePoint：默认挖取后显示的位置是挖取的位置，设置placePoint后会改变显示位置，隐藏时会先动画到挖取位置；\n\
    ";
    [self.view addSubview:description];
    
    UIButton *showGuide = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 100, 400, 200, 40)];
    showGuide.backgroundColor = [UIColor orangeColor];
    [showGuide setTitle:@"显示遮罩引导" forState:UIControlStateNormal];
    [showGuide addTarget:self action:@selector(showGuide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showGuide];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_shouldShowGuide) {
        [self showGuide];
    }
}

- (void)showGuide {
    
    CGRect itemFrame = [self getBarItemRect:self.navigationItem.rightBarButtonItem];
    itemFrame.origin.y += 20;
    
    V_Guide *provinceGuide = [[V_Guide alloc] init];
    provinceGuide.cropRect = itemFrame;
    provinceGuide.marginSize = CGSizeMake(20, 30);//挖取区域宽高增加
    provinceGuide.forEllipseType = YES;
//    provinceGuide.placePoint = CGPointMake(100, 200);//挖取后显示的位置
    [provinceGuide show];
}

- (CGRect)getBarItemRect:(UIBarButtonItem *)item {
    UIView *view = [item valueForKey:@"view"];
    return [view frame];
}

- (void)chooseProvince:(UIBarButtonItem *)sender event:(UIEvent *)event {
    //因为UIBarButtonItem无法获取frame 这里可以使用event获取
    //    CGRect newFrame = [[event.allTouches anyObject] view].frame;
    //    newFrame.origin.y += 20;
    
}

@end
