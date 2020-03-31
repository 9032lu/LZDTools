//
//  LZDAppDelegate.m
//  LZDTools
//
//  Created by 511815816@qq.com on 03/31/2020.
//  Copyright (c) 2020 511815816@qq.com. All rights reserved.
//

#import "LZDAppDelegate.h"
#import "NSString+LZDRegex.h"
#import "UIImage+UIImage_color.h"
#import "LZDViewController.h"
#import "LZDNextViewController.h"

#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

@implementation LZDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *string = @"isjdlf@qq.com";
    NSLog(@"%@ ==%d",string,[string isValidEmail]);

    LZDViewController *vc1 = [[LZDViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
    nav1.tabBarItem.title = @"one";
    LZDNextViewController *vc2 = [[LZDNextViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    nav2.tabBarItem.title = @"two";
    UITabBarController *tab = [[UITabBarController alloc] init];
    [tab setViewControllers:[NSMutableArray arrayWithObjects:nav1, nav2, nil]];
    tab.view.frame = CGRectMake(0, -20, SCREENWIDTH, SCREENHEIGHT);
    self.window.rootViewController = tab;
    

    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
