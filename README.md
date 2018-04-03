# iOS 调整二维码页面亮度
## 介绍
模仿微信和支付宝二维码页面的亮度调节功能

## 方法
添加 Brightness 到工程里
在 AppDelegate.m 里 #import "Brightness.h"
在对应位置引用三个方法

1.
- (void)applicationWillResignActive:(UIApplication *)application {
    [Brightness OnapplicationWillResignActive];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

2.
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [Brightness OnapplicationDidBecomeActive];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

3.
- (void)applicationWillTerminate:(UIApplication *)application {
    [Brightness OnapplicationWillTerminate];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

在二维码页面设置


#import "QRcodeViewController.h"
#import "Brightness.h"

@interface QRcodeViewController ()
@property (nonatomic, readwrite, assign) CGFloat currentLight;
@end

@implementation QRcodeViewController



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.currentLight = [[[NSUserDefaults standardUserDefaults] valueForKey:@"screenBrightss"] floatValue];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isQRView"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [Brightness graduallySetBrightness:0.9];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [Brightness graduallySetBrightness:self.currentLight];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isQRView"];
}