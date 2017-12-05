//
//  UITabBarController+LJAdditions.h
//  LJAdditions
//
//  Created by LeonJing on 05/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (LJAdditions)
- (BOOL) lj_replaceViewController:(UIViewController*)viewController atIndex:(NSInteger)index;
@end
