//
//  UIViewController+LJAdditions.h
//  LJAdditions
//
//  Created by LeonJing on 04/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LJAdditions)
+ (instancetype) lj_instanceFromStoryboard;
+ (instancetype) lj_instanceWithStoryboard:(NSString*)name;
@end
