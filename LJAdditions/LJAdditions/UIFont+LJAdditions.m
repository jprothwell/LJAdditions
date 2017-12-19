//
//  UIFont+LJAdditions.m
//  LJAdditions
//
//  Created by LeonJing on 19/12/2017.
//  Copyright © 2017 LeonJing. All rights reserved.
//

#import "UIFont+LJAdditions.h"

@implementation UIFont (LJAdditions)

- (CGFloat) lj_awesomeHeight{
    return ceilf(self.ascender+fabs(self.descender));
}

@end
