//
//  Brightnes.m
//  BrightnessDemo
//
//  Created by 黄一波 on 2018/4/3.
//  Copyright © 2018年 黄一波. All rights reserved.
//

#import "Brightness.h"

static NSOperationQueue *_queue;

@implementation Brightness

+ (void)graduallySetBrightness:(CGFloat)value{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 1;
    }
    [_queue cancelAllOperations];
    
    CGFloat brightness = [UIScreen mainScreen].brightness;
    CGFloat step = 0.005 * ((value > brightness) ? 1 : -1);
    int times = fabs((value - brightness) / 0.005);
    for (CGFloat i = 1; i < times + 1; i++) {
        [_queue addOperationWithBlock:^{
            [NSThread sleepForTimeInterval:1 / 180.0];
            [UIScreen mainScreen].brightness = brightness + i * step;
        }];
    }
}


#pragma mark - AppDelegete
+ (void)OnapplicationWillResignActive {
    CGFloat brights = [[[NSUserDefaults standardUserDefaults] valueForKey:@"screenBrightss"] floatValue];
    [[UIScreen mainScreen] setBrightness:brights];
}

+ (void)OnapplicationDidBecomeActive {
    BOOL isQR = [[[NSUserDefaults standardUserDefaults] valueForKey:@"isQRView"] boolValue];
    if (isQR) {
        [self graduallySetBrightness:0.9];
    }else{
        [[NSUserDefaults standardUserDefaults] setFloat:[[UIScreen mainScreen] brightness] forKey:@"screenBrightss"];
    }
}

+ (void)OnapplicationWillTerminate {
    CGFloat brights = [[[NSUserDefaults standardUserDefaults] valueForKey:@"screenBrightss"] floatValue];
    [[UIScreen mainScreen] setBrightness:brights];
}
@end
