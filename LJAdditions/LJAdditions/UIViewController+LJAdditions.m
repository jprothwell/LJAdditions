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
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController* vc = [storyboard instantiateViewControllerWithIdentifier:name];
    if (nil == vc) {
        vc = [storyboard instantiateInitialViewController];
    }
    return vc;
}

@end
