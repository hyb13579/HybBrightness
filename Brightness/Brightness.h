//
//  Brightnes.h
//  BrightnessDemo
//
//  Created by 黄一波 on 2018/4/3.
//  Copyright © 2018年 黄一波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Brightness : NSObject

/*!
 @method
 @abstract 逐步设置亮度
 */
+ (void)graduallySetBrightness:(CGFloat)value;

//AppDelegete
+ (void)OnapplicationWillResignActive;
+ (void)OnapplicationDidBecomeActive;
+ (void)OnapplicationWillTerminate;
@end
