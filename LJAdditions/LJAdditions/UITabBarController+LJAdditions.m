//
//  UITabBarController+LJAdditions.m
//  LJAdditions
//
//  Created by LeonJing on 05/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "UITabBarController+LJAdditions.h"

@implementation UITabBarController (LJAdditions)
- (BOOL) lj_replaceViewController:(UIViewController*)viewController atIndex:(NSInteger)index{
    NSAssert(nil!=viewController, @"viewController is nil!");
    BOOL ret = NO;
    if (index < self.viewControllers.count) {
        NSMutableArray* vcs = [self.viewControllers mutableCopy];
        [vcs replaceObjectAtIndex:index withObject:viewController];
        self.viewControllers = vcs;
        
        ret = YES;
    }
    return ret;
}
@end
