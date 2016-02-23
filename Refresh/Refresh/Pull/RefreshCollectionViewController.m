//
//  RefreshCollectionViewController.m
//  Refresh
//
//  Created by Ansel on 16/2/23.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "RefreshCollectionViewController.h"

@implementation RefreshCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self startRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (UICollectionView *)createCollectionView
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    [self.view addSubview:_collectionView];
    
    return _collectionView;
}

#pragma mark - Property

- (UIScrollView *)scrollView
{
    if (nil == _scrollView) {
        _scrollView = [self createCollectionView];
    }
    
    return _scrollView;
}

- (NSMutableArray *)dataArray
{
    if (nil == _dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    
    return _dataArray;
}

#pragma mark - Override

- (void)doRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"]];
        
        [self reloadData];
        
        [self stopRefreshing];
    });
}

- (void)loadMore
{
    static int count = 0;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (count <= 2) {
            [self.dataArray addObjectsFromArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"]];
            
            [self reloadData];
            [self stopLoading];
        }
        else {
            [self stopLoading];
            [self setHasMore:NO];
        }
    });
    
    count++;
}

- (void)reloadData
{
    [self.collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   return [self.dataArray count];
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *label = [cell viewWithTag:10000];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        label.textColor = [UIColor redColor];
        [label setTag:1000];
        [cell.contentView addSubview:label];
        [cell setBackgroundColor:[UIColor blueColor]];
    }
    label.text = @"1"; //self.dataArray[indexPath.row];

    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
