#import "LoginViewController.h"
#import "FriendListController.h"
#import "BackendClient.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginViewController ()

@property FBSDKLoginButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginButton = [[FBSDKLoginButton alloc] init];
    [self.loginButton setDelegate:self];
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginButton.center = self.view.center;
    [self.view addSubview:self.loginButton];
}

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    NSLog(@"Logged in\n");
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me/friends"
                                  parameters:@{@"fields":@"id, name"}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
        NSLog(@"resultis:\n%@",result);
        //        NSString *tokenValue = [[FBSDKAccessToken currentAccessToken] tokenString];
        //[self performSegueWithIdentifier:@"loggedInSegue" sender: loginButton];
        BackendClient *backendClient = [[BackendClient alloc] initWithURLSession:[NSURLSession sharedSession] andOperationQueue:[NSOperationQueue mainQueue]];
        FriendListController *newVC = [[FriendListController alloc] initWithBackendClient:backendClient];
        [self presentModalViewController:newVC animated:YES];
        
    }];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"Logged out");
}

@end
