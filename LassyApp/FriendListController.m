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
    self.tableView = [[UITableView alloc] initWithFrame: frame];
    [self.view addSubview: self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableViewDataSourceDelegate = [[FriendListDataSourceDelegate alloc] init];
    self.tableView.dataSource = self.tableViewDataSourceDelegate;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:friendCellIdentifier];
    
    [self.backendClient fetchFriendsWithSuccessBlock:^void (NSArray *friends) {
        [self.tableViewDataSourceDelegate configureWithFriends:friends];
        [self.tableView reloadData];
    }];

    NSString *fid = @"7";
    [self.backendClient fetchUserWithID:fid andWithSuccessBlock:^void (User *user) {
        [self.tableViewDataSourceDelegate configureWithUser:user];
        [self.tableView reloadData];
    }];

}

@end
