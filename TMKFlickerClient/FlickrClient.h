//
//  FlickrClient.h
//  toody
//
//  Created by Tomotaka Sakuma on 2014/02/15.
//  Copyright (c) 2014 tomotaka.sakuma. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RACSignal, FlickrPhoto;


@interface FlickrClient : NSObject

@property (nonatomic, readonly) NSArray *photos;
- (id)initWithKey:(NSString *)key secret:(NSString *)secret;
- (void)start;
+ (instancetype)sharedInstance;

@end
