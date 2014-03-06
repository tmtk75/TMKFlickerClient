//
//  TMKFlickrPhoto.h
//  TMKFlickrClient
//
//  Created by Tomotaka Sakuma on 2014/02/15.
//  Copyright (c) 2014 tomotaka.sakuma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface TMKFlickrPhoto : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *photoId;   // "12533014324"
@property (nonatomic, strong) NSString *owner;  // "90686080@N04"
@property (nonatomic, strong) NSString *secret;  // "ba325369a5"
@property (nonatomic, strong) NSString *server;  // "3777"
@property (nonatomic, strong) NSNumber *farm;  // 4
@property (nonatomic, strong) NSString *title;  // "Help"
@property (nonatomic, strong) NSNumber *ispublic;  // 1
@property (nonatomic, strong) NSNumber *isfriend;  // 0
@property (nonatomic, strong) NSNumber *isfamily;  // 0
@end
