//
//  FFApp.h
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFApp : NSObject

/**
 当前APP名称
 */
+ (NSString *)appName;

/**
 获取APP 版本
 */
+ (NSString *)appVersion;

/**
 获取APP Build
 */
+ (NSString *)appBuild;

/**
 获取APP Bundle Identifier
 */
+ (NSString *)appBundleIdentifier;

/**
 网络权限
 */
+ (NSString *)netAuth;

/**
 相机权限
 */
+ (NSString *)cameraAuth;

/**
 录音权限
 */
+ (NSString *)audioAuth;

/**
 定位权限
 */
+ (NSString *)locationAuth;

/**
 相册权限
 */
+ (NSString *)photoAuth;

/**
 推送权限
 */
+ (NSString *)pushAuth;

@end

NS_ASSUME_NONNULL_END
