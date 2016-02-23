//
//  RefreshScrollViewViewController.h
//  Refresh
//
//  Created by Ansel on 16/2/23.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshWebViewViewController : RefreshViewController <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end
