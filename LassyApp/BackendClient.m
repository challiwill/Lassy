#import "BackendClient.h"
#import "Friend.h"
#import "User.h"

@interface BackendClient ()

@property (nonatomic) NSURLSession *urlSession;
@property (nonatomic) NSOperationQueue *mainQueue;

@end


@implementation BackendClient

- (instancetype)initWithURLSession:(NSURLSession *)urlSession andOperationQueue:(NSOperationQueue *)mainQueue
{
    self = [super init];
    if (self) {
        self.urlSession = urlSession;
        self.mainQueue = mainQueue;
    }
    return self;
}

- (void) fetchAllWithSuccessBlock:(void (^)(NSArray *))successBlock {
    NSString *urlString = [NSString stringWithFormat:@"https://makeitrain-sf.herokuapp.com/users/"];
    NSURL *requestURL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestURL];
    NSURLSessionDataTask *task = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *parseError;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
        NSMutableArray *friends = [[NSMutableArray alloc] init];
        for (NSDictionary *friendDictionary in jsonArray) {
            Friend *friend = [[Friend alloc] initWithName:[friendDictionary valueForKey:@"name"] andPoints:[[friendDictionary valueForKey:@"points"] intValue] andFacebookID:[friendDictionary valueForKey:@"fb_id"]];
            [friends addObject:friend];
        }
        [self.mainQueue addOperationWithBlock: ^{
            successBlock(friends);
        }];
    }];
    [task resume];
}

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
//- (void) fetchUserWithID:(NSString *) fid andWithSuccessBlock:(void (^) (User *))successBlock {
//    
//    NSString *urlString = [NSString stringWithFormat:@"https://makeitrain-sf.herokuapp.com/users/%@", fid];
//    NSURL *requestURL = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestURL];
//    NSURLSessionDataTask *task = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        NSError *parseError;
//        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
//        User *user;
//        user = [[User alloc] initWithName:[jsonArray valueForKey:@"name"] andPoints:[jsonArray valueForKey:@"points"] andFacebookID:fid];
//        [self.mainQueue addOperationWithBlock: ^{
//            successBlock(user);
//        }];
//    }];
//    [task resume];
//}

@end
