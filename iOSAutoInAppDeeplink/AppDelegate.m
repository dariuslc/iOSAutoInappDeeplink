//
//  AppDelegate.m
//  iOSAutoInAppDeeplink
//
//  Created by Darius Oleskevicius on 28/12/2015.
//  Copyright © 2015 bitcraftwerks. All rights reserved.
//

#import "AppDelegate.h"
#import "Localytics.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Localytics setLoggingEnabled:YES];
    [Localytics autoIntegrate:@"7a4bbd050054efe6854cf7a-f0683936-18bd-11e5-1ecc-00020191b0b4" launchOptions:launchOptions];
    // Override point for customization after application launch.
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if ([[url host] isEqualToString:@"deeplink"]) {
        if ([[url path] isEqualToString:@"/product"]) {
            UIStoryboard *storyboard = self.window.rootViewController.storyboard;
            UIViewController *productView = [storyboard instantiateViewControllerWithIdentifier:@"product"];
            self.window.rootViewController = productView;
            [self.window makeKeyAndVisible];
        }else{
            return NO;
        }
    }else{
        return NO;
    }
    
    return YES;
}

@end
