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
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"points" ascending:NO];
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
    
    long index = indexPath.row;
    Friend *friend = self.all[index];
    cell.backgroundColor = [UIColor colorWithRed:167.0/255.0 green:201.0/255.0 blue:224.0/255.0 alpha:1];
    UILabel *rankLbl = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                                5,
                                                                40,
                                                                40)];
    rankLbl.text = [NSString stringWithFormat:@"%ld", index+1];
    
    UILabel *nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(50,
                                                                 5,
                                                                 200,
                                                                 cell.frame.size.height-10)];
    nameLbl.text = friend.name;
    nameLbl.font = [UIFont systemFontOfSize:15.0 weight:2.0];
    
    UILabel *ptsLbl = [[UILabel alloc] initWithFrame:CGRectMake(nameLbl.frame.origin.x+nameLbl
                                                                .frame.size.width,
                                                                5,
                                                                80,
                                                                cell.frame.size.height-10)];
    ptsLbl.text = [NSString stringWithFormat:@"%d pts", friend.points+1500];

    if (index == 7) {
        cell.backgroundColor = [UIColor colorWithRed:150.0/255.0 green:190.0/255.0 blue:200.0/255.0 alpha:1];
        rankLbl.frame = CGRectMake(-cell.frame.size.height/3, 5, cell.frame.size.height, cell.frame.size.height);
        rankLbl.backgroundColor = [UIColor whiteColor];
        rankLbl.layer.cornerRadius = rankLbl.frame.size.width/2;
        rankLbl.clipsToBounds = YES;
        rankLbl.text = [NSString stringWithFormat:@"%ld \t", index+1];
        rankLbl.textAlignment = NSTextAlignmentRight;
        rankLbl.font = [UIFont systemFontOfSize:20.0];
        nameLbl.textColor = [UIColor whiteColor];
        nameLbl.font = [UIFont systemFontOfSize:20.0 weight:2.0];
        ptsLbl.frame = CGRectMake(nameLbl.frame.origin.x+nameLbl.frame.size.width, 5, 150, cell.frame.size.height-10);
        ptsLbl.font = [UIFont systemFontOfSize:20.0 weight:5.0];
        ptsLbl.textColor = [UIColor colorWithRed:59.0/255.0 green:95.0/255.0 blue:41.0/255.0 alpha:1];
    }
    
    [cell addSubview:rankLbl];
    [cell addSubview:nameLbl];
    [cell addSubview:ptsLbl];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.all.count + 1;
    return self.all.count;
}

@end
