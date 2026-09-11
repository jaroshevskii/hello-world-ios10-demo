#import "HelloWorldDemoAppDelegate.h"
#import "HelloWorldDemoViewController.h"

@implementation HelloWorldDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[HelloWorldDemoViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end