//
//  FeedTableViewCell.h
//  Buckett
//
//  Created by Anmol Rajdev on 08/06/15.
//  Copyright (c) 2015 Anmol Rajdev. All rights reserved.
//

#import <UIKit/UIKit.h>

//---------------Saturaday  work ------------------------------------------------------
@protocol FeedTableCellDelegate <NSObject>

-(void)pushLikeViewController:(NSInteger)index;
-(void)pushCommentViewController:(NSInteger)index;
-(void)pushBucketListViewController:(NSInteger)index;

-(void)singleTappedImage:(NSInteger)imageIndex;
@end

@interface FeedTableViewCell : UITableViewCell<UIGestureRecognizerDelegate>
{
    id<FeedTableCellDelegate> delegate;
}
@property (retain) id<FeedTableCellDelegate> delegate;
- (IBAction)UsernameBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *reviewlabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *postImg_height_constraint;
@property (weak, nonatomic) IBOutlet UIImageView *user_profile_img;
@property (weak, nonatomic) IBOutlet UIImageView *feed_img;
@property (weak, nonatomic) IBOutlet UILabel *feedLikeLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedCommentLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstnamelabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;
@property (weak, nonatomic) IBOutlet UILabel *bucketlistlabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


- (IBAction)likeLabelbuttonClicked:(id)sender;
- (IBAction)commentLabelButtonClicked:(id)sender;
- (IBAction)bucketlistButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *CommentBtn;
@property (weak, nonatomic) IBOutlet UIButton *bucketBtn;

//-----------------------------------------------------------------------------------------
- (IBAction)usernameClicked:(id)sender;
@end
