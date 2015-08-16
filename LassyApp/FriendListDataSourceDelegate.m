#import "FriendListDataSourceDelegate.h"
#import "Friend.h"
#import "User.h"

NSString *const friendCellIdentifier = @"friendCellIdentifier";

@interface FriendListDataSourceDelegate ()

@property (nonatomic) NSArray *friends;
@property (nonatomic) User *user;

@end

@implementation FriendListDataSourceDelegate

- (void)configureWithFriends: (NSArray *)friends {
    self.friends = friends;
}

- (void)configureWithUser: (User *)user {
    self.user = user;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendCellIdentifier];

    if ([self.friends count] == 0) {
        cell.textLabel.text = self.user.name;
    } else {
        long index = indexPath.row;
        Friend *friend = self.friends[index];
        if (friend.points < self.user.points) {
            cell.textLabel.text = self.user.name;
        } else {
            cell.textLabel.text = friend.name;
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count + 1;
}

@end
