//
//  LJAdditions.m
//  LJAdditions
//
//  Created by LeonJing on 23/11/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "LJAdditions.h"

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 版本号

NSString * LJBundleVersionString()
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

NSString * LJBundleShortVersionString()
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 沙盒路径

NSString * LJDocumentDirectory()
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

NSString * LJDocumentDirectoryByAppendingPathComponent(NSString *pathComponent)
{
    return [LJDocumentDirectory() stringByAppendingPathComponent:pathComponent];
}

NSString * LJLibraryDirectory()
{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}

NSString * LJLibraryDirectoryByAppendingPathComponent(NSString *pathComponent)
{
    return [LJLibraryDirectory() stringByAppendingPathComponent:pathComponent];
}

NSString * LJCachesDirectory()
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}

NSString * LJCachesDirectoryByAppendingPathComponent(NSString *pathComponent)
{
    return [LJCachesDirectory() stringByAppendingPathComponent:pathComponent];
}

NSString * LJTemporaryDirectoryByAppendingPathComponent(NSString *pathComponent){
    return [NSTemporaryDirectory() stringByAppendingPathComponent:pathComponent];
}
///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 屏幕|窗口|控制器
CGSize LJScreenSize(void)
{
    static CGSize size;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size = [UIScreen mainScreen].bounds.size;
        if (size.height < size.width) {
            CGFloat tmp = size.height;
            size.height = size.width;
            size.width = tmp;
        }
    });
    return size;
}

CGFloat LJScreenScale(void)
{
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}

CGFloat LJScreenWidth(void){
    static CGFloat width;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        width = LJScreenSize().width;
    });
    return width;
}
CGFloat LJScreenHeight(void){
    static CGFloat height;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height = LJScreenSize().height;
    });
    return height;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - GCD

dispatch_source_t LJGCDTimer(NSTimeInterval interval,
                             NSTimeInterval leeway,
                             dispatch_block_t handler,
                             dispatch_block_t cancelHandler)
{
    double t = interval * NSEC_PER_SEC;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, t, leeway * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, handler);
    if (cancelHandler) {
        dispatch_source_set_cancel_handler(timer, cancelHandler);
    }
    dispatch_resume(timer);
    return timer;
}

void LJGCDDelay(NSTimeInterval delayInSeconds, dispatch_block_t handler)
{
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(when, dispatch_get_main_queue(), handler);
}
