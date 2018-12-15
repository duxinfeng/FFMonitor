//
//  FFCPU.h
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFCPU : NSObject

//获取CPU使用率
+ (CGFloat)cpuUsageForApp;

@end

NS_ASSUME_NONNULL_END
