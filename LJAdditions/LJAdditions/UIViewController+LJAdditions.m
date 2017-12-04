//
//  UIViewController+LJAdditions.m
//  LJAdditions
//
//  Created by LeonJing on 04/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "UIViewController+LJAdditions.h"

@implementation UIViewController (LJAdditions)

+ (instancetype) lj_instanceViewControllerFromStoryboard{
    NSString* name = NSStringFromClass([self class]);
    UIStoryboard* storyboard = nil;
    @try{
        storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    }
    @catch(NSException *exception) {
        NSLog(@"未找到storyboard!");
        return [[self alloc]init];
    }
    UIViewController* vc = [storyboard instantiateViewControllerWithIdentifier:name];
    if (nil == vc) {
        vc = [storyboard instantiateInitialViewController];
    }
    return vc;
}

+ (instancetype) lj_instanceViewControllerFromStoryboardName:(NSString*)name{
    NSString* className = NSStringFromClass([self class]);
    UIStoryboard* storyboard = nil;
    @try {
        storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    }@catch (NSException *exception) {
        NSLog(@"未找到storyboard!");
        return [[self alloc]init];
    }
    UIViewController* vc = [storyboard instantiateViewControllerWithIdentifier:className];
    if (nil == vc) {
        vc = [storyboard instantiateInitialViewController];
    }
    return vc;
}

@end
