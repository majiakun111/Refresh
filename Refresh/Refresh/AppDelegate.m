//
//  AppDelegate.m
//  Refresh
//
//  Created by Ansel on 16/2/21.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "AppDelegate.h"
#import "RefreshTableViewController.h"
#import "RefreshCollectionViewController.h"
#import "RefreshWebViewViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarItem *tableViewItem = [[UITabBarItem alloc] initWithTitle:@"Table" image:nil selectedImage:nil];
    RefreshTableViewController *refreshTableViewController = [[RefreshTableViewController alloc] init];
    refreshTableViewController.tabBarItem = tableViewItem;
    
    UITabBarItem *collectionViewItem = [[UITabBarItem alloc] initWithTitle:@"Collection" image:nil selectedImage:nil];
    RefreshCollectionViewController *refreshCollectionViewController = [[RefreshCollectionViewController alloc] init];
    refreshCollectionViewController.tabBarItem = collectionViewItem;
    
    UITabBarItem *webViewItem = [[UITabBarItem alloc] initWithTitle:@"WebView" image:nil selectedImage:nil];
    RefreshWebViewViewController *refreshWebViewViewController = [[RefreshWebViewViewController alloc] init];
    refreshWebViewViewController.tabBarItem = webViewItem;
    
    NSArray<UIViewController *> *viewControllers = @[refreshTableViewController, refreshCollectionViewController, refreshWebViewViewController];
    
    UITabBarController *rootViewController = [[UITabBarController alloc] init];
    [rootViewController setViewControllers:viewControllers];
    self.window.rootViewController = rootViewController;
    
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
