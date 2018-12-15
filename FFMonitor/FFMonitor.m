//
//  FFMonitor.m
//  HaoJiaZhang
//
//  Created by Xinfeng Du on 2018/12/6.
//  Copyright © 2018 好家长. All rights reserved.
//

#import "FFMonitor.h"
#import "FFApp.h"
#import "FFDevice.h"
#import "FFCPU.h"
#import "FFMemory.h"
#import "FFFPSLabel.h"

@interface FFMonitor ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView *performanceView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) FFFPSLabel *fpsLabel;
@property (nonatomic,strong) UILabel *cpuLabel;
@property (nonatomic,strong) UILabel *memoryLabel;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataarray;

@end

@implementation FFMonitor

+ (instancetype)instance
{
    static FFMonitor *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//- (id)init
//{
//    self = [super init];
//    if (self) {
//
//        [self initializeData];
//    }
//    return self;
//}

- (void)show
{
    [[self frontWindow] addSubview:self.performanceView];
    [self.performanceView addSubview:self.fpsLabel];
    [self.performanceView addSubview:self.memoryLabel];
    [self.performanceView addSubview:self.cpuLabel];

    self.fpsLabel.frame = CGRectMake(0, 0, self.performanceView.bounds.size.width, self.performanceView.bounds.size.height/3);
    self.memoryLabel.frame = CGRectMake(0, self.fpsLabel.origin.y + self.performanceView.bounds.size.height/3, self.performanceView.bounds.size.width, self.performanceView.bounds.size.height/3);
    self.cpuLabel.frame = CGRectMake(0, self.memoryLabel.origin.y + self.performanceView.bounds.size.height/3, self.performanceView.bounds.size.width, self.performanceView.bounds.size.height/3);

//    [[self frontWindow] addSubview:self.tableView];
//    [[self frontWindow] addSubview:self.tableView];
    [self startTimer];
}

- (void)hide
{
    [self stopTimer];

}

- (void)showAppInfo
{
    [self initializeData];
    [[self frontWindow] addSubview:self.tableView];
}

- (void)hideAppInfo
{
    [self.tableView removeFromSuperview];
}

- (void)startTimer
{
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(refreshData) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)refreshData
{
    self.memoryLabel.text = [NSString stringWithFormat:@"%zd MB",[FFMemory useMemoryForApp]];

    self.cpuLabel.text = [NSString stringWithFormat:@"%.1f%@",[FFCPU cpuUsageForApp] * 100 ,@"%"];

}


- (void)initializeData
{
    
    //获取手机型号
    NSString *iphoneType = [FFDevice devicePlatform];
    //获取手机系统版本
    NSString *phoneVersion = [FFDevice systemVersion];
    
    //获取bundle id
//    NSString *bundleId = [FFApp appBundleIdentifier];
    
    //获取App版本号
    NSString *appVersion = [FFApp appVersion];
    
    //获取App版本Code
//    NSString *bundleVersion = [FFApp appBuild];
    
    //获取手机是否有地理位置权限
    NSString *locationAuthority = [FFApp locationAuth];
    
    //获取网络权限
    NSString *netAuthority = [FFApp netAuth];//暂时没有办法获取
    
    //获取拍照权限
    NSString *cameraAuthority = [FFApp cameraAuth];
    
    //获取麦克风权限
    NSString *audioAuthority = [FFApp audioAuth];
    
    //获取相册权限
    NSString *photoAuthority = [FFApp photoAuth];
    
    NSString *pushAuthority = [FFApp pushAuth];

    NSArray *dataarray = @[
                           @{
                               @"title":@"手机信息",
                               @"array":@[@{
                                              @"title":@"手机型号",
                                              @"value":iphoneType
                                              },
                                          @{
                                              @"title":@"系统版本",
                                              @"value":phoneVersion
                                              }
                                          ]
                               },
                           @{
                               @"title":@"App信息",
                               @"array":@[@{
                                              @"title":@"版本号",
                                              @"value":appVersion
                                              },
                                          @{
                                              @"title":@"定位权限",
                                              @"value":locationAuthority
                                              },
                                          @{
                                              @"title":@"网络权限",
                                              @"value":netAuthority
                                              },
                                          @{
                                              @"title":@"相机权限",
                                              @"value":cameraAuthority
                                              },
                                          @{
                                              @"title":@"相册权限",
                                              @"value":photoAuthority
                                              },
                                          @{
                                              @"title":@"麦克风权限",
                                              @"value":audioAuthority
                                              },
                                          @{
                                              @"title":@"推送权限",
                                              @"value":pushAuthority
                                              },
                                          ]
                               }
                           
                           ];
    
    _dataarray = dataarray;
}




- (UIWindow *)frontWindow
{
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelSupported = (window.windowLevel >= UIWindowLevelNormal && window.windowLevel <= UIWindowLevelNormal);
        BOOL windowKeyWindow = window.isKeyWindow;
        
        if(windowOnMainScreen && windowIsVisible && windowLevelSupported && windowKeyWindow) {
            return window;
        }
    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataarray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.dataarray[section][@"array"];
    return array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellReuseIdentifier = @"kCellReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellReuseIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSArray *array = self.dataarray[indexPath.section][@"array"];
    NSDictionary *item = array[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.detailTextLabel.text = item[@"value"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 45)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    NSDictionary *dic = self.dataarray[section];
    titleLabel.text = dic[@"title"];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor orangeColor];
    return titleLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 设置需要的偏移量,这个UIEdgeInsets左右偏移量不要太大，不然会titleLabel也会偏移。
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 10, 0, 10);
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) { // iOS8的方法
         [cell setLayoutMargins:inset];
    }

    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
         [cell setSeparatorInset:inset];
    }
}

- (UITableView *)tableView{
    if (!_tableView) {
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake((screenBounds.size.width - 310)/2, (screenBounds.size.height - 495 - 45)/2, 310, 495 + 45) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 45;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = [self tableFooter:screenBounds];
        _tableView.layer.cornerRadius = 10;
        _tableView.layer.borderWidth = 2;
        _tableView.layer.borderColor = [[UIColor orangeColor] CGColor];
    }
    return _tableView;
}

- (UIButton *)tableFooter:(CGRect)rect
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, rect.size.width, 45);
    [button addTarget:self action:@selector(hideAppInfo) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (UIView *)performanceView
{
    if (!_performanceView) {
        _performanceView = [[UIView alloc] init];
        _performanceView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
        _performanceView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 40+3, 200, 40, 40);
        _performanceView.layer.cornerRadius = 4;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAppInfo)];
        [_performanceView addGestureRecognizer:tap];
    }
    return _performanceView;
}

- (UILabel *)cpuLabel
{
    if (!_cpuLabel) {
        _cpuLabel = [[UILabel alloc] init];
        _cpuLabel.textAlignment = NSTextAlignmentCenter;
        _cpuLabel.textColor = [UIColor whiteColor];
        _cpuLabel.font = [UIFont systemFontOfSize:10];

    }
    return _cpuLabel;
}

- (UILabel *)memoryLabel
{
    if (!_memoryLabel) {
        _memoryLabel = [[UILabel alloc] init];
        _memoryLabel.textAlignment = NSTextAlignmentCenter;
        _memoryLabel.textColor = [UIColor whiteColor];
        _memoryLabel.font = [UIFont systemFontOfSize:10];
    }
    return _memoryLabel;
}

- (FFFPSLabel *)fpsLabel
{
    if (!_fpsLabel) {
        _fpsLabel = [[FFFPSLabel alloc] init];
        _fpsLabel.font = [UIFont systemFontOfSize:10];

    }
    return _fpsLabel;
}

@end
