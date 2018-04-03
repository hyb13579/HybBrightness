//
//  QRcodeViewController.m
//  BrightnessDemo
//
//  Created by 黄一波 on 2018/4/3.
//  Copyright © 2018年 黄一波. All rights reserved.
//

#import "QRcodeViewController.h"
#import "Brightness.h"

@interface QRcodeViewController ()
@property (nonatomic, readwrite, assign) CGFloat currentLight;
@end

@implementation QRcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
