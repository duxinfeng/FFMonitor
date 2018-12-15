//
//  FFDevice.h
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFDevice : NSObject

+ (NSString *)devicePlatform;
+ (NSString *)systemVersion;
+ (NSString *)systemName;
+ (NSString *)name;
+ (NSString *)model;
+ (NSString *)uuid;
+ (NSString *)networkType;
+ (NSArray *)infoArray;

@end

NS_ASSUME_NONNULL_END
