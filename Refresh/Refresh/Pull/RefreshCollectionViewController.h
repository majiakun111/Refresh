//
//  RefreshCollectionViewController.h
//  Refresh
//
//  Created by Ansel on 16/2/23.
//  Copyright © 2016年 PingAn. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshCollectionViewController : RefreshViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
