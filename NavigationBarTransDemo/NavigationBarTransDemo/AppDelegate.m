//
//  AppDelegate.m
//  NavigationBarTransDemo
//
//  Created by apple on 2020/2/21.
//  Copyright © 2020 duanmu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName :UIColor.blackColor};
    [[UINavigationBar appearance] setBarTintColor:UIColor.whiteColor];
    [[UINavigationBar appearance] setTintColor:UIColor.whiteColor];

    //适配iOS11
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        UITableView.appearance.estimatedRowHeight = 0;
        UITableView.appearance.estimatedSectionFooterHeight = 0;
        UITableView.appearance.estimatedSectionHeaderHeight = 0;
    }
    ViewController *viewC = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
