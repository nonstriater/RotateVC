//
//  BaseNavigationVC.m
//  ONERotation
//
//  Created by Nemocdz on 2017/3/9.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "BaseNavigationVC.h"
#import "RotationVC.h"



@interface BaseNavigationVC ()



@end

@implementation BaseNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - - orientation
//设置是否允许自动旋转
- (BOOL)shouldAutorotate {
    return YES;
}

//设置支持的屏幕旋转方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([self.topViewController isKindOfClass:RotationVC.class]) {
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}

//设置presentation方式展示的屏幕方向
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return self.interfaceOrientation;
//}
@end
