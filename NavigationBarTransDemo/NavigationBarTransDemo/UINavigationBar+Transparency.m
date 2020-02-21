//
//  UINavigationBar+Transparency.m
//  NavigationBarTransDemo
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 duanmu. All rights reserved.
//

#import "UINavigationBar+Transparency.h"
#import <objc/runtime.h>
#import "UIImage+DMUIImage.h"
#import "MacroDefine.h"



@implementation UINavigationBar (Transparency)

XM_DYNAMIC_PROPERTY_OBJECT(coverLayer, setCoverLayer, RETAIN, UIView *)
XM_DYNAMIC_PROPERTY_OBJECT(alertView, setAlertView, RETAIN, UIView *)

- (void)dm_setBackgroundColor:(UIColor *)customColor{
    
    if (!self.coverLayer){
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.coverLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), MANavBarHeight)];
        self.coverLayer.userInteractionEnabled = NO;
        self.coverLayer.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [[self.subviews firstObject] insertSubview:self.coverLayer atIndex:0];
        [self setShadowImage:[UIImage new]];
    }
    self.coverLayer.backgroundColor = customColor;
}

- (void)dm_setTranslationY:(CGFloat)translationY{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)dm_setBackgroundViewAlpha:(CGFloat)alpha{
    
    if (!self.coverLayer){
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.coverLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), MANavBarHeight)];
        self.coverLayer.userInteractionEnabled = NO;
        self.coverLayer.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [[self.subviews firstObject] insertSubview:self.coverLayer atIndex:0];
        [self setShadowImage:[UIImage new]];
    }
    self.coverLayer.layer.opacity = alpha;
}

- (void)dm_setAlpha:(CGFloat)alpha{

    if (@available(iOS 11, *)) {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

            obj.alpha = alpha;

        }];
    }else{
        [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
            view.alpha = alpha;
        }];

        [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
            view.alpha = alpha;
        }];
        
        UIView *titleView = [self valueForKey:@"_titleView"];
        titleView.alpha = alpha;
        //    when viewController first load, the titleView maybe nil
        [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {

            if (![obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
                obj.alpha = alpha;
            }
        }];
    }
}

- (void)dm_reset{
    
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    if (!CGAffineTransformIsIdentity(self.transform))
        self.transform = CGAffineTransformIdentity;
    [self dm_setAlpha:1.f];
    [self.coverLayer removeFromSuperview];
    self.coverLayer = nil;
}

@end


