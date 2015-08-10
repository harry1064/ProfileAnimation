//
//  ViewController.h
//  ProfileAnimation
//
//  Created by Harpreet singh on 09/08/15.
//  Copyright (c) 2015 Harpreet singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *postLsitVie;
@property (weak, nonatomic) IBOutlet UICollectionView *bucketListView;

@end

