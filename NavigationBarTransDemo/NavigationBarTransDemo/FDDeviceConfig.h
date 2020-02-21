//
//  FDDeviceConfig.h
//  
//
//  Created by M on 2018/10/11.
//  Copyright © 2018年 HangZhou Major. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface FDDeviceConfig : NSObject

+ (BOOL)iPhoneXSeries;
+ (void)addImpactFeedbackGeneratorWithFeedbackStyle:(UIImpactFeedbackStyle)feedbackStyle;

@end
