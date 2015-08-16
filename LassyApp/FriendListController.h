#import <UIKit/UIKit.h>

@class BackendClient;

@interface FriendListController : UIViewController

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, readonly) BackendClient *backendClient;

- (instancetype)initWithBackendClient:(BackendClient *)backendClient;

@end

