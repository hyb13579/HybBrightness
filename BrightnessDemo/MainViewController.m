//
//  MainViewController.m
//  BrightnessDemo
//
//  Created by 黄一波 on 2018/4/3.
//  Copyright © 2018年 黄一波. All rights reserved.
//

#import "MainViewController.h"
#import "QRcodeViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)push:sender {
    QRcodeViewController *QRcodeVC = [[QRcodeViewController alloc] init];
    [self.navigationController pushViewController:QRcodeVC animated:YES];
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
