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
    self.view.backgroundColor = [UIColor colorWithRed:36.0/255.0 green:54.0/255.0 blue:64.0/255.0 alpha:1];
    self.loginButton = [[FBSDKLoginButton alloc] init];
    [self.loginButton setDelegate:self];
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];

    UIImage *logoImg = [UIImage imageNamed:@"logo_giant.png"];
    UIImageView *logo = [[UIImageView alloc] initWithImage:logoImg];
    logo.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    logo.layer.cornerRadius = logo.frame.size.width/2;
    logo.clipsToBounds = true;
    [self.view addSubview:logo];
   
    self.loginButton.center = CGPointMake(self.view.center.x, logo.center.y+250);
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
