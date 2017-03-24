//
//  AppDelegate.m
//  ONERotation
//
//  Created by Nemocdz on 2017/3/9.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "AppDelegate.h"
#import "RotationVC.h"
#import "BaseNavigationVC.h"
#import "ONEOrientationRotationProtocol.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


//- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
//    if (self.mask){
//        return self.mask;
//    }
//    return UIInterfaceOrientationMaskPortrait;
//}

/* Allow Landscape mode for specific ViewControllers */
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    UIViewController* topVC = [self topViewControllerWith: self.window.rootViewController];
    if ([topVC respondsToSelector:@selector(canRotate)] && [(id<ONEOrientationRotationProtocol>)topVC canRotate]) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    
    return UIInterfaceOrientationMaskPortrait;
}

/* get the top ViewController */
- (UIViewController*) topViewControllerWith:(UIViewController *)rootViewController {
    if (rootViewController == nil) { return nil; }
    if ([rootViewController isKindOfClass: [UITabBarController class]]) {
        return [self topViewControllerWith: ((UITabBarController*) rootViewController).selectedViewController];
    }
    else if ([rootViewController isKindOfClass: [UINavigationController class]]) {
        return [self topViewControllerWith: ((UINavigationController*) rootViewController).visibleViewController];
    }
    else if (rootViewController.presentedViewController != nil) {
        return [self topViewControllerWith: [rootViewController presentedViewController]];
    }
    return rootViewController;
}



@end
