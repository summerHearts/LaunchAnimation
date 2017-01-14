//
//  View4.h
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class View4;
typedef void(^SMKHelpViewBlock)(View4 *view);

@interface View4 : UIView
@property (copy, nonatomic) SMKHelpViewBlock block;
- (void)animationStart;
@end
