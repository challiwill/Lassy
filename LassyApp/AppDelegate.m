// Long-Ass Shower Shaming Yo! (LASSY)
#import "AppDelegate.h"
#import "FriendListController.h"
#import "BackendClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    BackendClient *backendClient = [[BackendClient alloc] initWithURLSession:[NSURLSession sharedSession] andOperationQueue:[NSOperationQueue mainQueue]];
    self.window.rootViewController = [[FriendListController alloc] initWithBackendClient:backendClient];
   
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
