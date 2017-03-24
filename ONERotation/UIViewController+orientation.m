//
//  UIViewController+orientation.m
//  ONERotation
//
//  Created by ranwenjie on 17/3/20.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "UIViewController+orientation.h"
#import <objc/runtime.h>
#import "RotationVC.h"

@implementation UIViewController (orientation)
//
//+ (void)load{
//    //hook UIViewController supportedInterfaceOrientations
//    
//    Method origM = class_getInstanceMethod(UIViewController.class, @selector(supportedInterfaceOrientations));
//    Method swizzleM = class_getInstanceMethod(UIViewController.class, @selector(or_supportedInterfaceOrientations));
//    
//    BOOL add = class_addMethod(UIViewController.class, @selector(supportedInterfaceOrientations), method_getImplementation(swizzleM), method_getTypeEncoding(swizzleM));
//    if (add) {
//        //origin 不存在
//        class_replaceMethod(UIViewController.class, @selector(or_supportedInterfaceOrientations), method_getImplementation(origM), method_getTypeEncoding(origM));
//        
//    }else{
//        //origin 已经存在
//        method_exchangeImplementations(origM, swizzleM);
//    }
//    
//}

- (UIInterfaceOrientationMask)or_supportedInterfaceOrientations{
    if ([self isKindOfClass:RotationVC.class] || [self isKindOfClass:UINavigationController.class]) {
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}

@end
