//
//  UIViewController+LJAdditions.m
//  LJAdditions
//
//  Created by LeonJing on 04/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "UIViewController+LJAdditions.h"

@implementation UIViewController (LJAdditions)

+ (instancetype) lj_instanceFromStoryboard{
    NSString* name = NSStringFromClass([self class]);
    UIStoryboard* storyboard = nil;
    UIViewController* vc = nil;
    @try{
        storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        vc = [storyboard instantiateViewControllerWithIdentifier:name];
    }
    @catch(NSException *exception) {
        NSLog(@"%@",exception);
        vc = [storyboard instantiateInitialViewController];
    }
    
    if (nil == vc) {
        vc = [[self alloc]init];
    }
    return vc;
}

+ (instancetype) lj_instanceWithStoryboard:(NSString*)name{
    NSString* className = NSStringFromClass([self class]);
    UIStoryboard* storyboard = nil;
    UIViewController* vc = nil;
    @try {
        storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        vc = [storyboard instantiateViewControllerWithIdentifier:className];
    }@catch (NSException *exception) {
        NSLog(@"%@",exception);
        vc = [storyboard instantiateInitialViewController];
    }
    
    if (nil == vc) {
        vc = [[self alloc]init];
    }
    return vc;
}

@end
