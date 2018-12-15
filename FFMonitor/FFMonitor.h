//
//  FFMonitor.h
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFMonitor : NSObject

+ (instancetype)instance;

- (void)show;

- (void)hide;

- (void)showAppInfo;

- (void)hideAppInfo;

@end

NS_ASSUME_NONNULL_END
