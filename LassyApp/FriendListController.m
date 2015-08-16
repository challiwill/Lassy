#import "FriendListController.h"
#import "FriendListDataSourceDelegate.h"
#import "BackendClient.h"

@interface FriendListController ()

@property (nonatomic) UITableView *tableView;
@property (nonatomic) FriendListDataSourceDelegate *tableViewDataSourceDelegate;
@property (nonatomic) BackendClient *backendClient;

@end

@implementation FriendListController

- (instancetype)initWithBackendClient:(BackendClient *)backendClient
{
    self = [super init];
    if (self) {
        self.backendClient = backendClient;
    }
    return self;
}

#pragma mark - UIViewController

- (void)loadView {
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    self.view = [[UIView alloc] initWithFrame: frame];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, frame.size.width, frame.size.height - 100)];
    self.tableView.backgroundColor = [UIColor colorWithRed:167.0/255.0 green:201.0/255.0 blue:224.0/255.0 alpha:1];
    [self.view addSubview: self.tableView];
    
    UIImage *logoImg = [UIImage imageNamed:@"logo_small.png"];
    UIImageView *logo = [[UIImageView alloc] initWithImage:logoImg];
    logo.center = CGPointMake(40, 55);
    logo.layer.cornerRadius = logo.frame.size.width/2;
    logo.clipsToBounds = true;
    [self.view addSubview:logo];

    UILabel *rankLbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 400, 50)];
    rankLbl.text = @"HOW YOU COMPARE";
    rankLbl.font = [UIFont systemFontOfSize:20.0 weight:3.0];
    rankLbl.textColor = [UIColor colorWithRed:2.0 green:2.0 blue:1.9 alpha:1];
    [self.view addSubview:rankLbl];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewDataSourceDelegate = [[FriendListDataSourceDelegate alloc] init];
    self.tableView.dataSource = self.tableViewDataSourceDelegate;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:friendCellIdentifier];
    
//    [self.backendClient fetchFriendsWithSuccessBlock:^void (NSArray *friends) {
//        [self.tableViewDataSourceDelegate configureWithFriends:friends];
//        [self.tableView reloadData];
//    }];
//
//    NSString *fid = @"7";
//    [self.backendClient fetchUserWithID:fid andWithSuccessBlock:^void (User *user) {
//        [self.tableViewDataSourceDelegate configureWithUser:user];
//        [self.tableView reloadData];
//    }];
    [self.backendClient fetchAllWithSuccessBlock:^void (NSArray *allUsers) {
        NSLog(@"configuring");
        [self.tableViewDataSourceDelegate configureWithAll:allUsers];
        [self.tableView reloadData];
    }];

    self.view.backgroundColor = [UIColor colorWithRed:36.0/255.0 green:54.0/255.0 blue:64.0/255.0 alpha:1];
}

@end
