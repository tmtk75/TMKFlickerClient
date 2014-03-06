//
//  FlickrClient.m
//  toody
//
//  Created by Tomotaka Sakuma on 2014/02/15.
//  Copyright (c) 2014 tomotaka.sakuma. All rights reserved.
//

#import "FlickrClient.h"
#import "FlickrPhoto.h"
#import <ReactiveCocoa.h>
#import <Mantle.h>

@interface FlickrClient()
{
    NSString *_key;
    NSString *_secret;
    NSURLSession *_session;
}
@property (nonatomic, strong) NSArray *photos;
@end

@implementation FlickrClient

+ (instancetype)sharedInstance
{
    static id _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

- (id)initWithKey:(NSString *)key secret:(NSString *)secret
{
    _key = key;
    _secret = secret;
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _session = [NSURLSession sessionWithConfiguration:config];
    
    return [super init];
}

- (void)start
{
    NSString *keyworkd = @"cat";
    NSString *text = keyworkd;
    NSString *tag = keyworkd;
    NSString *urlString = @"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&tags=%@&format=json&nojsoncallback=1";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:urlString, _key, text, tag]];
    
    RACSubject *signal = [[RACSubject alloc] init];
    
    NSURLSessionDataTask *dataTask = [_session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSError *jsonError = nil;
            id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
            if (!jsonError) {
                [signal sendNext:json];
            } else {
                abort();
            }
        } else {
            abort();
        }
        [signal sendCompleted];
    }];
    [dataTask resume];
    
    [signal subscribeNext:^(NSDictionary *item) {
        RACSequence *photo = [item[@"photos"][@"photo"] rac_sequence];
        self.photos = [[photo map:^id(NSDictionary *v) {
            return [MTLJSONAdapter modelOfClass:[FlickrPhoto class] fromJSONDictionary:v error:nil];
        }] array];
    }];
}

@end
