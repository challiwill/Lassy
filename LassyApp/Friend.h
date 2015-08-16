#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) int points;
@property (nonatomic, readonly) NSString *fid;

- (instancetype)initWithName:(NSString *) name andPoints:(int) points andFacebookID:(NSString *)fid;

@end
