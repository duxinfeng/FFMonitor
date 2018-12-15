//
//  FFApp.m
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import "FFApp.h"
#import <CoreLocation/CoreLocation.h>
#import <AVFoundation/AVFoundation.h>
#import <sys/utsname.h>
#import <CoreTelephony/CTCellularData.h>
#import <Photos/Photos.h>

@implementation FFApp

/**
 当前APP名称
 */
+ (NSString *)appName
{
    NSString *displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    if (!displayName)
    {
        displayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
    }
    return displayName;
}

/**
 获取APP 版本
 */
+ (NSString *)appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

/**
 获取APP Build
 */
+ (NSString *)appBuild
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

/**
 获取APP Bundle Identifier
 */
+ (NSString *)appBundleIdentifier
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)netAuth
{
    CTCellularData *cellularData = [[CTCellularData alloc]init];
    CTCellularDataRestrictedState state = cellularData.restrictedState;
    NSString *authority = @"Unknown";
    switch (state) {
        case kCTCellularDataRestricted:
            authority = @"Restricted";
            break;
        case kCTCellularDataNotRestricted:
            authority = @"NotRestricted";
            break;
        case kCTCellularDataRestrictedStateUnknown:
            authority = @"Unknown";
            break;
        default:
            break;
    }
    return authority;
}

+ (NSString *)cameraAuth
{
    NSString *authority = @"";
    NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    switch (authStatus) {
        case AVAuthorizationStatusNotDetermined:
            authority = @"NotDetermined";
            break;
        case AVAuthorizationStatusRestricted:
            authority = @"Restricted";
            break;
        case AVAuthorizationStatusDenied:
            authority = @"Denied";
            break;
        case AVAuthorizationStatusAuthorized:
            authority = @"Authorized";
            break;
        default:
            break;
    }
    return authority;
}

+ (NSString *)audioAuth
{
    NSString *authority = @"";
    NSString *mediaType = AVMediaTypeAudio;//读取媒体类型
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
    switch (authStatus) {
        case AVAuthorizationStatusNotDetermined:
            authority = @"NotDetermined";
            break;
        case AVAuthorizationStatusRestricted:
            authority = @"Restricted";
            break;
        case AVAuthorizationStatusDenied:
            authority = @"Denied";
            break;
        case AVAuthorizationStatusAuthorized:
            authority = @"Authorized";
            break;
        default:
            break;
    }
    return authority;
}

+ (NSString *)locationAuth
{
    NSString *authority = @"";
    CLAuthorizationStatus authStaus = [CLLocationManager authorizationStatus];
    switch (authStaus) {
        case kCLAuthorizationStatusNotDetermined:
            authority = @"NotDetermined";
            break;
        case kCLAuthorizationStatusRestricted:
            authority = @"Restricted";
            break;
        case kCLAuthorizationStatusDenied:
            authority = @"Denied";
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            authority = @"AuthorizedAlways";
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            authority = @"AuthorizedWhenInUse";
            break;
        default:
            break;
    }
    return authority;
}

+ (NSString *)photoAuth
{
    NSString *authority = @"";
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0 //iOS 8.0以下使用AssetsLibrary.framework
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    switch (status) {
        case ALAuthorizationStatusNotDetermined:    //用户还没有选择
        {
            authority = @"NotDetermined";
        }
            break;
        case ALAuthorizationStatusRestricted:       //家长控制
        {
            authority = @"Restricted";
        }
            break;
        case ALAuthorizationStatusDenied:           //用户拒绝
        {
            authority = @"Denied";
        }
            break;
        case ALAuthorizationStatusAuthorized:       //已授权
        {
            authority = @"Authorized";
        }
            break;
        default:
            break;
    }
#else   //iOS 8.0以上使用Photos.framework
    PHAuthorizationStatus current = [PHPhotoLibrary authorizationStatus];
    switch (current) {
        case PHAuthorizationStatusNotDetermined:    //用户还没有选择(第一次)
        {
            authority = @"NotDetermined";
        }
            break;
        case PHAuthorizationStatusRestricted:       //家长控制
        {
            authority = @"Restricted";
        }
            break;
        case PHAuthorizationStatusDenied:           //用户拒绝
        {
            authority = @"Denied";
        }
            break;
        case PHAuthorizationStatusAuthorized:       //已授权
        {
            authority = @"Authorized";
        }
            break;
        default:
            break;
    }
#endif
    return authority;
}

+ (NSString *)pushAuth
{
    
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIRemoteNotificationTypeNone) {
        return @"NO";
    }else{
        return @"YES";
    }
}

@end
