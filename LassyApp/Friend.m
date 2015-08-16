#import "Friend.h"

@interface Friend ()

@property (nonatomic) NSString *name;
@property (nonatomic) int points;
@property (nonatomic) NSString *fid;

@end

@implementation Friend

- (instancetype)initWithName:(NSString *) name andPoints:(int) points andFacebookID:(NSString *)fid
{
    self = [super init];
    if (self) {
        self.name = name;
        self.points = points;
    }
    return self;
}

@end