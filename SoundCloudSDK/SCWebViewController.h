//
//  SCWebViewController.h
//  SoundCloudSDK
//
//  Created by Nicholas Tau on 3/30/15.
//  Copyright (c) 2015 demo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^authorizedDoneBlock) (NSString* code);
@interface SCWebViewController : UIViewController
-(id)initWithURL:(NSURL *)URL;
@property (nonatomic,copy) authorizedDoneBlock authrizedblock;
@end
