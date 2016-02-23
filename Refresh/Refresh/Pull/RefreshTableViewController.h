//
//  RefreshTableViewController.h
//  Refresh
//
//  Created by Ansel on 16/2/21.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshTableViewController : RefreshViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
