//
//  SCNetwork.m
//  SoundCloudSDK
//
//  Created by Nicholas Tau on 3/30/15.
//  Copyright (c) 2015 demo. All rights reserved.
//

#import "SCNetwork.h"
#import <AFNetworking.h>
#import "SCWebViewController.h"

NSString * const SCURL = @"https://api.soundcloud.com/";

@interface SCNetwork()
@property (nonatomic, copy) NSString * appId;
@property (nonatomic, copy) NSString * appSecret;
@property (nonatomic, copy) NSString * appRedirectURI;
@end
@implementation SCNetwork

+(void)initManagerWithAppId:(NSString *)appId
                  appSecret:(NSString *)appSecret
                redirectURI:(NSString *)redirectURI
{
    SCNetwork * network = [SCNetwork manager];
    network.appId = appId;
    network.appSecret = appSecret;
    network.appRedirectURI = redirectURI;
}

-(void)showModalAuthViewController
{
    NSString * URLString =
    [NSString stringWithFormat:@"https://soundcloud.com/connect?client_id=%@&redirect_uri=%@&response_type=code&display=popup",self.appId,self.appRedirectURI];
    SCWebViewController * webViewController =
    [[SCWebViewController alloc] initWithURL:[NSURL URLWithString:URLString]];
    UINavigationController * naviController =
    [[UINavigationController alloc] initWithRootViewController:webViewController];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:naviController
                                                                                 animated:YES
                                                                               completion:nil];
}

-(void)shareAudioAssetsWithURL:(NSURL *)assetURL
                      coverURL:(UIImage *)coverURL
                         block:(requestDoneBlock)block
{
    
}

@end
