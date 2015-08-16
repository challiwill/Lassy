#import <Foundation/Foundation.h>
#import "User.h"

@interface BackendClient : NSObject

@property (nonatomic, readonly) NSURLSession *urlSession;
@property (nonatomic, readonly) NSOperationQueue *mainQueue;

- (instancetype)initWithURLSession:(NSURLSession *)urlSession andOperationQueue:(NSOperationQueue *)mainQueue;
- (void) fetchFriendsWithSuccessBlock:(void (^)(NSArray *))successBlock;
- (void) fetchUserWithID:(NSString *)id andWithSuccessBlock:(void (^) (User *))successBlock;

@end
