//
//  UINavigationBar+Transparency.h
//  NavigationBarTransDemo
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 duanmu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Transparency)

/**
 
 1. 使用前提navigationBar的translation必须是true 否者无效
 
 2. 注意不同iOS系统的navgationBar的层级关系
 
 3. 必要时还是需要hidden来处理

 */

- (void)dm_setBackgroundColor:(UIColor *)customColor;

- (void)dm_setAlpha:(CGFloat)alpha;

- (void)dm_setBackgroundViewAlpha:(CGFloat)alpha;

- (void)dm_setTranslationY:(CGFloat)translationY;

- (void)dm_reset;


@end

NS_ASSUME_NONNULL_END
