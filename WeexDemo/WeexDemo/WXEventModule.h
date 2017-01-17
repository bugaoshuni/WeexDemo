//
//  WXEventModule.h
//  WeexDemo
//
//  Created by hjc on 2017/1/16.
//  Copyright © 2017年 hehe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WXEventModuleProtocol.h>
#import <WeexSDK/WXModuleProtocol.h>

@interface WXEventModule : NSObject <WXEventModuleProtocol, WXModuleProtocol>
@end
