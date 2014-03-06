//
//  TMKFlickrPhoto.m
//  TMKFlickrClient
//
//  Created by Tomotaka Sakuma on 2014/02/15.
//  Copyright (c) 2014 tomotaka.sakuma. All rights reserved.
//

#import "TMKFlickrPhoto.h"

@implementation TMKFlickrPhoto
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"photoId": @"id",
             @"owner": @"owner",
             @"secret": @"secret",
             @"server": @"server",
             @"farm": @"farm",
             @"title": @"title",
             @"ispublic": @"ispublic",
             @"isfriend": @"isfriend",
             @"isfamily": @"isfamily",
             };
}
@end

