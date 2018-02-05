//
//  LJAdditions.h
//  LJAdditions
//
//  Created by LeonJing on 23/11/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
///------------------------------------------------------------------------------------------------
/// @name 版本号
///------------------------------------------------------------------------------------------------

NSString * _Nullable LJBundleVersionString(void);
NSString * _Nullable LJBundleShortVersionString(void);

///------------------------------------------------------------------------------------------------
/// @name 沙盒路径
///------------------------------------------------------------------------------------------------

NSString * _Nullable LJDocumentDirectory(void);
NSString * _Nullable LJDocumentDirectoryByAppendingPathComponent(NSString * _Nullable pathComponent);

NSString * _Nullable LJLibraryDirectory(void);
NSString * _Nullable LJLibraryDirectoryByAppendingPathComponent(NSString * _Nullable pathComponent);

NSString * _Nullable LJCachesDirectory(void);
NSString * _Nullable LJCachesDirectoryByAppendingPathComponent(NSString * _Nullable pathComponent);

NSString * _Nullable LJTemporaryDirectoryByAppendingPathComponent(NSString * _Nullable pathComponent);
///------------------------------------------------------------------------------------------------
/// @name 屏幕|窗口|控制器
///------------------------------------------------------------------------------------------------

CGSize LJScreenSize(void);
CGFloat LJScreenScale(void);
CGFloat LJScreenWidth(void);
CGFloat LJScreenHeight(void);
//值转像素
static inline CGFloat LJCGFloatToPixel(CGFloat value) {
    return value * LJScreenScale();
}
//像素转值
static inline CGFloat LJPixelToCGFloat(CGFloat value) {
    return value / LJScreenScale();
}

///------------------------------------------------------------------------------------------------
/// @name GCD
///------------------------------------------------------------------------------------------------

dispatch_source_t _Nullable LJGCDTimer(NSTimeInterval interval,
                                         NSTimeInterval leeway,
                            dispatch_block_t _Nullable handler,
                     _Nullable dispatch_block_t cancelHandler);

void LJGCDDelay(NSTimeInterval delayInSeconds, dispatch_block_t _Nonnull handler);

///------------------------------------------------------------------------------------------------
/// @name 顶层VC
///------------------------------------------------------------------------------------------------

UIViewController * _Nullable LJTopViewController(void);

UIViewController * _Nullable LJRootViewController(void);
