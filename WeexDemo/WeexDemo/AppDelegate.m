//
//  AppDelegate.m
//  WeexDemo
//
//  Created by hjc on 2017/1/16.
//  Copyright © 2017年 hehe. All rights reserved.
//

#import "AppDelegate.h"
#import <WeexSDK/WeexSDK.h>
#import "WXEventModule.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //配置，下面的配置也可以不用加
    [WXAppConfiguration setAppGroup:@"hjcWeexDemo"];    //组织或机构，默认为nil
    [WXAppConfiguration setAppName:@"WeexDemo"];        //app的名字，默认值为CFBundleDisplayName的值
    [WXAppConfiguration setAppVersion:@"1.0.0"];        //APP的版本，默认为CFBundleShortVersionString的值
    //设置打印日志的类型，有只打印错误日志、警告日志 等，我们这里选择打印全部日志。
    [WXLog setLogLevel: WXLogLevelAll];
    
    //初始化SDK环境
    [WXSDKEngine initSDKEnvironment];
    //registerModule是注册模块，如果没有，你点击weex的渲染的view中的按钮将找不到事件。
    [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
