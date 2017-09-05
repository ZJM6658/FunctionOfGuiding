//
//  AppDelegate.m
//  ImageOperation
//
//  Created by zhujiamin on 2017/8/29.
//  Copyright © 2017年 zhujiamin. All rights reserved.
//

#import "AppDelegate.h"
#import "VC_Root.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[VC_Root alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
