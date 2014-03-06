//
//  TMKFlickrClient.h
//  TMKFlickrClient
//
//  Created by Tomotaka Sakuma on 2014/02/15.
//  Copyright (c) 2014 tomotaka.sakuma. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TMKFlickrPhoto;


@interface TMKFlickrClient : NSObject

@property (nonatomic, readonly) NSArray *photos;
- (id)initWithKey:(NSString *)key secret:(NSString *)secret;
- (void)start;
+ (instancetype)sharedInstance;

@end
