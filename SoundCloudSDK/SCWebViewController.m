//
//  SCWebViewController.m
//  SoundCloudSDK
//
//  Created by Nicholas Tau on 3/30/15.
//  Copyright (c) 2015 demo. All rights reserved.
//

#import "SCWebViewController.h"
#import <NJKWebViewProgress.h>
#import <NJKWebViewProgressView.h>

@interface SCWebViewController()
<UIWebViewDelegate, NJKWebViewProgressDelegate>
{
    __weak UIWebView *_webView;
    NSURL * _loadURL;
    NJKWebViewProgressView *_progressView;
    NJKWebViewProgress *_progressProxy;
}
@end

@implementation SCWebViewController

-(id)initWithURL:(NSURL *)URL
{
    if (self=[super init]) {
        _loadURL = URL;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIWebView * webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    [webView loadRequest:[[NSURLRequest alloc] initWithURL:_loadURL]];
    _webView = webView;
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Remove progress view
    // because UINavigationBar is shared with other ViewControllers
    [_progressView removeFromSuperview];
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.absoluteString isEqual:@"http://eumlab.com"]) {
        if (self.authrizedblock) {
            self.authrizedblock(request.URL.absoluteString);
        }
        return NO;
    }
    return YES;
}

@end
