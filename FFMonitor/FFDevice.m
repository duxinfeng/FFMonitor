//
//  FFDevice.m
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import "FFDevice.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <sys/utsname.h>

@implementation FFDevice

+ (NSString *)devicePlatform
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6S";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6S Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])  return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10.4"])  return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])  return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"])  return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])  return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"])  return @"iPhone X";
    if ([platform isEqualToString:@"iPhone11,2"])  return @"iPhone XS";
    if ([platform isEqualToString:@"iPhone11,4"])  return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,6"])  return @"iPhone XS Max";
    if ([platform isEqualToString:@"iPhone11,8"])  return @"iPhone XR";
    
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    
    // iPad mini
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad mini 4 (Cellular)";
    
    // iPad Pro 9.7
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7 (WiFi)";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7 (Cellular)";
    
    // iPad Pro 12.9
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9 (WiFi)";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9 (Cellular)";
    
    // iPad (5th generation)
    if ([platform isEqualToString:@"iPad6,11"])     return @"iPad (5th generation)";
    if ([platform isEqualToString:@"iPad6,12"])     return @"iPad (5th generation)";
    
    // iPad Pro (12.9-inch, 2nd generation)
    if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro (12.9-inch, 2nd generation)";
    if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro (12.9-inch, 2nd generation)";
    
    // iPad Pro (10.5-inch)
    if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro (10.5-inch)";
    if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro (10.5-inch)";
   
    if ([platform isEqualToString:@"iPad7,5"])      return @"iPad 6 (WiFi)";
    if ([platform isEqualToString:@"iPad7,6"])      return @"iPad 6 (Cellular)";
    
    if ([platform isEqualToString:@"iPad8,1"])      return @"iPad Pro 11-inch (WiFi)";
    if ([platform isEqualToString:@"iPad8,2"])      return @"iPad Pro 11-inch (WiFi, 1TB)";
    if ([platform isEqualToString:@"iPad8,3"])      return @"iPad Pro 11-inch (Cellular)";
    if ([platform isEqualToString:@"iPad8,4"])      return @"iPad Pro 11-inch (Cellular, 1TB)";
    if ([platform isEqualToString:@"iPad8,5"])      return @"iPad Pro 12.9-inch 3 (WiFi)";
    if ([platform isEqualToString:@"iPad8,6"])      return @"iPad Pro 12.9-inch 3 (WiFi, 1TB)";
    if ([platform isEqualToString:@"iPad8,7"])      return @"iPad Pro 12.9-inch 3 (Cellular)";
    if ([platform isEqualToString:@"iPad8,8"])      return @"iPad Pro 12.9-inch 3 (Cellular, 1TB)";
    
    // Simulator
    if ([platform isEqualToString:@"i386"])         return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"iPhone Simulator";
    
    return platform;
}

+ (NSString *)systemVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)systemName {
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)name {
    return [UIDevice currentDevice].name;
}

+ (NSString *)model {
    return [UIDevice currentDevice].model;
}

+ (NSString *)uuid{
    return [UIDevice currentDevice].identifierForVendor.UUIDString;
}

+ (BOOL)isJailbroken {
#if !(TARGET_IPHONE_SIMULATOR)
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"]){
        return YES;
    }
    
    NSError *error;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreak.txt"
                        atomically:YES
                          encoding:NSUTF8StringEncoding error:&error];
    if(error==nil){
        //Device is jailbroken
        return YES;
    } else {
        [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];
    }
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]){
        //Device is jailbroken
        return YES;
    }
#endif
    return NO;
}

+ (NSString *)networkType {
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    id itemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            itemView = subview;
            break;
        }
    }
    
    NSString *netType = @"none";
    NSNumber * num = [itemView valueForKey:@"dataNetworkType"];
    if (num != nil) {
        NSInteger n = [num intValue];
        if (n == 1) {
            netType = @"2G";
        } else if (n == 2) {
            netType = @"3G";
        } else if (n == 3) {
            // 不确定4G是什么
            netType = @"4G";
        } else if (n != 0) {
            netType = @"Wifi";
        }
    }
    return netType;
}

+ (NSString *)proxy {
    
    CFDictionaryRef dicRef = CFNetworkCopySystemProxySettings();
    BOOL proxyHttpEnable = [(__bridge NSNumber *)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesHTTPEnable) boolValue];
    if (proxyHttpEnable) {
        NSString *host = (__bridge NSString *)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesHTTPProxy);
        NSString *port = (__bridge NSString *)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesHTTPPort);
        CFRelease(dicRef);
        return [NSString stringWithFormat:@"manual %@:%@", host, port];
    }
    
    BOOL proxyAutoEnable = [(__bridge NSNumber *)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesProxyAutoConfigEnable) boolValue];
    if (proxyAutoEnable) {
        NSString *configUrl = (__bridge NSString *)CFDictionaryGetValue(dicRef, (const void*)kCFNetworkProxiesProxyAutoConfigURLString);
        CFRelease(dicRef);
        return [NSString stringWithFormat:@"auto %@", configUrl];
    }
    CFRelease(dicRef);
    return @"disabled";
}

+ (NSString *)ipAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

+ (NSString *)operator {
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    id itemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarServiceItemView") class]]) {
            itemView = subview;
            break;
        }
    }
    NSString * service = [itemView valueForKey:@"serviceString"];
    return service ? : @"none";
}

/**
 手机电量
 */
+ (int)iPhoneBatteryLevel
{
    UIApplication *app = [UIApplication sharedApplication];
    if (app.applicationState == UIApplicationStateActive ||
        app.applicationState == UIApplicationStateInactive)
    {
        Ivar ivar=  class_getInstanceVariable([app class],"_statusBar");
        id status  = object_getIvar(app, ivar);
        for (id aview in [status subviews])
        {
            int batteryLevel = 0;
            for (id bview in [aview subviews])
            {
                if ([NSStringFromClass([bview class]) caseInsensitiveCompare:@"UIStatusBarBatteryItemView"] == NSOrderedSame&&[[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
                {
                    Ivar ivar=  class_getInstanceVariable([bview class],"_capacity");
                    if(ivar)
                    {
                        batteryLevel = ((int (*)(id, Ivar))object_getIvar)(bview, ivar);
                        if (batteryLevel > 0 && batteryLevel <= 100)
                        {
                            return batteryLevel;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                }
            }
        }
    }
    return 0;
}

+ (NSArray *)infoArray {
    return @[
             [NSString stringWithFormat:@"System Ver: %@", [self systemVersion]],
             [NSString stringWithFormat:@"System Name: %@", [self systemName]],
             [NSString stringWithFormat:@"Device Name: %@", [self name]],
             [NSString stringWithFormat:@"Device Model: %@", [self model]],
//             [NSString stringWithFormat:@"Location Auth: %@", [self locationAuth]],
             [NSString stringWithFormat:@"Jailbroken: %@", [self isJailbroken] ? @"YES" : @"NO"],
             [NSString stringWithFormat:@"Network: %@", [self networkType]],
             [NSString stringWithFormat:@"Proxy: %@", [self proxy]],
             [NSString stringWithFormat:@"IP: %@", [self ipAddress]],
             [NSString stringWithFormat:@"Operator: %@", [self operator]]
             ];
}

@end
