#import "FriendListDataSourceDelegate.h"
#import "Friend.h"
#import "User.h"

NSString *const friendCellIdentifier = @"friendCellIdentifier";

@interface FriendListDataSourceDelegate ()

@property (nonatomic) NSArray *friends;
@property (nonatomic) NSArray *all;
@property (nonatomic) User *user;

@end

@implementation FriendListDataSourceDelegate

- (void)configureWithAll: (NSArray *)all {
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"points" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObjects:valueDescriptor, nil];
    NSArray *sortedArray = [all sortedArrayUsingDescriptors:descriptors];

    self.all = sortedArray;
}

- (void)configureWithFriends: (NSArray *)friends {
    self.friends = friends;
}

- (void)configureWithUser: (User *)user {
    self.user = user;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendCellIdentifier];

//    if ([self.all count] == 0) {
//        cell.textLabel.text = self.user.name;
//    } else {
        long index = indexPath.row;
        Friend *friend = self.all[index];
//        if (friend.points < self.user.points) {
//            cell.textLabel.text = self.user.name;
//        } else {
        NSLog(@"name: %@", friend.name);
        NSLog(@"points: %i", friend.points);
        cell.textLabel.text = friend.name;
//        }
//    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.all.count + 1;
    return self.all.count;
}

@end
