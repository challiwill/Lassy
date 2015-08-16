#import <Foundation/Foundation.h>

@interface FacebookClient : NSObject

@property (nonatomic, readonly) NSURLSession *urlSession;
@property (nonatomic, readonly) NSOperationQueue *mainQueue;

- (instancetype)initWithURLSession:(NSURLSession *)urlSession andOperationQueue:(NSOperationQueue *)mainQueue;
//- (void) fetchFriendsWithSuccessBlock:(void (^)(NSArray *))successBlock;

@end
