//
//  RotationVC.m
//  ONERotation
//
//  Created by Nemocdz on 2017/3/9.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "RotationVC.h"
#import "AppDelegate.h"
//#import "BaseNavigationVC.h"
//#import "UIViewController+Orientation.h"
#import "ONEOrientationRotationProtocol.h"

@interface RotationVC ()<ONEOrientationRotationProtocol>

@property(nonatomic, assign) BOOL m_canRotate;

@property(nonatomic, assign) UIInterfaceOrientationMask mask;
@end

@implementation RotationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.m_canRotate = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.m_canRotate = YES;
        
        //[self supportedInterfaceOrientations];
        [UIViewController attemptRotationToDeviceOrientation];
    });
    
}
//
- (void)viewWillAppear:(BOOL)animated{
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.mask = UIInterfaceOrientationMaskAll;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
   
    //[UIViewController attemptRotationToDeviceOrientation];


}
//
//- (IBAction)back:(id)sender{
//    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    appdelegate.mask = UIInterfaceOrientationMaskPortrait;
//    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
//    
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}


- (void)viewWillDisappear:(BOOL)animated{

//    [[UIDevice currentDevice]setValue:[NSNumber numberWithInteger:UIInterfaceOrientationMaskPortrait] forKey:@"orientation"];
   

    //设置屏幕的转向为竖屏
     [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.mask = UIInterfaceOrientationMaskPortrait;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
    
    
   
    //刷新
   // [UIViewController attemptRotationToDeviceOrientation];

}

- (BOOL)canRotate{
    return self.m_canRotate;
}

//
//
//- (BOOL)shouldAutorotate{
//    return YES;
//}
//
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return UIInterfaceOrientationMaskPortrait;
//}
//




@end
