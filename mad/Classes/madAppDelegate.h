//
//  madAppDelegate.h
//  mad
//
//  Created by Laurel Fan on 12/4/10.
//  Copyright Robot Co-op 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface madAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
