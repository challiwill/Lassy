#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *points;
@property (nonatomic, readonly) NSString *fid;

- (instancetype)initWithName:(NSString *) name andPoints:(NSString *) points andFacebookID:(NSString *)fid;

@end
