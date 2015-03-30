//
//  SCNetwork.h
//  SoundCloudSDK
//
//  Created by Nicholas Tau on 3/30/15.
//  Copyright (c) 2015 demo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFHTTPRequestOperationManager.h>

extern NSString * const SCURL;

typedef void (^requestDoneBlock)(id responseObject, NSError * error);
@interface SCNetwork : AFHTTPRequestOperationManager
+(void)initManagerWithAppId:(NSString *)appId
                  appSecret:(NSString *)appSecret
                redirectURI:(NSString *)redirectURI;
-(void)showModalAuthViewController;
-(void)shareAudioAssetsWithURL:(NSURL *)assetURL
                      coverURL:(UIImage *)coverURL
                         block:(requestDoneBlock)block;
@end
