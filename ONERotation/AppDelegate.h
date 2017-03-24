//
//  AppDelegate.h
//  ONERotation
//
//  Created by Nemocdz on 2017/3/9.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (assign , nonatomic) BOOL isForceLandscape;
//@property (assign ,nonatomic) BOOL isForcePortrait;
@property (assign ,nonatomic) UIInterfaceOrientationMask mask;

@end

