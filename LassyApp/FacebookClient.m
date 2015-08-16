#import "FacebookClient.h"
#import "Friend.h"
#import "User.h"

@interface FacebookClient ()

@property (nonatomic) NSURLSession *urlSession;
@property (nonatomic) NSOperationQueue *mainQueue;

@end


@implementation FacebookClient

- (instancetype)initWithURLSession:(NSURLSession *)urlSession andOperationQueue:(NSOperationQueue *)mainQueue
{
    self = [super init];
    if (self) {
        self.urlSession = urlSession;
        self.mainQueue = mainQueue;
    }
    return self;
}
//
//- (void) fetchFriendsWithSuccessBlock:(void (^)(NSArray *))successBlock {
//    NSURL *requestURL = [NSURL URLWithString:@""];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestURL];
//    NSURLSessionDataTask *task = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSError *parseError;
//        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
//        NSMutableArray *friends = [[NSMutableArray alloc] init];
//        for (NSDictionary *friendDictionary in jsonArray) {
//            Friend *friend = [[Friend alloc] initWithName:[friendDictionary valueForKey:@"name"] andPoints:[friendDictionary valueForKey:@"points"] andFacebookID:[friendDictionary valueForKey:@"fb_id"]];
//            [friends addObject:friend];
//        }
//        [self.mainQueue addOperationWithBlock: ^{
//            successBlock(friends);
//        }];
//    }];
//    [task resume];
//}
//
@end
