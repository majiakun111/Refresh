//
//  RefreshScrollViewViewController.m
//  Refresh
//
//  Created by Ansel on 16/2/23.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "RefreshWebViewViewController.h"

@implementation RefreshWebViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)createWebView
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_webView setBackgroundColor:[UIColor blueColor]];
    [_webView setDelegate:self];
    
    NSURL *url = [NSURL URLWithString:@"http://www.csdn.net"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:_webView];
    
    return _webView.scrollView;
}

- (void)buildUI
{
    [super buildUI];
    
    [self setHasMore:NO];
}

#pragma mark - Property

- (UIScrollView *)scrollView
{
    if (nil ==_webView.scrollView) {
        return [self createWebView];
    }
    
    return _webView.scrollView;
}

#pragma mark - Override

- (void)doRefresh
{
    [_webView reload];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self stopRefreshing];
}

@end
