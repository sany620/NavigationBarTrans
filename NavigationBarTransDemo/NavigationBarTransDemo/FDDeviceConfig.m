//
//  FDDeviceConfig.m
//
//
//  Created by Major on 2018/10/11.
//  Copyright © 2018年 HangZhou Major. All rights reserved.
//

#import "FDDeviceConfig.h"

@implementation FDDeviceConfig

+ (BOOL)iPhoneXSeries{
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    return iPhoneXSeries;
}


+ (void)addImpactFeedbackGeneratorWithFeedbackStyle:(UIImpactFeedbackStyle)feedbackStyle{
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *impactLight = [[UIImpactFeedbackGenerator alloc]initWithStyle:feedbackStyle];
        [impactLight impactOccurred];
    } else {
        // Fallback on earlier versions
    }
}



@end
