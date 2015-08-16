#import "User.h"

@interface User ()

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *points;
@property (nonatomic) NSString *fid;

@end

@implementation User

- (instancetype)initWithName:(NSString *) name andPoints:(NSString *) points andFacebookID:(NSString *)fid
{
    self = [super init];
    if (self) {
        self.name = name;
        self.points = points;
        self.fid = fid;
    }
    return self;
}

@end