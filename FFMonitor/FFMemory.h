//
//  FFMemory.h
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFMemory : NSObject

//当前app内存使用量
+ (NSUInteger)useMemoryForApp;

//设备总的内存
+ (NSUInteger)totalMemoryForDevice;

@end

NS_ASSUME_NONNULL_END
